import 'dart:convert';
import 'dart:typed_data';

import 'package:bip340/bip340.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

import '../nostr/nostr.dart';
import '../utils/utils.dart';
import 'pomegranate_crypto.dart';
import 'pomegranate_lookup.dart';

/// Protocol-level implementation of fiatjaf's Pomegranate spec: the HTTP
/// surface of a central and its operators, plus the types the apps persist.
///
/// Deliberately holds **no deployment policy** — which central is the default
/// and which operators are offered are app-level constants, because they
/// legitimately differ between clients (and between an app's old and new
/// account generations). Everything here is spec, not preference.
///
/// The `Dio` instance is supplied by the caller so this file stays free of any
/// app's HTTP repository, cookie jar or API-key headers.

/// Supplies the configured HTTP client. Both apps hand over
/// `HttpFunctionsRepository.getDio`, whose cookie jar the OAuth handshake
/// depends on.
typedef PomDioProvider = Future<Dio> Function();

/// Where kind 16440 setup events are looked up. Fixed rather than taken from
/// the user's relay list: the lookup runs before login, when there is none.
const kPomLookupRelays = [
  'wss://nos.lol',
  'wss://relay.primal.net',
  'wss://relay.damus.io',
  'wss://relay.nostr.band',
];

/// The central a new account is created on unless the user picks another.
const kPomCentralUrl = 'https://auth.njump.me';

/// Offered alongside [kPomCentralUrl] in the server picker.
const kPomBackupCentralUrl = 'https://auth.yakihonne.com';

/// Every operator the Yaki clients offer. The advanced panel lists the
/// unselected ones as recommended additions, and recovery falls back to this
/// list when an account has no persisted [PomSetup].
///
/// An app may extend this for recovery — see mobile-app's
/// `kPomRecoveryOperatorUrls`, which appends operators used by an earlier
/// account generation. Do not remove entries: an account registered against
/// one is unrecoverable without it in the fallback list.
const kPomOperatorUrls = [
  'https://po.yakihonne.com',
  'https://po.jumble.social',
  'https://po.njump.me',
  'https://po.f7z.io',
];

/// What a new account registers with unless the user changes it. 2-of-3 matches
/// what the rest of the ecosystem publishes, and keeps recovery to two operator
/// round-trips — each one is a full Google re-auth.
const kPomDefaultOperatorUrls = [
  'https://po.yakihonne.com',
  'https://po.jumble.social',
  'https://po.njump.me',
];

const kPomDefaultThreshold = 2;

/// Operator URLs as a real `List<String>`.
///
/// `/account` returns them as objects — `{"url": ..., "pubshard": ...}` —
/// while kind 16440 tags carry plain strings. `cast<String>()` accepts the
/// object form silently and only throws later inside `jsonEncode`, far from
/// the cause.
List<String> pomOperatorList(dynamic raw) {
  if (raw is! List) {
    return const [];
  }
  return raw
      .map((e) {
        if (e is String) {
          return e;
        }
        if (e is Map) {
          return (e['url'] ?? '').toString();
        }
        return '';
      })
      .where((e) => e.isNotEmpty)
      .toList();
}

enum PomStep {
  preparingKey,
  splittingSecret,
  registeringCentral,
  registeringOperator,
  publishingSetup,
  confirmingAccount,
}

class PomToken {
  const PomToken({
    required this.raw,
    required this.email,
    required this.createdAt,
  });
  final String raw;
  final String email;
  final int createdAt;
}

/// Which central an account lives on, and the operator set guarding its key.
///
/// Persisted with the key: recovery needs the same central and the same
/// operator/threshold pair the account was actually registered with, which
/// varies per client and is user-configurable.
class PomSetup {
  const PomSetup({
    required this.central,
    required this.operators,
    required this.threshold,
    this.pubkey,
  });

  factory PomSetup.fromJson(Map<String, dynamic> json) => PomSetup(
        central: json['central'] as String,
        operators: pomOperatorList(json['operators']),
        threshold: (json['threshold'] as num).toInt(),
      );

  final String central;
  final List<String> operators;
  final int threshold;

  /// Author of the discovered setup event — the identity registered on
  /// [central]. Only set by lookup; unknown when the setup came from an
  /// account response, so it is never persisted.
  final String? pubkey;

  Map<String, dynamic> toJson() => {
        'central': central,
        'operators': operators,
        'threshold': threshold,
      };
}

