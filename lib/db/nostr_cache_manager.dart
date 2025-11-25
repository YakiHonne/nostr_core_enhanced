import 'package:drift/drift.dart';
import 'package:nostr_core_enhanced/cache/cache_manager.dart';
import 'package:nostr_core_enhanced/db/db_wrapper.dart';
import 'package:nostr_core_enhanced/models/app_shared_settings.dart';
import 'package:nostr_core_enhanced/models/event_stats.dart';
import 'package:nostr_core_enhanced/models/models.dart';
import 'package:nostr_core_enhanced/models/mute_list.dart';
import 'package:nostr_core_enhanced/models/user_drafts.dart';
import 'package:nostr_core_enhanced/models/user_followers.dart';
import 'package:nostr_core_enhanced/models/wot_models.dart';
import 'package:nostr_core_enhanced/nostr/event.dart';
import 'package:nostr_core_enhanced/nostr/filter.dart';

import '../utils/helpers.dart';
import 'drift_database.dart';

class NostrDB extends CacheManager {
  late NostrDatabase _database;

  // Retry configuration
  static const int _maxRetries = 5;
  static const int _initialDelayMs = 50;

  // =====================================================================
  // MARK: RETRY WRAPPER
  // =====================================================================

  Future<T> _retryOnLocked<T>(Future<T> Function() operation) async {
    int retries = _maxRetries;
    int delayMs = _initialDelayMs;

    while (retries > 0) {
      try {
        return await operation();
      } catch (e) {
        final errorMsg = e.toString().toLowerCase();
        final isLockError = errorMsg.contains('database is locked');

        if (isLockError && retries > 1) {
          retries--;
          await Future.delayed(Duration(milliseconds: delayMs));
          delayMs *= 2; // Exponential backoff
          continue;
        }
        rethrow;
      }
    }

    throw Exception('Database operation failed after $_maxRetries retries');
  }

  // =====================================================================
  // MARK: INITIALIZATION
  // =====================================================================

  Future<void> init({String? directory}) async {
    _database = NostrDatabase();
  }

  // =====================================================================
  // MARK: DATABASE SIZE CALCULATOR
  // =====================================================================

  Future<double> getDatabaseSizeInMB() async {
    try {
      final pageSizeRow =
          await _database.customSelect('PRAGMA page_size;').getSingle();
      final pageCountRow =
          await _database.customSelect('PRAGMA page_count;').getSingle();

      final pageSize = pageSizeRow.data.values.first as int;
      final pageCount = pageCountRow.data.values.first as int;

      final sizeInBytes = pageSize * pageCount;
      return sizeInBytes / (1024 * 1024);
    } catch (e) {
      return 0.0;
    }
  }

  // =====================================================================
  // MARK: METADATA OPERATIONS
  // =====================================================================

  @override
  Future<List<Metadata>> getAllMetadatas() async {
    return await _retryOnLocked(
      () async {
        return (await _database.select(_database.metadataTable).get())
            .map((e) => Metadata.fromMetadataTableData(e))
            .toList();
      },
    );
  }

