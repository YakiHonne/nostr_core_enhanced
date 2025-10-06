import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:nostr_core_enhanced/db/db_tables.dart';
import 'package:nostr_core_enhanced/db/db_type_converters.dart';
import 'package:path_provider/path_provider.dart';

part 'drift_database.g.dart';

@DriftDatabase(tables: [
  EventTable,
  MetadataTable,
  ContactListTable,
  MuteListTable,
  UserRelayListTable,
  RelaySetTable,
  EventStatsTable,
  Nip05Table,
  DmSessionInfosTable,
  UserFollowersTable,
  UserDraftTable,
  UserAppSettingsTable,
  UserWotTable,
  WotScoreTable,
  RelayInfoListTable,
])
class NostrDatabase extends _$NostrDatabase {
  NostrDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {},
      );

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'nostr_core',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