/// Normalised central/operator URL, or null when [raw] is not a usable https
/// address.
///
/// Used to gate sign-in: an invalid value must never reach OAuth.
String? pomNormaliseUrl(String raw) {
  final trimmed = raw.trim();
  if (trimmed.isEmpty) {
    return null;
  }

  final withScheme = trimmed.contains('://') ? trimmed : 'https://$trimmed';
  final uri = Uri.tryParse(withScheme);
  if (uri == null || uri.scheme != 'https' || uri.host.isEmpty) {
    return null;
  }

  // A single label ('po') parses as a valid host, so sign-in would light up
  // mid-typing and OAuth against a URL that cannot resolve.
  final labels = uri.host.split('.');
  if (labels.length < 2 || labels.any((l) => l.isEmpty)) {
    return null;
  }

  // Trailing slash would double up when concatenated with '/account' etc.
  return '${uri.scheme}://${uri.authority}';
}

/// Decodes an nsec or 64-char hex private key to hex, or null when invalid.
///
/// Trust boundary: a malformed key here would be silently sharded to the
/// operators and the account made unrecoverable, so both the encoding and the
/// secp256k1 range are checked.
String? pomParsePrivateKey(String input) {
  final trimmed = input.trim();
  if (trimmed.isEmpty) {
    return null;
  }

  String hex;
  if (trimmed.startsWith('nsec')) {
    try {
      hex = Nip19.decodePrivkey(trimmed);
    } catch (_) {
      return null;
    }
    if (hex.isEmpty) {
      return null;
    }
  } else {
    hex = trimmed.toLowerCase();
  }

  if (hex.length != 64 || !RegExp(r'^[0-9a-f]{64}$').hasMatch(hex)) {
    return null;
  }

  // Must be a valid scalar: 0 < key < curve order.
  final value = BigInt.parse(hex, radix: 16);
  final order = BigInt.parse(
    'fffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364141',
    radix: 16,
  );
  if (value <= BigInt.zero || value >= order) {
    return null;
  }

  return hex;
}

PomToken? parsePomToken(String raw) {
  try {
    final decoded = utf8.decode(base64.decode(base64.normalize(raw)));
    final json = jsonDecode(decoded) as Map<String, dynamic>;
    final createdAt = (json['created_at'] as num?)?.toInt() ?? 0;
    String email = '';
    final tags = json['tags'] as List?;
    if (tags != null) {
      for (final tag in tags) {
        if (tag is List && tag.length >= 2 && tag[0] == 'email') {
          email = tag[1] as String;
          break;
        }
      }
    }
    return PomToken(raw: raw, email: email, createdAt: createdAt);
  } catch (_) {
    return null;
  }
}

bool isPomTokenValid(PomToken token) {
  final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  return (now - token.createdAt) < 24 * 60 * 60;
}

/// The account's real operator set, as registered.
///
/// Returns null when the central omits them: the account exists but we don't
/// know which operators hold its shards. Guessing an app's own defaults would
/// send recovery to servers that never held a shard, asking for a threshold
/// the account never used — callers must handle the unknown case instead.
PomSetup? pomSetupFromAccount(String central, Map<String, dynamic> account) {
  final operators = pomOperatorList(account['operators']);
  final threshold = (account['threshold'] as num?)?.toInt();
  if (operators.isEmpty || threshold == null) {
    return null;
  }
  return PomSetup(central: central, operators: operators, threshold: threshold);
}

Future<Map<String, dynamic>?> pomGetAccount(
  PomDioProvider getDio,
  String central,
  PomToken token,
) async {
  try {
    final dio = await getDio();
    final res = await dio.get(
      '$central/account',
      options: Options(
        headers: {'Authorization': 'Token ${token.raw}'},
        validateStatus: (s) => s != null && s < 500,
      ),
    );
    if (res.statusCode == 404 || res.statusCode == 401) {
      return null;
    }
    if (res.statusCode == 200) {
      final data = res.data as Map<String, dynamic>?;
      if (data != null && data['pubkey'] != null) {
        return data;
      }
    }
    return null;
  } catch (_) {
    return null;
  }
}

/// Removes the account from the central. The caller must have the secret key
/// in hand first — afterwards Google sign-in no longer maps to any account.
Future<bool> pomDeleteAccount(
  PomDioProvider getDio,
  String central,
  PomToken token,
) async {
  final dio = await getDio();
  final res = await dio.delete(
    '$central/account',
    options: Options(
      headers: {'Authorization': 'Token ${token.raw}'},
      validateStatus: (s) => s != null && s < 500,
    ),
  );
  // The central returns either.
  return res.statusCode == 200 || res.statusCode == 204;
}

Future<List<dynamic>> pomListProfiles(
  PomDioProvider getDio,
  String central,
  PomToken token,
) async {
  final dio = await getDio();
  final res = await dio.get(
    '$central/profiles',
    options: Options(headers: {'Authorization': 'Token ${token.raw}'}),
  );
  if (res.statusCode != 200) {
    throw Exception('Failed to list profiles');
  }
  return res.data as List<dynamic>;
}

