import 'package:nostr_core_enhanced/models/contact_list.dart';
import 'package:nostr_core_enhanced/nostr/event.dart';
import 'package:nostr_core_enhanced/nostr/nips/nip_065.dart';
import 'package:nostr_core_enhanced/utils/utils.dart';

class UserRelayList {
  String pubkey;
  int createdAt;
  int refreshedTimestamp;

  Map<String, ReadWriteMarker> relays;

  UserRelayList({
    required this.pubkey,
    required this.relays,
    required this.createdAt,
    required this.refreshedTimestamp,
  });

  Iterable<String> get urls => relays.keys;

  Iterable<String> get readUrls => relays.entries
      .where((entry) => entry.value.isRead)
      .map((entry) => entry.key);

  List<String> get reads => relays.keys
      .where((relay) =>
          relays[relay] == ReadWriteMarker.readOnly ||
          relays[relay] == ReadWriteMarker.readWrite)
      .toList();

  List<String> get writes => relays.keys
      .where((relay) =>
          relays[relay] == ReadWriteMarker.writeOnly ||
          relays[relay] == ReadWriteMarker.readWrite)
      .toList();

  static UserRelayList fromNip65(Nip65 nip65) {
    final relays = <String, ReadWriteMarker>{};

    for (var entry in nip65.relays.entries) {
      final r = Relay.clean(entry.key);
      if (r != null) {
        relays[r] = entry.value;
      }
    }

    return UserRelayList(
      pubkey: nip65.pubkey,
      relays: relays,
      createdAt: nip65.createdAt,
      refreshedTimestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
    );
  }

  Nip65 toNip65() {
    return Nip65.fromMap(pubkey, relays);
  }

  static UserRelayList fromNip02EventContent(Event event) {
    return UserRelayList(
      pubkey: event.pubkey,
      relays: ContactList.relaysFromContent(event),
      createdAt: event.createdAt,
      refreshedTimestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
    );
  }
}
