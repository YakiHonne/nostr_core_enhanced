import 'package:nostr_core_enhanced/nostr/event.dart';

abstract class EventSigner {
  Future<void> sign(Event event);

  String getPublicKey();

  Future<String?> decrypt04(String msg, String destPubKey, {String? id});

  Future<String?> encrypt04(String msg, String destPubKey, {String? id});

  Future<Event?> encrypt04Event(
    String msg,
    String destPubKey, {
    String? id,
    String? replyId,
  });

  Future<String?> decrypt44(String msg, String destPubKey, {String? id});

  Future<String?> encrypt44(String msg, String destPubKey, {String? id});

  Future<Event?> decrypt44Event(Event event, {String? id});

  Future<Event?> encrypt44Event(Event event, String destPubKey, {String? id});

  bool canSign();

  bool isGuest();
}
