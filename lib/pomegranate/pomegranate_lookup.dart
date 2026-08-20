import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:pointycastle/export.dart';

import '../core/nostr_core_repository.dart';
import '../nostr/nostr.dart';
import '../utils/utils.dart';
import 'pomegranate_helpers.dart';

/// Cross-central discovery (Pomegranate spec step 5): find which central an
/// email already registered with, and publish our own record so other clients
/// can do the same.

/// Sends a signed event to [relays]. Supplied by the caller so this file stays
/// independent of any app's event-sending repository.
typedef PomEventPublisher =
    Future<void> Function(Event event, List<String> relays);

// Fixed by the Pomegranate spec: argon2id(email, "pomegranate", {t:1, m:65536, p:4}).
// Any deviation yields a hash that matches no event, which is indistinguishable
// from "no account found elsewhere" — so these must not be tuned.
const _kSalt = 'pomegranate';
const _kIterations = 1;
const _kMemoryKiB = 65536;
const _kLanes = 4;
const _kHashLength = 32;

String _argon2idEmailTag(String email) {
  final derivator = Argon2BytesGenerator()
    ..init(
      Argon2Parameters(
        Argon2Parameters.ARGON2_id,
        Uint8List.fromList(utf8.encode(_kSalt)),
        desiredKeyLength: _kHashLength,
        iterations: _kIterations,
        memory: _kMemoryKiB,
        lanes: _kLanes,
      ),
    );
  final out = derivator.process(Uint8List.fromList(utf8.encode(email)));
  return out.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
}

/// The `m` tag value used to find a user's kind 16440 setup event.
///
/// The email is hashed verbatim, as every other client does — normalising it
/// here would break discovery against events they published, and against ours.
/// 64 MiB of argon2 blocks the isolate it runs on, hence [compute].
Future<String> pomEmailTag(String email) => compute(_argon2idEmailTag, email);

/// Publishes the kind 16440 event that lets any client discover which central
/// this email registered with. Without it our own users are invisible to the
/// cross-central lookup — including to this app after a reinstall.
///
/// Best-effort: the account is already usable without it, so failures are
/// reported through [onError] rather than thrown.
Future<void> pomPublishSetup({
  required PomEventPublisher publishEvent,
  required String central,
  required List<String> operators,
  required int threshold,
  required String email,
  required EventSigner signer,
  void Function(Object error)? onError,
}) async {
  try {
    final event = await Event.genEvent(
      kind: EventKind.POMEGRANATE_SETUP,
      tags: [
        ['m', await pomEmailTag(email)],
        ['central', central],
        for (final operator in operators) ['operator', operator],
        ['threshold', threshold.toString()],
      ],
      content: '',
      signer: signer,
    );

    if (event != null) {
      await publishEvent(event, kPomLookupRelays);
    }
  } catch (e) {
    onError?.call(e);
  }
}

Future<void> pomDeleteSetup({
  required NostrCore nc,
  required PomEventPublisher publishEvent,
  required EventSigner signer,
  void Function(Object error)? onError,
}) async {
  try {
    final pubkey = signer.getPublicKey();

    final ids = <String>{};
    await nc.doQuery(
      [
        Filter(
          kinds: [EventKind.POMEGRANATE_SETUP],
          authors: [pubkey],
          limit: 10,
        ),
      ],
      kPomLookupRelays,
      timeOut: 5,
      source: EventsSource.relays,
      // Relays can hold different versions of a replaceable event, and each
      // version is its own id — delete every one they still serve.
      eventCallBack: (event, relay) => ids.add(event.id),
    );

    if (ids.isEmpty) {
      return;
    }

    final deletion = await Event.genEvent(
      kind: EventKind.EVENT_DELETION,
      tags: [
        for (final id in ids) ['e', id],
        ['k', EventKind.POMEGRANATE_SETUP.toString()],
      ],
      content: '',
      signer: signer,
    );

    if (deletion != null) {
      await publishEvent(deletion, kPomLookupRelays);
    }
  } catch (e) {
    onError?.call(e);
  }
}

Future<List<PomSetup>> pomLookupSetups(
  NostrCore nc,
  String email, {
  void Function(Object error)? onError,
}) async {
  try {
    final mTag = await pomEmailTag(email);

    final byPubkey = <String, Event>{};
    await nc.doQuery(
      [
        Filter(kinds: [EventKind.POMEGRANATE_SETUP], m: [mTag], limit: 200),
      ],
      kPomLookupRelays,
      timeOut: 5,
      source: EventsSource.relays,
      eventCallBack: (event, relay) {
        final seen = byPubkey[event.pubkey];
        if (seen == null || event.createdAt > seen.createdAt) {
          byPubkey[event.pubkey] = event;
        }
      },
    );

    final events = byPubkey.values.toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    final setups = <PomSetup>[];
    final seenCentrals = <String>{};
    for (final event in events) {
      String? central;
      int? threshold;
      final operators = <String>[];
      for (final tag in event.tags) {
        if (tag.length < 2) {
          continue;
        }
        switch (tag[0]) {
          case 'central':
            central = tag[1];
          case 'operator':
            operators.add(tag[1]);
          case 'threshold':
            threshold = int.tryParse(tag[1]);
        }
      }

      // Also drops the localhost and plain-http centrals other people's test
      // registrations leave in this tag space, unreachable from a phone.
      // Normalising is what makes the dedup below hold — publishers differ on
      // the trailing slash.
      final url = central == null ? null : pomNormaliseUrl(central);
      if (url == null) {
        continue;
      }

      // `events` is newest-first, so the first setup seen for a central is the
      // only one that can still map to a live account.
      if (!seenCentrals.add(url)) {
        continue;
      }

      // Older events carry only a central; the operator set is then unknown
      // and must come from that central's /account.
      setups.add(
        PomSetup(
          central: url,
          operators: operators,
          threshold: threshold ?? 0,
          pubkey: event.pubkey,
        ),
      );
    }

    return setups;
  } catch (e) {
    onError?.call(e);
    return const [];
  }
}

/// The most recently registered identity for [email], or null if there is
/// none. Callers that let the user choose want [pomLookupSetups].
Future<PomSetup?> pomLookupSetup(
  NostrCore nc,
  String email, {
  void Function(Object error)? onError,
}) async => (await pomLookupSetups(nc, email, onError: onError)).firstOrNull;
