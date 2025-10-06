// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drift/drift.dart';
import 'package:nostr_core_enhanced/db/drift_database.dart';
import 'package:nostr_core_enhanced/nostr/nostr.dart';
import 'package:nostr_core_enhanced/utils/static_properties.dart';

class MuteList {
  late String pubkey;

  List<String> mutes = [];
  int createdAt = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  int? loadedTimestamp;

  MuteList({
    required this.pubkey,
    required this.mutes,
  });

  MuteListTableCompanion toCompanion() {
    return MuteListTableCompanion.insert(
      pubkey: pubkey,
      mutes: Value(mutes),
      createdAt: createdAt,
      loadedTimestamp: Value(loadedTimestamp),
    );
  }

  factory MuteList.fromEvent(Event event) {
    final createdAt = event.createdAt;
    final loadedTimestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    return MuteList(pubkey: event.pubkey, mutes: event.currentPtags())
      ..createdAt = createdAt
      ..loadedTimestamp = loadedTimestamp;
  }

  factory MuteList.fromMuteListTableData(MuteListTableData data) {
    return MuteList(pubkey: data.pubkey, mutes: data.mutes)
      ..loadedTimestamp = data.loadedTimestamp
      ..createdAt = data.createdAt;
  }

  List<List<String>> tagListToJson(final List<String> list, String tag) {
    return list.map((value) {
      List<String> list = [
        tag,
        value,
      ];
      return list;
    }).toList();
  }

  Event toEvent() {
    return Event.partial(
      pubkey: pubkey,
      kind: EventKind.MUTE_LIST,
      tags: tagListToJson(mutes, 'p'),
      content: "",
      createdAt: createdAt,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MuteList &&
          runtimeType == other.runtimeType &&
          pubkey == other.pubkey;

  @override
  int get hashCode => pubkey.hashCode;
}
