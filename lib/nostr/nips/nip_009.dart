import 'package:nostr_core_enhanced/nostr/nostr.dart';

/// Event Deletion
class Nip9 {
  static List<List<String>> toTags(List<String> events) {
    List<List<String>> result = [];
    for (var event in events) {
      result.add(['e', event]);
    }
    return result;
  }

  static Future<Event?> encode(
      List<String> events, String content, EventSigner? signer) async {
    return Event.genEvent(
      kind: 5,
      tags: toTags(events),
      content: content,
      signer: signer,
    );
  }

  static Future<Event?> encodeWithLabel(
    List<String> events,
    String content,
    EventSigner? signer,
    String label,
    String type,
  ) async {
    return await Event.genEvent(
      kind: 5,
      tags: toTags(events)..add(['l', label, type]),
      content: content,
      signer: signer,
    );
  }

  static DeleteEvent? toDeleteEvent(Event event) {
    return DeleteEvent(
      event.pubkey,
      tagsToList(event.tags),
      event.content,
      event.createdAt,
    );
  }

  static List<String> tagsToList(List<List<String>> tags) {
    List<String> deleteEvents = [];
    for (var tag in tags) {
      if (tag[0] == 'e') deleteEvents.add(tag[1]);
    }

    return deleteEvents;
  }

  static DeleteEvent? decode(Event event) {
    if (event.kind == 5) {
      return toDeleteEvent(event);
    }
    throw Exception('${event.kind} is not nip9 compatible');
  }
}

class DeleteEvent {
  String pubkey;
  List<String> deleteEvents;
  String reason;
  int deleteTime;

  DeleteEvent(this.pubkey, this.deleteEvents, this.reason, this.deleteTime);
}
