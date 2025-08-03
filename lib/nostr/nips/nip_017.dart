import 'dart:convert';

import 'package:nostr_core_enhanced/nostr/nostr.dart';
import 'package:nostr_core_enhanced/utils/utils.dart';

class Nip17 {
  static Future<Event?> encode(
    Event event,
    String receiver,
    Bip340EventSigner signer, {
    int? kind,
    int? expiration,
    int? createAt,
  }) async {
    try {
      final sealedGossipEvent = await _encodeSealedGossip(
        event,
        receiver,
        signer,
      );

      if (sealedGossipEvent != null) {
        return await Nip59.encode(
          sealedGossipEvent,
          receiver,
          kind: kind?.toString(),
          expiration: expiration,
          createAt: Helpers.getUnixTimestampWithinTwoDays(),
        );
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<Event?> decode(
    Event event,
    Bip340EventSigner signer,
  ) async {
    try {
      Event sealedGossipEvent =
          await Nip59.decode(event, signer.publicKey, signer.privateKey!);

      Event decodeEvent = await _decodeSealedGossip(sealedGossipEvent, signer);
      return decodeEvent;
    } catch (e) {
      return null;
    }
  }

  static Future<Event?> _encodeSealedGossip(
    Event event,
    String receiver,
    Bip340EventSigner signer,
  ) async {
    event.sig = '';
    String encodedEvent = jsonEncode(event);
    String content = await Nip44.encryptContent(encodedEvent, receiver, signer);

    final ev = Event.genEvent(
      signer: signer,
      kind: EventKind.SEALED_EVENT,
      tags: [],
      content: content,
    );

    return ev;
  }

  static Future<Event> _decodeSealedGossip(
    Event event,
    Bip340EventSigner signer,
  ) async {
    if (event.kind == EventKind.SEALED_EVENT) {
      try {
        String content = await Nip44.decryptContent(
          event.content,
          event.pubkey,
          signer.publicKey,
          signer.privateKey!,
        );

        Map<String, dynamic> map = jsonDecode(content);
        map['sig'] = '';
        Event innerEvent = Event.fromJson(
          map,
        );

        if (innerEvent.pubkey == event.pubkey) {
          return innerEvent;
        }
      } catch (e) {
        throw Exception(e);
      }
    }

    throw Exception("${event.kind} is not nip24 compatible");
  }
}
