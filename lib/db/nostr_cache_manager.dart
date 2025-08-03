// import 'dart:convert';

// import 'package:drift/drift.dart';
// import 'package:nostr_core_enhanced/cache/cache_manager.dart';
// import 'package:nostr_core_enhanced/models/contact_list.dart';
// import 'package:nostr_core_enhanced/models/event_filter.dart';
// import 'package:nostr_core_enhanced/models/metadata.dart';
// import 'package:nostr_core_enhanced/models/relay_set.dart';
// import 'package:nostr_core_enhanced/models/user_relay_list.dart';
// import 'package:nostr_core_enhanced/nostr/event.dart';
// import 'package:nostr_core_enhanced/utils/enums.dart';

// import 'drift_database.dart' as drift_db;

// class DriftCacheManager extends CacheManager {
//   late drift_db.NostrDatabase _database;
//   EventFilter? eventFilter;

//   Future<void> init({String? directory}) async {
//     _database = drift_db.NostrDatabase();
//   }

//   double getDatabaseSizeInMb() {
//     // For Drift, we'll need to check the file size manually
//     return 0.0; // Placeholder - implement file size check if needed
//   }

//   // User Relay List methods
//   @override
//   Future<void> saveUserRelayList(UserRelayList userRelayList) async {
//     if (userRelayList.pubkey.isEmpty) return;

//     await _database.into(_database.userRelayLists).insertOnConflictUpdate(
//           drift_db.UserRelayListsCompanion.insert(
//             pubkey: userRelayList.pubkey,
//             readRelays: Value(jsonEncode(userRelayList.readUrls.toList())),
//             writeRelays: Value(jsonEncode(userRelayList.writes)),
//             createdAt: userRelayList.createdAt,
//             loadedTimestamp: Value(userRelayList.refreshedTimestamp),
//             sources: Value(
//                 jsonEncode([])), // UserRelayList doesn't have sources field
//           ),
//         );
//   }

//   @override
//   Future<UserRelayList?> loadUserRelayList(String pubKey) async {
//     final query = _database.select(_database.userRelayLists)
//       ..where((tbl) => tbl.pubkey.equals(pubKey));

//     final row = await query.getSingleOrNull();
//     if (row == null) return null;

//     // Reconstruct relays map from stored read/write lists
//     final readRelaysList = List<String>.from(jsonDecode(row.readRelays));
//     final writeRelaysList = List<String>.from(jsonDecode(row.writeRelays));

//     final relays = <String, ReadWriteMarker>{};

//     // Add read relays
//     for (final relay in readRelaysList) {
//       relays[relay] = writeRelaysList.contains(relay)
//           ? ReadWriteMarker.readWrite
//           : ReadWriteMarker.readOnly;
//     }

//     // Add write-only relays
//     for (final relay in writeRelaysList) {
//       if (!relays.containsKey(relay)) {
//         relays[relay] = ReadWriteMarker.writeOnly;
//       }
//     }

//     return UserRelayList(
//       pubkey: row.pubkey,
//       relays: relays,
//       createdAt: row.createdAt,
//       refreshedTimestamp:
//           row.loadedTimestamp ?? DateTime.now().millisecondsSinceEpoch ~/ 1000,
//     );
//   }

//   @override
//   Future<void> saveUserRelayLists(List<UserRelayList> userRelayLists) async {
//     final validRelayLists =
//         userRelayLists.where((r) => r.pubkey.isNotEmpty).toList();

//     await _database.batch((batch) {
//       for (final relayList in validRelayLists) {
//         batch.insertAllOnConflictUpdate(
//           _database.userRelayLists,
//           drift_db.UserRelayListsCompanion.insert(
//             pubkey: relayList.pubkey,
//             readRelays: Value(jsonEncode(relayList.readUrls.toList())),
//             writeRelays: Value(jsonEncode(relayList.writes)),
//             createdAt: relayList.createdAt,
//             loadedTimestamp: Value(relayList.refreshedTimestamp),
//             sources: Value(
//                 jsonEncode([])), // UserRelayList doesn't have sources field
//           ),
//         );
//       }
//     });
//   }

//   // Relay Set methods
//   @override
//   RelaySet? loadRelaySet(String name, String pubKey) {
//     // Note: This should be async but interface requires sync
//     // Return null for now - use loadRelaySetAsync for actual functionality
//     return null;
//   }

