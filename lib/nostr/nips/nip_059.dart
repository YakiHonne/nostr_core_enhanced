import 'dart:convert';

import 'package:bip340/bip340.dart' as bip340;
import 'package:nostr_core_enhanced/nostr/event.dart';
import 'package:nostr_core_enhanced/nostr/event_signer/bip340_event_signer.dart';
import 'package:nostr_core_enhanced/nostr/event_signer/keychain.dart';
import 'package:nostr_core_enhanced/nostr/nips/nip_044.dart';
import 'package:nostr_core_enhanced/utils/static_properties.dart';

class Nip59 {
  static Future<Event> encode(
    Event event,
    String peerPubkey, {
    String? kind,
    int? expiration,
    int? createAt,
  }) async {
    String encodedEvent = jsonEncode(event);
    Keychain keychain = Keychain.generate();
    final sealedPrivkey = keychain.private;

    String myPubkey = bip340.getPublicKey(sealedPrivkey);
    String content = await Nip44.encryptContent(
      encodedEvent,
      peerPubkey,
      Bip340EventSigner(sealedPrivkey, myPubkey),
    );

    List<List<String>> tags = [
      ["p", peerPubkey]
    ];

    if (kind != null) tags.add(['k', kind]);
    if (expiration != null) tags.add(['expiration', '$expiration']);

    return (await Event.genEvent(
      kind: EventKind.GIFT_WRAP,
      tags: tags,
      content: content,
      createdAt: createAt ?? 0,
      signer: Bip340EventSigner(keychain.private, keychain.public),
    ))!;
  }

  static Future<Event> decode(
    Event event,
    String myPubkey,
    String privkey,
  ) async {
    if (event.kind == EventKind.GIFT_WRAP) {
      String content = await Nip44.decryptContent(
        event.content,
        event.pubkey,
        myPubkey,
        privkey,
      );

      Map<String, dynamic> map = jsonDecode(content);
      return Event.fromJson(map);
    }

    throw Exception("${event.kind} is not nip59 compatible");
  }
}
