import 'package:nostr_core_enhanced/nostr/event.dart';
import 'package:nostr_core_enhanced/nostr/event_signer/bip340.dart';
import 'package:nostr_core_enhanced/nostr/nips/nip_004.dart';
import 'package:nostr_core_enhanced/nostr/nips/nip_017.dart';
import 'package:nostr_core_enhanced/nostr/nips/nip_044.dart';
import 'package:nostr_core_enhanced/utils/utils.dart';

import 'event_signer.dart';

class Bip340EventSigner implements EventSigner {
  String? privateKey;
  String publicKey;

  Bip340EventSigner(this.privateKey, this.publicKey);

  String signMessage(String message) {
    return Bip340.sign(message, privateKey!);
  }

  @override
  Future<void> sign(Event event) async {
    if (StringUtil.isNotBlank(privateKey)) {
      event.sig = Bip340.sign(event.id, privateKey!);
    }
  }

  @override
  String getPublicKey() {
    return publicKey;
  }

  @override
  Future<String?> decrypt04(String msg, String destPubKey, {String? id}) async {
    return Nip4.decrypt(privateKey!, destPubKey, msg);
  }

  @override
  Future<String?> encrypt04(String msg, String destPubKey, {String? id}) async {
    return Nip4.encrypt(privateKey!, destPubKey, msg);
  }

  @override
  Future<Event?> encrypt04Event(
    String msg,
    String destPubKey, {
    String? id,
    String? replyId,
  }) async {
    final encryption = await encrypt04(msg, destPubKey);

    if (encryption != null) {
      return await Event.genEvent(
        kind: EventKind.DIRECT_MESSAGE,
        tags: Nip4.toTags(destPubKey, replyId ?? '', null),
        content: encryption,
        signer: this,
      );
    }

    return null;
  }

  @override
  Future<String?> decrypt44(
    String msg,
    String destPubKey, {
    String? id,
  }) async {
    return await Nip44.decryptContent(
      msg,
      destPubKey,
      publicKey,
      privateKey!,
    );
  }

  @override
  Future<String?> encrypt44(
    String msg,
    String destPubKey, {
    String? id,
  }) async {
    return await Nip44.encryptContent(msg, destPubKey, this);
  }

  @override
  Future<Event?> decrypt44Event(
    Event event, {
    String? id,
  }) async {
    return await Nip17.decode(event, this);
  }

  @override
  Future<Event?> encrypt44Event(
    Event event,
    String destPubKey, {
    String? id,
  }) async {
    return await Nip17.encode(event, destPubKey, this);
  }

  @override
  bool canSign() {
    return Helpers.isNotBlank(privateKey);
  }

  @override
  bool isGuest() {
    return !Helpers.isNotBlank(privateKey);
  }

  String? getPrivateKey() {
    return privateKey;
  }
}