//   // Async version that actually works
//   Future<RelaySet?> loadRelaySetAsync(String name, String pubKey) async {
//     final id = RelaySet.buildId(name, pubKey);
//     final query = _database.select(_database.relaySets)
//       ..where((tbl) => tbl.id.equals(id));

//     final row = await query.getSingleOrNull();
//     if (row == null) return null;

//     return RelaySet(
//       name: row.name,
//       pubkey: row.pubkey,
//       relays: Map<String, dynamic>.from(jsonDecode(row.relays)),
//     )
//       ..createdAt = row.createdAt
//       ..loadedTimestamp = row.loadedTimestamp
//       ..sources = List<String>.from(jsonDecode(row.sources));
//   }

//   @override
//   Future<void> saveRelaySet(RelaySet relaySet) async {
//     if (relaySet.id.isEmpty) return;

//     await _database.into(_database.relaySets).insertOnConflictUpdate(
//           drift_db.RelaySetsCompanion.insert(
//             id: relaySet.id,
//             name: relaySet.name,
//             pubkey: relaySet.pubkey,
//             relays: Value(jsonEncode(relaySet.relays)),
//             createdAt: relaySet.createdAt,
//             loadedTimestamp: Value(relaySet.loadedTimestamp),
//             sources: Value(jsonEncode(relaySet.sources)),
//           ),
//         );
//   }

//   // Contact List methods
//   @override
//   ContactList? loadContactList(String pubKey) {
//     // Note: This should be async but interface requires sync
//     // Return null for now - use loadContactListAsync for actual functionality
//     return null;
//   }

//   // Async version that actually works
//   Future<ContactList?> loadContactListAsync(String pubKey) async {
//     final query = _database.select(_database.contactLists)
//       ..where((tbl) => tbl.pubkey.equals(pubKey));

//     final row = await query.getSingleOrNull();
//     if (row == null) return null;

//     return ContactList(
//       pubkey: row.pubkey,
//       contacts: List<String>.from(jsonDecode(row.contacts)),
//     )
//       ..createdAt = row.createdAt
//       ..loadedTimestamp = row.loadedTimestamp
//       ..sources = List<String>.from(jsonDecode(row.sources))
//       ..followedCommunities =
//           List<String>.from(jsonDecode(row.followedCommunities))
//       ..followedTags = List<String>.from(jsonDecode(row.followedTags))
//       ..followedEvents = List<String>.from(jsonDecode(row.followedEvents))
//       ..contactRelays =
//           Map<String, List<String>>.from(jsonDecode(row.contactRelays))
//       ..petnames = Map<String, List<String>>.from(jsonDecode(row.petnames));
//   }

//   @override
//   Future<void> saveContactList(ContactList contactList) async {
//     await _database.into(_database.contactLists).insertOnConflictUpdate(
//           drift_db.ContactListsCompanion.insert(
//             pubkey: contactList.pubkey,
//             contacts: Value(jsonEncode(contactList.contacts)),
//             createdAt: contactList.createdAt,
//             loadedTimestamp: Value(contactList.loadedTimestamp),
//             sources: Value(jsonEncode(contactList.sources)),
//             followedCommunities:
//                 Value(jsonEncode(contactList.followedCommunities)),
//             followedTags: Value(jsonEncode(contactList.followedTags)),
//             followedEvents: Value(jsonEncode(contactList.followedEvents)),
//             contactRelays: Value(jsonEncode(contactList.contactRelays)),
//             petnames: Value(jsonEncode(contactList.petnames)),
//           ),
//         );
//   }

//   // Event methods
//   @override
//   Future<Event?> loadEvent(String id) async {
//     final query = _database.select(_database.events)
//       ..where((tbl) => tbl.id.equals(id));

//     final row = await query.getSingleOrNull();
//     if (row == null) return null;

//     return Event(
//       row.id,
//       row.pubkey,
//       row.createdAt,
//       row.kind,
//       jsonDecode(row.tags),
//       row.content,
//       row.sig,
//       currentUser: row.currentUser,
//       seenOn: List<String>.from(jsonDecode(row.seenOn)),
//       lastUpdated: row.lastUpdated,
//     );
//   }

