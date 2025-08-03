// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:nostr_core_enhanced/nostr/event.dart';
import 'package:nostr_core_enhanced/nostr/event_signer/event_signer.dart';
import 'package:nostr_core_enhanced/utils/enums.dart';
import 'package:nostr_core_enhanced/utils/static_properties.dart';

class Nip65 {
  late String pubkey;

  Map<String, ReadWriteMarker> relays = {};

  Nip65.fromMap(this.pubkey, Map<String, ReadWriteMarker> map) {
    relays = map;
  } // Pub keys -> markers

  int createdAt = DateTime.now().millisecondsSinceEpoch ~/ 1000;

  // Nip65(this.relays);

  Map<String, ReadWriteMarker> relaysMap() {
    return relays;
  }

  Nip65.fromEvent(Event event) {
    pubkey = event.pubkey;
    createdAt = event.createdAt;
    for (var tag in event.tags) {
      final length = tag.length;
      if (length <= 1) continue;
      final name = tag[0];
      final url = tag[1];
      if (name != "r") continue;
      ReadWriteMarker? marker = ReadWriteMarker.readWrite;
      if (length > 2) {
        var operType = tag[2];
        switch (operType) {
          case "read":
            marker = ReadWriteMarker.readOnly;
            break;
          case "write":
            marker = ReadWriteMarker.writeOnly;
            break;
        }
      }
      relays[url] = marker;
    }
  }

  Future<Event?> toEvent(EventSigner signer) async {
    return await Event.genEvent(
      signer: signer,
      kind: EventKind.RELAY_LIST_METADATA,
      tags: relays.entries.map((entry) {
        ReadWriteMarker marker = entry.value;
        List<String> list = ["r", entry.key];
        if (marker == ReadWriteMarker.readOnly) {
          list.add("read");
        }
        if (marker == ReadWriteMarker.writeOnly) {
          list.add("write");
        }
        return list;
      }).toList(),
      content: "",
      createdAt: createdAt,
    );
  }

  @override
  String toString() {
    return 'Nip65{urls: $relays}';
  }
}