Future<Map<String, dynamic>> pomCreateProfile(
  PomDioProvider getDio,
  String central,
  PomToken token,
  String name,
) async {
  final dio = await getDio();
  final res = await dio.post(
    '$central/profiles',
    data: jsonEncode({'name': name}),
    options: Options(
      headers: {
        'Authorization': 'Token ${token.raw}',
        'Content-Type': 'application/json',
      },
    ),
  );
  if ((res.statusCode ?? 0) >= 400) {
    throw Exception('Profile creation failed');
  }
  return res.data as Map<String, dynamic>;
}

String pomGetBunkerUrl(String central, Map<String, dynamic> profile) {
  final relay = central
      .replaceFirst('https://', 'wss://')
      .replaceFirst('http://', 'ws://');
  final handlerPubkey = profile['handler_pubkey'] as String;
  return 'bunker://$handlerPubkey?relay=${Uri.encodeComponent(relay)}';
}

/// Shards [secretKeyHex] across [operators] and registers the account.
///
/// Throws unless at least [threshold] operators accept their shard — a partial
/// registration would leave an account that cannot be recovered.
Future<void> pomRegister({
  required PomDioProvider getDio,
  required PomEventPublisher publishEvent,
  required String central,
  required List<String> operators,
  required int threshold,
  required PomToken token,
  required String email,
  required String secretKeyHex,
  required String session,
  void Function(PomStep step, int? operatorIndex)? onProgress,
  void Function(int operatorIndex, bool ok)? onOperatorResult,
  void Function(Object error)? onPublishError,
}) async {
  final pubKeyHex = getPublicKey(secretKeyHex);
  final signer = Bip340EventSigner(secretKeyHex, pubKeyHex);

  onProgress?.call(PomStep.splittingSecret, null);

  final secretBigInt = bytesToBigInt(
    Uint8List.fromList(
      List.generate(
        secretKeyHex.length ~/ 2,
        (i) => int.parse(secretKeyHex.substring(i * 2, i * 2 + 2), radix: 16),
      ),
    ),
  );
  final shards = pomTrustedKeyDeal(secretBigInt, threshold, operators.length);

  // Build and send kind 20445 event to central
  final regEvent = await Event.genEvent(
    kind: EventKind.POMEGRANATE_REGISTRATION,
    tags: [
      ['threshold', threshold.toString()],
      for (int i = 0; i < operators.length; i++)
        ['operator', operators[i], pomHexPubShard(shards[i])],
    ],
    content: '',
    signer: signer,
  );

  if (regEvent == null) {
    throw Exception('Failed to build registration event');
  }

  onProgress?.call(PomStep.registeringCentral, null);

  final dio = await getDio();
  final regRes = await dio.post(
    '$central/register',
    data: jsonEncode(regEvent.toJson()),
    options: Options(
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token ${token.raw}',
        'X-Pomegranate-Session': session,
      },
    ),
  );
  if ((regRes.statusCode ?? 0) >= 400) {
    throw Exception(
      'Central server registration failed (${regRes.statusCode})',
    );
  }

  // Send kind 20444 to each operator, one at a time so progress is reportable.
  const utf8enc = Utf8Encoder();
  int successCount = 0;

  for (int i = 0; i < operators.length; i++) {
    final operator = operators[i];
    onProgress?.call(PomStep.registeringOperator, i);

    bool ok = false;
    final opEvent = await Event.genEvent(
      kind: EventKind.POMEGRANATE_SHARD,
      tags: [
        ['central', central],
        ['email', email],
      ],
      content: pomHexShard(shards[i]),
      signer: signer,
    );

    if (opEvent != null) {
      final sessionOpHash = sha256.convert(
        utf8enc.convert('$session:$operator'),
      );
      final opToken = sessionOpHash.bytes
          .map((b) => b.toRadixString(16).padLeft(2, '0'))
          .join();

      try {
        final opDio = await getDio();
        final res = await opDio.post(
          '$operator/po/register',
          data: jsonEncode(opEvent.toJson()),
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'X-Pomegranate-Operator-Token': opToken,
            },
            validateStatus: (s) => true,
          ),
        );
        ok = (res.statusCode ?? 0) < 300;
      } catch (_) {}
    }

    if (ok) {
      successCount++;
    }
    onOperatorResult?.call(i, ok);
  }

  if (successCount < threshold) {
    throw Exception(
      'Could not register with enough operators ($successCount/$threshold)',
    );
  }

  onProgress?.call(PomStep.publishingSetup, null);
  await pomPublishSetup(
    publishEvent: publishEvent,
    central: central,
    operators: operators,
    threshold: threshold,
    email: email,
    signer: signer,
    onError: onPublishError,
  );
}