//   @override
//   Future<void> saveEvent(Event event) async {
//     await _database.into(_database.events).insertOnConflictUpdate(
//           drift_db.EventsCompanion.insert(
//             id: event.id,
//             pubkey: event.pubkey,
//             createdAt: event.createdAt,
//             kind: event.kind,
//             tags: jsonEncode(event.tags),
//             content: event.content,
//             sig: event.sig,
//             currentUser: event.currentUser,
//             seenOn: jsonEncode(event.seenOn),
//             lastUpdated: Value(event.lastUpdated),
//             subscriptionId: Value(event.subscriptionId),
//           ),
//         );
//   }

//   // Metadata methods
//   @override
//   Future<Metadata?> loadMetadata(String pubKey) async {
//     final query = _database.select(_database.metadatas)
//       ..where((tbl) => tbl.pubkey.equals(pubKey));

//     final row = await query.getSingleOrNull();
//     if (row == null) return null;

//     return Metadata(
//       pubkey: row.pubkey,
//       name: row.name,
//       displayName: row.displayName,
//       picture: row.picture,
//       banner: row.banner,
//       website: row.website,
//       about: row.about,
//       nip05: row.nip05,
//       lud16: row.lud16,
//       lud06: row.lud06,
//       createdAt: row.createdAt,
//       isDeleted: row.isDeleted,
//       refreshedTimestamp: row.refreshedTimestamp,
//     );
//   }

//   @override
//   Future<void> saveMetadata(Metadata metadata) async {
//     await _database.into(_database.metadatas).insertOnConflictUpdate(
//           drift_db.MetadatasCompanion.insert(
//             pubkey: metadata.pubkey,
//             name: Value(metadata.name),
//             displayName: Value(metadata.displayName),
//             picture: Value(metadata.picture),
//             banner: Value(metadata.banner),
//             website: Value(metadata.website),
//             about: Value(metadata.about),
//             nip05: Value(metadata.nip05),
//             lud16: Value(metadata.lud16),
//             lud06: Value(metadata.lud06),
//             createdAt: metadata.createdAt,
//             isDeleted: Value(metadata.isDeleted),
//             refreshedTimestamp: Value(metadata.refreshedTimestamp),
//           ),
//         );
//   }

//   // Placeholder methods - implement remaining methods following the same pattern
//   @override
//   Future<void> removeAllContactLists() async {
//     await _database.delete(_database.contactLists).go();
//   }

//   @override
//   Future<void> removeAllEvents() async {
//     await _database.delete(_database.events).go();
//   }

//   @override
//   Future<void> removeAllMetadatas() async {
//     await _database.delete(_database.metadatas).go();
//   }

//   @override
//   Future<void> clearCache() async {
//     await Future.wait([
//       removeAllContactLists(),
//       removeAllEvents(),
//       removeAllMetadatas(),
//       _database.delete(_database.userRelayLists).go(),
//       _database.delete(_database.relaySets).go(),
//       _database.delete(_database.eventStats).go(),
//       _database.delete(_database.muteLists).go(),
//       _database.delete(_database.wotScores).go(),
//       _database.delete(_database.dmSessionInfos).go(),
//     ]);
//   }

//   // Add remaining method implementations...
//   // (This is a partial implementation - you'll need to implement all methods from CacheManager)
// }

import 'package:drift/drift.dart';
import 'package:nostr_core_enhanced/cache/cache_manager.dart';
import 'package:nostr_core_enhanced/models/app_shared_settings.dart';
import 'package:nostr_core_enhanced/models/contact_list.dart';
import 'package:nostr_core_enhanced/models/dm_session_info.dart';
import 'package:nostr_core_enhanced/models/event_stats.dart';
import 'package:nostr_core_enhanced/models/metadata.dart';
import 'package:nostr_core_enhanced/models/mute_list.dart';
import 'package:nostr_core_enhanced/models/nip05.dart';
import 'package:nostr_core_enhanced/models/relay_set.dart';
import 'package:nostr_core_enhanced/models/user_drafts.dart';
import 'package:nostr_core_enhanced/models/user_followers.dart';
import 'package:nostr_core_enhanced/models/user_relay_list.dart';
import 'package:nostr_core_enhanced/models/wot_models.dart';
import 'package:nostr_core_enhanced/nostr/event.dart';
import 'package:nostr_core_enhanced/utils/utils.dart';

import 'drift_database.dart';