  @override
  Future<Metadata?> getMetadataByNip05(String nip05) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.metadataTable)
          ..where(
            (tbl) => tbl.nip05.equals(nip05),
          );

        final m = await query.get();

        return m.isNotEmpty ? Metadata.fromMetadataTableData(m.first) : null;
      },
    );
  }

  @override
  Stream<Metadata?> watchMetadata(String pubkey) {
    final query = _database.select(_database.metadataTable)
      ..where((tbl) => tbl.pubkey.equals(pubkey));

    return query.watchSingleOrNull().map(
          (m) => m != null ? Metadata.fromMetadataTableData(m) : null,
        );
  }

  @override
  Future<Metadata?> loadMetadata(String pubkey) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.metadataTable)
          ..where((tbl) => tbl.pubkey.equals(pubkey))
          ..limit(1);

        final m = await query.getSingleOrNull();

        return m != null ? Metadata.fromMetadataTableData(m) : null;
      },
    );
  }

  @override
  Future<List<String>> getMissingMetadatas(List<String> pubkeys) async {
    return await _retryOnLocked(
      () async {
        if (pubkeys.isEmpty) return [];

        final query = _database.select(_database.metadataTable)
          ..where((tbl) => tbl.pubkey.isIn(pubkeys));

        final existingMetadatas = await query.get();
        final existingPubkeys = existingMetadatas.map((m) => m.pubkey).toSet();

        // Return the pubkeys that are not in the database
        return pubkeys.where((pk) => !existingPubkeys.contains(pk)).toList();
      },
    );
  }

  @override
  Future<List<Metadata>> loadMetadatas(List<String> pubkeys) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.metadataTable)
          ..where((tbl) => tbl.pubkey.isIn(pubkeys));

        final ms = await query.get();

        return ms.map((m) => Metadata.fromMetadataTableData(m)).toList();
      },
    );
  }

  @override
  Future<List<Metadata>> searchMetadatas(String search, int limit) async {
    return await _retryOnLocked(
      () async {
        final lcSearch = search.toLowerCase();
        final query = _database.select(_database.metadataTable)
          ..where(
            (tbl) =>
                tbl.name.lower().contains(lcSearch) |
                tbl.nip05.lower().contains(lcSearch) |
                tbl.displayName.lower().contains(lcSearch),
          )
          ..limit(limit);

        final ms = await query.get();

        return ms.map((e) => Metadata.fromMetadataTableData(e)).toList();
      },
    );
  }

  @override
  Future<List<Metadata>> searchRelatedMetadatas(
    String search,
    List<String> pubkeys,
    int limit,
  ) async {
    return await _retryOnLocked(
      () async {
        final lcSearch = search.toLowerCase();
        final query = _database.select(_database.metadataTable)
          ..where(
            (tbl) =>
                tbl.pubkey.isIn(pubkeys) &
                (tbl.name.lower().contains(lcSearch) |
                    tbl.nip05.lower().contains(lcSearch) |
                    tbl.displayName.lower().contains(lcSearch)),
          )
          ..limit(limit);

        final ms = await query.get();

        return ms.map((e) => Metadata.fromMetadataTableData(e)).toList();
      },
    );
  }

  @override
  Future<void> saveMetadata(Metadata metadata) async {
    await _retryOnLocked(
      () async {
        await _database.into(_database.metadataTable).insertOnConflictUpdate(
              metadata.toCompanion(),
            );
      },
    );
  }

  @override
  Future<void> saveMetadatas(List<Metadata> metadatas) async {
    await _retryOnLocked(
      () async {
        await _database.batch(
          (batch) {
            batch.insertAllOnConflictUpdate(
              _database.metadataTable,
              metadatas.map(
                (e) => e.toCompanion(),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Future<void> removeMetadata(String pubkey) async {
    await _retryOnLocked(
      () async {
        await (_database.delete(_database.metadataTable)
              ..where(
                (tbl) => tbl.pubkey.equals(pubkey),
              ))
            .go();
      },
    );
  }

  @override
  Future<void> removeAllMetadatas() async {
    await _retryOnLocked(
      () async {
        await _database.delete(_database.metadataTable).go();
      },
    );
  }

  // =====================================================================
  // MARK: CONTACT LIST OPERATIONS
  // =====================================================================

  @override
  Future<ContactList?> loadContactList(String pubkey) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.contactListTable)
          ..where((tbl) => tbl.pubkey.equals(pubkey))
          ..limit(1);

        final c = await query.getSingleOrNull();

        return c != null ? ContactList.fromContactListTableData(c) : null;
      },
    );
  }

  @override
  Future<List<ContactList>> loadContactLists(List<String> pubkeys) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.contactListTable)
          ..where((tbl) => tbl.pubkey.isIn(pubkeys));

        final c = await query.get();

        return c.isNotEmpty
            ? c
                .map(
                  (e) => ContactList.fromContactListTableData(e),
                )
                .toList()
            : [];
      },
    );
  }

  @override
  Future<void> saveContactList(ContactList contactList) async {
    await _retryOnLocked(
      () async {
        await _database.into(_database.contactListTable).insertOnConflictUpdate(
              contactList.toCompanion(),
            );
      },
    );
  }

  @override
  Future<void> saveContactLists(List<ContactList> contactLists) async {
    await _retryOnLocked(
      () async {
        await _database.batch(
          (batch) {
            batch.insertAllOnConflictUpdate(
              _database.contactListTable,
              contactLists.map(
                (e) => e.toCompanion(),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Future<void> removeContactList(String pubkey) async {
    await _retryOnLocked(
      () async {
        await (_database.delete(_database.contactListTable)
              ..where(
                (tbl) => tbl.pubkey.equals(pubkey),
              ))
            .go();
      },
    );
  }

  @override
  Future<void> removeAllContactLists() async {
    await _retryOnLocked(
      () async {
        await _database.delete(_database.contactListTable).go();
      },
    );
  }

  // =====================================================================
  // MARK: MUTE LIST OPERATIONS
  // =====================================================================

  @override
  Future<MuteList?> loadMuteList(String pubkey) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.muteListTable)
          ..where((tbl) => tbl.pubkey.equals(pubkey))
          ..limit(1);

        final m = await query.getSingleOrNull();

        return m != null ? MuteList.fromMuteListTableData(m) : null;
      },
    );
  }

  @override
  Future<void> saveMuteList(MuteList muteList) async {
    await _retryOnLocked(
      () async {
        await _database.into(_database.muteListTable).insertOnConflictUpdate(
              muteList.toCompanion(),
            );
      },
    );
  }

  @override
  Future<void> saveMuteLists(List<MuteList> muteLists) async {
    await _retryOnLocked(
      () async {
        await _database.batch(
          (batch) {
            batch.insertAllOnConflictUpdate(
              _database.muteListTable,
              muteLists.map(
                (e) => e.toCompanion(),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Future<void> removeMuteList(String pubkey) async {
    await _retryOnLocked(
      () async {
        await (_database.delete(_database.muteListTable)
              ..where(
                (tbl) => tbl.pubkey.equals(pubkey),
              ))
            .go();
      },
    );
  }

  @override
  Future<void> removeAllMuteLists() async {
    await _retryOnLocked(
      () async {
        await _database.delete(_database.muteListTable).go();
      },
    );
  }

  // =====================================================================
  // MARK: EVENT OPERATIONS
  // =====================================================================

  @override
  Future<Event?> loadEvent({
    String? e,
    String? pubkey,
    String? kTag,
    String? pTag,
    int? kind,
  }) async {
    return await _retryOnLocked(
      () async {
        String tagPattern(String type, String value) => '%["$type","$value"%';

        final query = _database.select(_database.eventTable)
          ..where((tbl) {
            final conditions = <Expression<bool>>[];

            if (kind != null) {
              conditions.add(tbl.kind.equals(kind));
            }
            if (Helpers.isNotBlank(kTag)) {
              conditions.add(tbl.tags.like(tagPattern('k', kTag!)));
            }
            if (Helpers.isNotBlank(e)) {
              conditions.add(tbl.tags.like(tagPattern('e', e!)));
            }
            if (Helpers.isNotBlank(pTag)) {
              conditions.add(tbl.tags.like(tagPattern('p', pTag!)));
            }
            if (Helpers.isNotBlank(pubkey)) {
              conditions.add(tbl.pubkey.equals(pubkey!));
            }

            if (conditions.isEmpty) {
              return const Constant(true);
            }
            return conditions.reduce((a, b) => a & b);
          })
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)])
          ..limit(1);

        final ev = await query.getSingleOrNull();
        return ev != null ? Event.fromEventTableData(ev) : null;
      },
    );
  }

  @override
  Future<void> flushEventsSeenRelays(DbWrapper dbWrapper) async {
    await _retryOnLocked(
      () async {
        if (DateTime.now().difference(dbWrapper.lastFlush).inSeconds < 2) {
          return;
        }

        dbWrapper.lastFlush = DateTime.now();

        final r = dbWrapper.currentEvents;
        if (r.isEmpty) return;

        await _database.batch(
          (batch) => batch.insertAllOnConflictUpdate(
            _database.eventTable,
            r.values.map(
              (e) {
                return e.toCompanion();
              },
            ).toList(),
          ),
        );
      },
    );
  }

  @override
  Future<Event?> loadEventById(String id, bool r) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.eventTable)
          ..where((tbl) {
            if (r) {
              return tbl.dTag.equals(id);
            } else {
              return tbl.id.equals(id);
            }
          })
          ..limit(1);

        final e = await query.getSingleOrNull();

        return e != null ? Event.fromEventTableData(e) : null;
      },
    );
  }

  @override
  Future<List<Event>> loadEvents({
    required Filter f,
    String? currentUser,
    List<String>? relays,
  }) async {
    return await _retryOnLocked(() async {
      final query = _database.select(_database.eventTable)
        ..where((tbl) {
          final conditions = <Expression<bool>>[];

          void addIfNotEmpty<T>(
            List<T>? values,
            Expression<bool> Function(T) builder,
          ) {
            if (values != null && values.isNotEmpty) {
              conditions.add(values.map(builder).reduce((a, b) => a | b));
            }
          }

          if (f.authors?.isNotEmpty ?? false) {
            conditions.add(tbl.pubkey.isIn(f.authors!));
          }

          if (f.search?.isNotEmpty ?? false) {
            conditions
                .add(tbl.content.lower().contains(f.search!.toLowerCase()));
          }

          if (f.ids?.isNotEmpty ?? false) conditions.add(tbl.id.isIn(f.ids!));

          if (f.kinds?.isNotEmpty ?? false) {
            conditions.add(tbl.kind.isIn(f.kinds!));
          }

          if (currentUser?.isNotEmpty ?? false) {
            conditions.add(tbl.currentUser.equals(currentUser!));
          }

          if (f.d?.isNotEmpty ?? false) conditions.add(tbl.dTag.isIn(f.d!));

          if (f.since != null) {
            conditions.add(tbl.createdAt.isBiggerOrEqualValue(f.since!));
          }

          if (f.until != null) {
            conditions.add(tbl.createdAt.isSmallerOrEqualValue(f.until!));
          }

          // Tag-based filters
          addIfNotEmpty(f.e, (v) => tbl.eTags.contains('"$v"'));
          addIfNotEmpty(f.l, (v) => tbl.lTags.contains('"$v"'));
          addIfNotEmpty(f.p, (v) => tbl.pTags.contains('"$v"'));
          addIfNotEmpty(f.c, (v) => tbl.cTags.contains('"$v"'));
          addIfNotEmpty(f.k, (v) => tbl.kTags.contains('"$v"'));
          addIfNotEmpty(f.q, (v) => tbl.qTags.contains('"$v"'));
          addIfNotEmpty(f.t, (v) => tbl.tTags.contains('"$v"'));
          addIfNotEmpty(f.a, (v) => tbl.aTags.contains('"$v"'));
          addIfNotEmpty(f.bolt11, (v) => tbl.tags.contains('"$v"'));
          addIfNotEmpty(relays, (v) => tbl.seenOn.contains('"$v"'));

          // Combine all with AND
          return conditions.isEmpty
              ? const Constant(false)
              : conditions.reduce((a, b) => a & b);
        })
        ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)]);

      if (f.limit != null) {
        query.limit(f.limit!);
      }

      final events = await query.get();

      return events.map(Event.fromEventTableData).toList();
    });
  }

  @override
  Future<void> saveEvent(Event event) async {
    await _retryOnLocked(
      () async {
        await _database.into(_database.eventTable).insertOnConflictUpdate(
              event.toCompanion(),
            );
      },
    );
  }

  @override
  Future<void> saveEvents(List<Event> events) async {
    await _retryOnLocked(
      () async {
        await _database.batch(
          (batch) {
            batch.insertAllOnConflictUpdate(
              _database.eventTable,
              events.map(
                (e) => e.toCompanion(),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Future<void> removeEvent(String id) async {
    await _retryOnLocked(
      () async {
        await (_database.delete(_database.eventTable)
              ..where(
                (tbl) => tbl.id.equals(id),
              ))
            .go();
      },
    );
  }

  @override
  Future<void> removeAllEvents() async {
    await _retryOnLocked(
      () async {
        await _database.delete(_database.eventTable).go();
      },
    );
  }

  @override
  Future<void> removeAllEventsByKinds(List<int> kinds) async {
    await _retryOnLocked(
      () async {
        await (_database.delete(_database.eventTable)
              ..where(
                (tbl) => tbl.kind.isIn(kinds),
              ))
            .go();
      },
    );
  }

  @override
  Future<void> removeAllEventsByPubKey(String pubkey) async {
    await _retryOnLocked(
      () async {
        await (_database.delete(_database.eventTable)
              ..where(
                (tbl) => tbl.pubkey.equals(pubkey),
              ))
            .go();
      },
    );
  }

  // =====================================================================
  // MARK: EVENT STATS OPERATIONS
  // =====================================================================

  @override
  Future<EventStats?> loadEventStats(String eventId) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.eventStatsTable)
          ..where((tbl) => tbl.id.equals(eventId))
          ..limit(1);

        final es = await query.getSingleOrNull();

        return es != null ? EventStats.fromEventStatsTableData(es) : null;
      },
    );
  }

  @override
  Stream<EventStats?> watchEventStats(String eventId) {
    final query = _database.select(_database.eventStatsTable)
      ..where((tbl) => tbl.id.equals(eventId))
      ..limit(1);

    return query.watchSingleOrNull().map(
          (event) =>
              event != null ? EventStats.fromEventStatsTableData(event) : null,
        );
  }

  @override
  Future<List<EventStats?>> loadEventStatsList(List<String> eventIds) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.eventStatsTable)
          ..where((tbl) => tbl.id.isIn(eventIds));

        final es = await query.get();

        return es.map((e) => EventStats.fromEventStatsTableData(e)).toList();
      },
    );
  }

  @override
  Future<void> saveEventStats(EventStats stats) async {
    await _retryOnLocked(
      () async {
        await _database.into(_database.eventStatsTable).insertOnConflictUpdate(
              stats.toCompanion(),
            );
      },
    );
  }

  @override
  Future<void> saveEventStatsList(List<EventStats> stats) async {
    await _retryOnLocked(
      () async {
        await _database.batch(
          (batch) {
            batch.insertAllOnConflictUpdate(
              _database.eventStatsTable,
              stats.map(
                (e) => e.toCompanion(),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Future<void> removeEventStats(String eventId) async {
    await _retryOnLocked(
      () async {
        await (_database.delete(_database.eventStatsTable)
              ..where(
                (tbl) => tbl.id.equals(eventId),
              ))
            .go();
      },
    );
  }

  @override
  Future<void> removeAllEventStats() async {
    await _retryOnLocked(
      () async {
        await _database.delete(_database.eventStatsTable).go();
      },
    );
  }

  // =====================================================================
  // MARK: DM SESSION INFO OPERATIONS
  // =====================================================================

  @override
  Future<List<DMSessionInfo>> loadDmSessionsInfo(String id) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.dmSessionInfosTable)
          ..where((tbl) => tbl.dmSessionId.like("$id%"));

        final dms = await query.get();

        return dms
            .map((e) => DMSessionInfo.fromDmSessionInfosTableData(e))
            .toList();
      },
    );
  }

  @override
  Future<List<DMSessionInfo>> loadDmSessionsInfos(List<String> ids) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.dmSessionInfosTable)
          ..where((tbl) => tbl.dmSessionId.isIn(ids));

        final dms = await query.get();

        return dms
            .map(
              (dm) => DMSessionInfo.fromDmSessionInfosTableData(dm),
            )
            .toList();
      },
    );
  }

  @override
  Future<void> saveDmSessionsInfo(DMSessionInfo info) async {
    await _retryOnLocked(
      () async {
        await _database
            .into(_database.dmSessionInfosTable)
            .insertOnConflictUpdate(
              info.toCompanion(),
            );
      },
    );
  }

  @override
  Future<void> saveDmSessionsInfos(List<DMSessionInfo> infos) async {
    await _retryOnLocked(
      () async {
        await _database.batch(
          (batch) {
            batch.insertAllOnConflictUpdate(
              _database.dmSessionInfosTable,
              infos.map(
                (e) => e.toCompanion(),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Future<void> removeDmSessionsInfo(String id) async {
    await _retryOnLocked(
      () async {
        await (_database.delete(_database.dmSessionInfosTable)
              ..where(
                (tbl) => tbl.dmSessionId.equals(id),
              ))
            .go();
      },
    );
  }

  @override
  Future<void> removeAllDmSessionsInfo() async {
    await _retryOnLocked(
      () async {
        await _database.delete(_database.dmSessionInfosTable).go();
      },
    );
  }

  // =====================================================================
  // MARK: NIP05 OPERATIONS
  // =====================================================================

  @override
  Future<Nip05?> loadNip05(String pubkey) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.nip05Table)
          ..where((tbl) => tbl.pubkey.equals(pubkey))
          ..limit(1);

        final n = await query.getSingleOrNull();

        return n != null ? Nip05.fromNip05TableData(n) : null;
      },
    );
  }

  @override
  Future<Map<String, Nip05>> loadNip05s(List<String> pubkeys) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.nip05Table)
          ..where(
            (tbl) => tbl.pubkey.isIn(pubkeys),
          );

        final n = await query.get();

        return {for (final e in n) e.pubkey: Nip05.fromNip05TableData(e)};
      },
    );
  }

  @override
  Future<void> saveNip05(Nip05 nip05) async {
    await _retryOnLocked(
      () async {
        await _database.into(_database.nip05Table).insertOnConflictUpdate(
              nip05.toCompanion(),
            );
      },
    );
  }

  @override
  Future<void> saveNip05s(List<Nip05> nip05s) async {
    await _retryOnLocked(
      () async {
        await _database.batch(
          (batch) {
            batch.insertAllOnConflictUpdate(
              _database.nip05Table,
              nip05s.map(
                (e) => e.toCompanion(),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Future<void> removeNip05(String pubkey) async {
    await _retryOnLocked(
      () async {
        await (_database.delete(_database.nip05Table)
              ..where(
                (tbl) => tbl.pubkey.equals(pubkey),
              ))
            .go();
      },
    );
  }

  @override
  Future<void> removeAllNip05s() async {
    await _retryOnLocked(
      () async {
        await _database.delete(_database.nip05Table).go();
      },
    );
  }

  // =====================================================================
  // MARK: RELAY SET OPERATIONS
  // =====================================================================

  @override
  Future<RelaySet?> loadRelaySet(String name, String pubkey) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.relaySetTable)
          ..where((tbl) => tbl.id.equals(RelaySet.buildId(name, pubkey)))
          ..limit(1);

        final r = await query.getSingleOrNull();

        return r != null ? RelaySet.fromRelaySetTableData(r) : null;
      },
    );
  }

  @override
  Future<void> saveRelaySet(RelaySet relaySet) async {
    await _retryOnLocked(
      () async {
        await _database.into(_database.relaySetTable).insertOnConflictUpdate(
              relaySet.toCompanion(),
            );
      },
    );
  }

  @override
  Future<void> removeRelaySet(String name, String pubkey) async {
    await _retryOnLocked(
      () async {
        await (_database.delete(_database.relaySetTable)
              ..where(
                (tbl) => tbl.id.equals(RelaySet.buildId(name, pubkey)),
              ))
            .go();
      },
    );
  }

  @override
  Future<void> removeAllRelaySets() async {
    await _retryOnLocked(
      () async {
        await _database.delete(_database.relaySetTable).go();
      },
    );
  }

  // =====================================================================
  // MARK: USER APP SETTINGS OPERATIONS
  // =====================================================================

  @override
  Future<AppSharedSettings?> loadUserAppSettings(String pubkey) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.userAppSettingsTable)
          ..where((tbl) => tbl.pubkey.equals(pubkey))
          ..limit(1);

        final as = await query.getSingleOrNull();

        return as != null
            ? AppSharedSettings.fromAppSharedSettingsTableData(as)
            : null;
      },
    );
  }

  @override
  Future<void> saveUserAppSettings(AppSharedSettings userAppSettings) async {
    await _retryOnLocked(
      () async {
        await _database
            .into(_database.userAppSettingsTable)
            .insertOnConflictUpdate(
              userAppSettings.toCompanion(),
            );
      },
    );
  }

  @override
  Future<void> removeUserAppSettings(String pubkey) async {
    await _retryOnLocked(
      () async {
        await (_database.delete(_database.userAppSettingsTable)
              ..where(
                (tbl) => tbl.pubkey.equals(pubkey),
              ))
            .go();
      },
    );
  }

  @override
  Future<void> removeAllAppSettings() async {
    await _retryOnLocked(
      () async {
        await _database.delete(_database.userAppSettingsTable).go();
      },
    );
  }

  // =====================================================================
  // MARK: USER DRAFTS OPERATIONS
  // =====================================================================

  @override
  Future<UserDrafts?> loadUserDrafts(String pubkey) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.userDraftTable)
          ..where((tbl) => tbl.pubkey.equals(pubkey))
          ..limit(1);

        final ud = await query.getSingleOrNull();

        return ud != null ? UserDrafts.fromUserDraftTableData(ud) : null;
      },
    );
  }

  @override
  Future<void> saveUserDrafts(UserDrafts userDrafts) async {
    await _retryOnLocked(
      () async {
        await _database.into(_database.userDraftTable).insertOnConflictUpdate(
              userDrafts.toCompanion(),
            );
      },
    );
  }

  @override
  Future<void> removeUserDrafts(String pubkey) async {
    await _retryOnLocked(
      () async {
        await (_database.delete(_database.userDraftTable)
              ..where(
                (tbl) => tbl.pubkey.equals(pubkey),
              ))
            .go();
      },
    );
  }

  @override
  Future<void> removeAllUserDrafts() async {
    await _retryOnLocked(
      () async {
        await _database.delete(_database.userDraftTable).go();
      },
    );
  }

  // =====================================================================
  // MARK: USER FOLLOWERS OPERATIONS
  // =====================================================================

  @override
  Future<UserFollowers?> loadUserFollowers(String pubkey) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.userFollowersTable)
          ..where((tbl) => tbl.pubkey.equals(pubkey))
          ..limit(1);

        final uf = await query.getSingleOrNull();

        return uf != null ? UserFollowers.fromUserFollowersTableData(uf) : null;
      },
    );
  }

  @override
  Future<void> saveUserFollowers(UserFollowers userFollowers) async {
    await _retryOnLocked(
      () async {
        await _database
            .into(_database.userFollowersTable)
            .insertOnConflictUpdate(
              userFollowers.toCompanion(),
            );
      },
    );
  }

  @override
  Future<void> removeUserFollowers(String pubkey) async {
    await _retryOnLocked(
      () async {
        await (_database.delete(_database.userFollowersTable)
              ..where(
                (tbl) => tbl.pubkey.equals(pubkey),
              ))
            .go();
      },
    );
  }

  @override
  Future<void> removeAllUserFollowers() async {
    await _retryOnLocked(
      () async {
        await _database.delete(_database.userFollowersTable).go();
      },
    );
  }

  // =====================================================================
  // MARK: RELAY INFO
  // =====================================================================

  @override
  Future<RelayInfo?> loadRelayInfo(String relay) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.relayInfoListTable)
          ..where((tbl) => tbl.url.equals(relay))
          ..limit(1);

        final ri = await query.getSingleOrNull();

        return ri != null ? RelayInfo.fromRelayInfoListTableData(ri) : null;
      },
    );
  }

  @override
  Future<List<RelayInfo>> loadRelayInfoByRelays(List<String> relays) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.relayInfoListTable)
          ..where((tbl) => tbl.url.isIn(relays));

        final ri = await query.get();

        return ri
            .map(
              (e) => RelayInfo.fromRelayInfoListTableData(e),
            )
            .toList();
      },
    );
  }

  @override
  Future<void> saveRelayInfo(RelayInfo relayInfo) async {
    return await _retryOnLocked(
      () async {
        await _database
            .into(_database.relayInfoListTable)
            .insertOnConflictUpdate(
              relayInfo.toCompanion(),
            );
      },
    );
  }

  @override
  Future<void> saveRelayInfoList(List<RelayInfo> relayInfoList) async {
    return await _retryOnLocked(
      () async {
        await _database.batch(
          (batch) {
            batch.insertAllOnConflictUpdate(
              _database.relayInfoListTable,
              relayInfoList.map(
                (e) => e.toCompanion(),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Future<void> removeRelayInfo(String relay) async {
    return await _retryOnLocked(
      () async {
        await (_database.delete(_database.relayInfoListTable)
              ..where(
                (tbl) => tbl.name.equals(relay),
              ))
            .go();
      },
    );
  }

  @override
  Future<void> removeAllRelayInfo() async {
    return await _retryOnLocked(
      () async {
        await _database.delete(_database.relayInfoListTable).go();
      },
    );
  }

  // =====================================================================
  // MARK: USER RELAY LIST OPERATIONS
  // =====================================================================

  @override
  Future<UserRelayList?> loadUserRelayList(String pubkey) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.userRelayListTable)
          ..where((tbl) => tbl.pubkey.equals(pubkey))
          ..limit(1);

        final ur = await query.getSingleOrNull();

        return ur != null ? UserRelayList.fromUserRelayListTableData(ur) : null;
      },
    );
  }

  @override
  Future<List<UserRelayList>> loadUserRelayListByPubkeys(
      List<String> pubkeys) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.userRelayListTable)
          ..where((tbl) => tbl.pubkey.isIn(pubkeys));

        final ur = await query.get();

        return ur
            .map(
              (e) => UserRelayList.fromUserRelayListTableData(e),
            )
            .toList();
      },
    );
  }

  @override
  Future<List<UserRelayList>> loadUserRelayListAll() async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.userRelayListTable);

        final ur = await query.get();

        return ur
            .map(
              (e) => UserRelayList.fromUserRelayListTableData(e),
            )
            .toList();
      },
    );
  }

  @override
  Future<List<String>> getPubkeysByRelayAvailability(String relay) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.userRelayListTable)
          ..where((tbl) => tbl.relays.contains(relay));

        final ur = await query.get();

        return ur.map((e) => e.pubkey).toList();
      },
    );
  }

  @override
  Future<void> saveUserRelayList(UserRelayList userRelayList) async {
    await _retryOnLocked(
      () async {
        await _database
            .into(_database.userRelayListTable)
            .insertOnConflictUpdate(
              userRelayList.toCompanion(),
            );
      },
    );
  }

  @override
  Future<void> saveUserRelayLists(List<UserRelayList> userRelayLists) async {
    await _retryOnLocked(
      () async {
        await _database.batch(
          (batch) {
            batch.insertAllOnConflictUpdate(
              _database.userRelayListTable,
              userRelayLists.map(
                (e) => e.toCompanion(),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Future<void> removeUserRelayList(String pubkey) async {
    await _retryOnLocked(
      () async {
        await (_database.delete(_database.userRelayListTable)
              ..where(
                (tbl) => tbl.pubkey.equals(pubkey),
              ))
            .go();
      },
    );
  }

  @override
  Future<void> removeAllUserRelayLists() async {
    await _retryOnLocked(
      () async {
        await _database.delete(_database.userRelayListTable).go();
      },
    );
  }

  // =====================================================================
  // MARK: WEB OF TRUST (WOT) OPERATIONS
  // =====================================================================

  @override
  Future<int?> getContactWotAvailability({
    required List<String> originPubkeyList,
    required String peerPubkey,
  }) async {
    return await _retryOnLocked(
      () async {
        if (originPubkeyList.isEmpty) {
          return null;
        }

        final countExp = countAll();

        final query = _database.selectOnly(_database.contactListTable)
          ..addColumns([countExp])
          ..where(_database.contactListTable.pubkey.isIn(originPubkeyList) &
              _database.contactListTable.contacts.contains(peerPubkey))
          ..limit(1);

        final row = await query.getSingleOrNull();

        return row == null ? 0 : row.read(countExp);
      },
    );
  }

  @override
  Future<int?> getMutesWotAvailability({
    required List<String> originPubkeyList,
    required String peerPubkey,
  }) async {
    return await _retryOnLocked(
      () async {
        final countExp = countAll();

        final query = _database.selectOnly(_database.muteListTable)
          ..addColumns([countExp])
          ..where(_database.muteListTable.pubkey.isIn(originPubkeyList) &
              _database.muteListTable.mutes.contains(peerPubkey))
          ..limit(1);

        final row = await query.getSingleOrNull();

        return row == null ? 0 : row.read(countExp);
      },
    );
  }

  @override
  Future<Map<String, Map<String, int>>> getWotAvailabilityBatch({
    required List<String> originPubkeyList,
    required List<String> peerPubkeys,
  }) async {
    return await _retryOnLocked(
      () async {
        final results = <String, Map<String, int>>{};

        if (originPubkeyList.isEmpty || peerPubkeys.isEmpty) {
          return results;
        }

        final originKeysStr = originPubkeyList.map((k) => "'$k'").join(',');

        for (final peer in peerPubkeys) {
          final peerEscaped =
              peer.replaceAll("'", "''"); // Escape quotes in pubkey

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
      },
    );
  }

  @override
  Future<WotModel?> loadUserWot(String pubkey) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.userWotTable)
          ..where((tbl) => tbl.pubkey.equals(pubkey))
          ..limit(1);

        final wot = await query.getSingleOrNull();

        return wot != null ? WotModel.fromUserWotTableData(wot) : null;
      },
    );
  }

  @override
  Future<void> saveUserWot(WotModel wotModel) async {
    return await _retryOnLocked(
      () async {
        await _database.into(_database.userWotTable).insertOnConflictUpdate(
              wotModel.toCompanion(),
            );
      },
    );
  }

  @override
  Future<void> removeUserWot(String pubkey) async {
    return await _retryOnLocked(
      () async {
        await (_database.delete(_database.userWotTable)
              ..where(
                (tbl) => tbl.pubkey.equals(pubkey),
              ))
            .go();
      },
    );
  }

  @override
  Future<void> removeAllWot() async {
    return await _retryOnLocked(
      () async {
        await _database.delete(_database.userWotTable).go();
      },
    );
  }

  // =====================================================================
  // MARK: WOT SCORE OPERATIONS
  // =====================================================================

  @override
  Future<WotScore?> loadWotScore(String pubkey, String originPubkey) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.wotScoreTable)
          ..where((tbl) =>
              tbl.pubkey.equals(pubkey) & tbl.originPubkey.equals(originPubkey))
          ..limit(1);

        final ws = await query.getSingleOrNull();

        return ws != null ? WotScore.fromWotScoreTableData(ws) : null;
      },
    );
  }

  @override
  Future<List<WotScore>> loadWotScoreList(
    List<String> pubkeys,
    String originPubkey,
  ) async {
    return await _retryOnLocked(
      () async {
        final query = _database.select(_database.wotScoreTable)
          ..where((tbl) =>
              tbl.pubkey.isIn(pubkeys) & tbl.originPubkey.equals(originPubkey));

        final ws = await query.get();

        return ws.map((w) => WotScore.fromWotScoreTableData(w)).toList();
      },
    );
  }

  @override
  Future<Map<String, WotScore>> loadWotScoreMap(
    List<String> pubkeys,
    String originPubkey,
  ) async {
    final scores = await loadWotScoreList(pubkeys, originPubkey);

    return {for (final score in scores) score.pubkey: score};
  }

  @override
  Future<void> saveWotScore(WotScore wotScore) async {
    await _retryOnLocked(
      () async {
        await _database.into(_database.wotScoreTable).insertOnConflictUpdate(
              wotScore.toCompanion(),
            );
      },
    );
  }

  @override
  Future<void> saveWotScoresBatch(List<WotScore> wotScores) async {
    await _retryOnLocked(
      () async {
        await _database.batch(
          (batch) {
            batch.insertAllOnConflictUpdate(
              _database.wotScoreTable,
              wotScores.map(
                (e) => e.toCompanion(),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Future<void> removeWotScore(String id) async {
    await _retryOnLocked(
      () async {
        await (_database.delete(_database.wotScoreTable)
              ..where(
                (tbl) => tbl.id.equals(id),
              ))
            .go();
      },
    );
  }

  @override
  Future<void> removeAllWotScore() async {
    await _retryOnLocked(
      () async {
        await _database.delete(_database.wotScoreTable).go();
      },
    );
  }

  // =====================================================================
  // MARK: CACHE MANAGEMENT
  // =====================================================================

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
      removeAllWotScore(),
      removeAllWot(),
      removeAllWotScore(),
      removeAllRelayInfo(),
    ]);

    await _database.customStatement('VACUUM;');
  }
}