class NostrCacheManager extends CacheManager {
  late NostrDatabase _database;

  Future<void> init({String? directory}) async {
    _database = NostrDatabase();
  }

  @override
  Future<void> clearCache() async {
    await Future.wait([
      removeAllAppSettings(),
      removeAllContactLists(),
      removeAllDmSessionsInfo(),
      removeAllEvents(),
      removeAllMetadatas(),
      removeAllMuteLists(),
      removeAllNip05s(),
      removeAllRelaySets(),
      removeAllUserDrafts(),
      removeAllUserFollowers(),
      removeAllUserRelayLists(),
      removeAllWot(),
      removeAllWotScore(),
    ]);
  }

  @override
  Future<List<Metadata>> getAllMetadatas() async {
    return (await _database.select(_database.metadataTable).get())
        .map((e) => Metadata.fromMetadataTableData(e))
        .toList();
  }

  @override
  Future<int?> getContactWotAvailability({
    required List<String> originPubkeyList,
    required String peerPubkey,
  }) async {
    if (originPubkeyList.isEmpty) {
      return null;
    }

    final countExp = countAll();

    final query = _database.selectOnly(_database.contactListTable)
      ..addColumns([countExp])
      ..where(_database.contactListTable.pubkey.isIn(originPubkeyList) &
          _database.contactListTable.contacts.contains(peerPubkey));

    final row = await query.getSingleOrNull();

    return row == null ? 0 : row.read(countExp);
  }

  @override
  Future<Metadata?> getMetadataByNip05(String nip05) async {
    final query = _database.select(_database.metadataTable)
      ..where(
        (tbl) => tbl.nip05.equals(nip05),
      );

    final m = await query.getSingleOrNull();

    if (m != null) {
      return Metadata.fromMetadataTableData(m);
    }

    return null;
  }

  @override
  Future<int?> getMutesWotAvailability({
    required List<String> originPubkeyList,
    required String peerPubkey,
  }) async {
    final countExp = countAll();

    final query = _database.selectOnly(_database.muteListTable)
      ..addColumns([countExp])
      ..where(_database.muteListTable.pubkey.isIn(originPubkeyList) &
          _database.muteListTable.mutes.contains(peerPubkey));

    final row = await query.getSingleOrNull();

    return row == null ? 0 : row.read(countExp);
  }

  @override
  Future<Map<String, Map<String, int>>> getWotAvailabilityBatch({
    required List<String> originPubkeyList,
    required List<String> peerPubkeys,
  }) async {
    final results = <String, Map<String, int>>{};

    if (originPubkeyList.isEmpty || peerPubkeys.isEmpty) {
      return results;
    }

    final originKeysStr = originPubkeyList.map((k) => "'$k'").join(',');

    for (final peer in peerPubkeys) {
      final peerEscaped = peer.replaceAll("'", "''"); // Escape quotes in pubkey

      // Combine both follow and mute counts using UNION
      final sql = '''
      SELECT '$peer' as peer, 'following' as type, COUNT(*) as count
      FROM contact_list_table
      WHERE pubkey IN ($originKeysStr)
        AND contacts LIKE '%"$peerEscaped"%'
      
      UNION ALL
      
      SELECT '$peer' as peer, 'mutes' as type, COUNT(*) as count
      FROM mute_list_table
      WHERE pubkey IN ($originKeysStr)
        AND mutes LIKE '%"$peerEscaped"%'
    ''';

      final query = await _database.customSelect(sql).get();

      final peerResult = <String, int>{'following': 0, 'mutes': 0};

      for (final row in query) {
        final type = row.data['type'] as String;
        final count = row.data['count'] as int;
        peerResult[type] = count;
      }

      results[peer] = peerResult;
    }

    return results;
  }

  @override
  Future<ContactList?> loadContactList(String pubKey) async {
    final query = _database.select(_database.contactListTable)
      ..where((tbl) => tbl.pubkey.equals(pubKey));

    final c = await query.getSingleOrNull();

    if (c != null) {
      return ContactList.fromContactListTableData(c);
    }

    return null;
  }

  @override
  Future<DMSessionInfo?> loadDmSessionsInfo(String id) async {
    final query = _database.select(_database.dmSessionInfosTable)
      ..where((tbl) => tbl.dmSessionId.equals(id));

    final dm = await query.getSingleOrNull();

    if (dm != null) {
      return DMSessionInfo.fromDmSessionInfosTableData(dm);
    }

    return null;
  }

  @override
  Future<List<DMSessionInfo>> loadDmSessionsInfos(List<String> ids) async {
    final query = _database.select(_database.dmSessionInfosTable)
      ..where((tbl) => tbl.dmSessionId.isIn(ids));

    final dms = await query.get();

    return dms
        .map(
          (dm) => DMSessionInfo.fromDmSessionInfosTableData(dm),
        )
        .toList();
  }

  @override
  Future<Event?> loadEvent({
    String? e,
    String? pubkey,
    String? kTag,
    String? pTag,
    int? kind,
  }) async {
    final query = _database.select(_database.eventTable)
      ..where((tbl) {
        final conditions = <Expression<bool>>[];

        if (kind != null) {
          conditions.add(tbl.kind.equals(kind));
        }

        if (Helpers.isNotBlank(kTag)) {
          final pattern = '%["k","$kTag"%';
          conditions.add(tbl.tags.like(pattern));
        }

        if (Helpers.isNotBlank(e)) {
          final pattern = '%["e","$e"%';
          conditions.add(tbl.tags.like(pattern));
        }

        if (Helpers.isNotBlank(pTag)) {
          final pattern = '%["p","$pTag"%';
          conditions.add(tbl.tags.like(pattern));
        }

        if (Helpers.isNotBlank(pubkey)) {
          conditions.add(tbl.pubkey.equals(pubkey!));
        }

        return conditions.fold<Expression<bool>>(
            const Constant(true), (a, b) => a & b);
      })
      ..orderBy([
        (tbl) => OrderingTerm.desc(tbl.createdAt),
      ])
      ..limit(1);

    final ev = await query.getSingleOrNull();

    if (ev != null) {
      return Event.fromEventTableData(ev);
    }

    return null;
  }

  @override
  Future<Event?> loadEventById(String id, bool r) async {
    final query = _database.select(_database.eventTable)
      ..where((tbl) {
        if (r) {
          return tbl.dTag.equals(id);
        } else {
          return tbl.id.equals(id);
        }
      });

    final e = await query.getSingleOrNull();
    if (e != null) {}
  }

  @override
  Future<EventStats?> loadEventStats(String eventId) {
    // TODO: implement loadEventStats
    throw UnimplementedError();
  }

  @override
  Future<List<EventStats?>> loadEventStatsList(List<String> eventIds) {
    // TODO: implement loadEventStatsList
    throw UnimplementedError();
  }

  @override
  Future<List<Event>> loadEvents(
      {List<String>? pubkeys,
      List<String>? ids,
      List<String>? eTags,
      List<int>? kinds,
      String? pTag,
      String? currentUser}) {
    // TODO: implement loadEvents
    throw UnimplementedError();
  }

  @override
  Future<Metadata?> loadMetadata(String pubKey) {
    // TODO: implement loadMetadata
    throw UnimplementedError();
  }

  @override
  Future<List<Metadata?>> loadMetadatas(List<String> pubKeys) {
    // TODO: implement loadMetadatas
    throw UnimplementedError();
  }

  @override
  Future<MuteList?> loadMuteList(String pubKey) {
    // TODO: implement loadMuteList
    throw UnimplementedError();
  }

  @override
  Future<Nip05?> loadNip05(String pubKey) {
    // TODO: implement loadNip05
    throw UnimplementedError();
  }

  @override
  Future<List<Nip05?>> loadNip05s(List<String> pubKeys) {
    // TODO: implement loadNip05s
    throw UnimplementedError();
  }

  @override
  Future<RelaySet?> loadRelaySet(String name, String pubKey) {
    // TODO: implement loadRelaySet
    throw UnimplementedError();
  }

  @override
  Future<AppSharedSettings?> loadUserAppSettings(String pubkey) {
    // TODO: implement loadUserAppSettings
    throw UnimplementedError();
  }

  @override
  Future<UserDrafts?> loadUserDrafts(String pubkey) {
    // TODO: implement loadUserDrafts
    throw UnimplementedError();
  }

  @override
  Future<UserFollowers?> loadUserFollowers(String pubkey) {
    // TODO: implement loadUserFollowers
    throw UnimplementedError();
  }

  @override
  Future<UserRelayList?> loadUserRelayList(String pubKey) {
    // TODO: implement loadUserRelayList
    throw UnimplementedError();
  }

  @override
  Future<WotModel?> loadUserWot(String pubkey) {
    // TODO: implement loadUserWot
    throw UnimplementedError();
  }

  @override
  Future<WotScore?> loadWotScore(String pubkey, String originPubkey) {
    // TODO: implement loadWotScore
    throw UnimplementedError();
  }

  @override
  Future<List<WotScore>> loadWotScoreList(
      List<String> pubkeys, String originPubkey) {
    // TODO: implement loadWotScoreList
    throw UnimplementedError();
  }

  @override
  Future<Map<String, WotScore>> loadWotScoreMap(
      List<String> pubkeys, String originPubkey) {
    // TODO: implement loadWotScoreMap
    throw UnimplementedError();
  }

  @override
  Future<void> removeAllAppSettings() async {
    await _database.delete(_database.userAppSettingsTable).go();
  }

  @override
  Future<void> removeAllContactLists() async {
    await _database.delete(_database.contactListTable).go();
  }

  @override
  Future<void> removeAllDmSessionsInfo() async {
    await _database.delete(_database.dmSessionInfosTable).go();
  }

  @override
  Future<void> removeAllEventStats() async {
    await _database.delete(_database.eventStatsTable).go();
  }

  @override
  Future<void> removeAllEvents() async {
    await _database.delete(_database.eventTable).go();
  }

  @override
  Future<void> removeAllEventsByKinds(List<int> kinds) async {}

  @override
  Future<void> removeAllEventsByPubKey(String pubKey) async {}

  @override
  Future<void> removeAllMetadatas() async {
    await _database.delete(_database.metadataTable).go();
  }

  @override
  Future<void> removeAllMuteLists() async {
    await _database.delete(_database.muteListTable).go();
  }

  @override
  Future<void> removeAllNip05s() async {
    await _database.delete(_database.nip05Table).go();
  }

  @override
  Future<void> removeAllRelaySets() async {
    await _database.delete(_database.relaySetTable).go();
  }

  @override
  Future<void> removeAllUserDrafts() async {
    await _database.delete(_database.userDraftTable).go();
  }

  @override
  Future<void> removeAllUserFollowers() async {
    await _database.delete(_database.userFollowersTable).go();
  }

  @override
  Future<void> removeAllUserRelayLists() async {
    await _database.delete(_database.userRelayListTable).go();
  }

  @override
  Future<void> removeAllWot() async {
    await _database.delete(_database.userWotTable).go();
  }

  @override
  Future<void> removeAllWotScore() async {
    await _database.delete(_database.wotScoreTable).go();
  }

  @override
  Future<void> removeContactList(String pubKey) async {
    throw UnimplementedError();
  }

  @override
  Future<void> removeDmSessionsInfo(String id) {
    // TODO: implement removeDmSessionsInfo
    throw UnimplementedError();
  }

  @override
  Future<void> removeEvent(String id) {
    // TODO: implement removeEvent
    throw UnimplementedError();
  }

  @override
  Future<void> removeEventStats(String eventId) {
    // TODO: implement removeEventStats
    throw UnimplementedError();
  }

  @override
  Future<void> removeMetadata(String pubKey) {
    // TODO: implement removeMetadata
    throw UnimplementedError();
  }

  @override
  Future<void> removeMuteList(String pubKey) {
    // TODO: implement removeMuteList
    throw UnimplementedError();
  }

  @override
  Future<void> removeNip05(String pubKey) {
    // TODO: implement removeNip05
    throw UnimplementedError();
  }

  @override
  Future<void> removeRelaySet(String name, String pubKey) {
    // TODO: implement removeRelaySet
    throw UnimplementedError();
  }

  @override
  Future<void> removeUserAppSettings(String pubkey) {
    // TODO: implement removeUserAppSettings
    throw UnimplementedError();
  }

  @override
  Future<void> removeUserDrafts(String pubkey) {
    // TODO: implement removeUserDrafts
    throw UnimplementedError();
  }

  @override
  Future<void> removeUserFollowers(String pubkey) {
    // TODO: implement removeUserFollowers
    throw UnimplementedError();
  }

  @override
  Future<void> removeUserRelayList(String pubKey) {
    // TODO: implement removeUserRelayList
    throw UnimplementedError();
  }

  @override
  Future<void> removeUserWot(String pubkey) {
    // TODO: implement removeUserWot
    throw UnimplementedError();
  }

  @override
  Future<void> removeWotScore(String id) {
    // TODO: implement removeWotScore
    throw UnimplementedError();
  }

  @override
  Future<void> saveContactList(ContactList contactList) {
    // TODO: implement saveContactList
    throw UnimplementedError();
  }

  @override
  Future<void> saveContactLists(List<ContactList> contactLists) {
    // TODO: implement saveContactLists
    throw UnimplementedError();
  }

  @override
  Future<void> saveDmSessionsInfo(DMSessionInfo info) {
    // TODO: implement saveDmSessionsInfo
    throw UnimplementedError();
  }

  @override
  Future<void> saveDmSessionsInfos(List<DMSessionInfo> infos) {
    // TODO: implement saveDmSessionsInfos
    throw UnimplementedError();
  }

  @override
  Future<void> saveEvent(Event event) {
    // TODO: implement saveEvent
    throw UnimplementedError();
  }

  @override
  Future<void> saveEventStats(EventStats stats) {
    // TODO: implement saveEventStats
    throw UnimplementedError();
  }

  @override
  Future<void> saveEventStatsList(List<EventStats> stats) {
    // TODO: implement saveEventStatsList
    throw UnimplementedError();
  }

  @override
  Future<void> saveEvents(List<Event> events) {
    // TODO: implement saveEvents
    throw UnimplementedError();
  }

  @override
  Future<void> saveMetadata(Metadata metadata) {
    // TODO: implement saveMetadata
    throw UnimplementedError();
  }

  @override
  Future<void> saveMetadatas(List<Metadata> metadatas) {
    // TODO: implement saveMetadatas
    throw UnimplementedError();
  }

  @override
  Future<void> saveMuteList(MuteList muteList) {
    // TODO: implement saveMuteList
    throw UnimplementedError();
  }

  @override
  Future<void> saveMuteLists(List<MuteList> muteLists) {
    // TODO: implement saveMuteLists
    throw UnimplementedError();
  }

  @override
  Future<void> saveNip05(Nip05 nip05) {
    // TODO: implement saveNip05
    throw UnimplementedError();
  }

  @override
  Future<void> saveNip05s(List<Nip05> nip05s) {
    // TODO: implement saveNip05s
    throw UnimplementedError();
  }

  @override
  Future<void> saveRelaySet(RelaySet relaySet) {
    // TODO: implement saveRelaySet
    throw UnimplementedError();
  }

  @override
  Future<void> saveUserAppSettings(AppSharedSettings dbUserAppSettings) {
    // TODO: implement saveUserAppSettings
    throw UnimplementedError();
  }

  @override
  Future<void> saveUserDrafts(UserDrafts dbUserDrafts) {
    // TODO: implement saveUserDrafts
    throw UnimplementedError();
  }

  @override
  Future<void> saveUserFollowers(UserFollowers dbUserFollowers) {
    // TODO: implement saveUserFollowers
    throw UnimplementedError();
  }

  @override
  Future<void> saveUserRelayList(UserRelayList userRelayList) {
    // TODO: implement saveUserRelayList
    throw UnimplementedError();
  }

  @override
  Future<void> saveUserRelayLists(List<UserRelayList> userRelayLists) {
    // TODO: implement saveUserRelayLists
    throw UnimplementedError();
  }

  @override
  Future<void> saveUserWot(WotModel wotModel) {
    // TODO: implement saveUserWot
    throw UnimplementedError();
  }

  @override
  Future<void> saveWotScore(WotScore wotScore) {
    // TODO: implement saveWotScore
    throw UnimplementedError();
  }

  @override
  Future<void> saveWotScoresBatch(List<WotScore> wotScores) {
    // TODO: implement saveWotScoresBatch
    throw UnimplementedError();
  }

  @override
  Future<Iterable<Metadata>> searchMetadatas(String search, int limit) {
    // TODO: implement searchMetadatas
    throw UnimplementedError();
  }

  @override
  Future<Iterable<Metadata>> searchRelatedMetadatas(
      String search, List<String> pubkeys, int limit) {
    // TODO: implement searchRelatedMetadatas
    throw UnimplementedError();
  }
}
