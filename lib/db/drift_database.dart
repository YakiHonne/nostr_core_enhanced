import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:nostr_core_enhanced/cashu/db/cashu_db_tables.dart';
import 'package:nostr_core_enhanced/cashu/db/cashu_spending_table.dart';
import 'package:nostr_core_enhanced/cashu/db/cashu_tokens_table.dart';
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
  // Cashu tables
  // CashuProofTable,
  // CashuHistoryEntryTable,
  CashuMintTable,
  CashuKeysetInfoTable,
  CashuInvoiceTable,
  CashuUnblindingDataTable,
  CashuMintInfoTable,
  CashuLightningInvoiceTable,
  CashuTokensTable,
  CashuSpendingTable,
  CashuWalletTable,
])
class NostrDatabase extends _$NostrDatabase {
  static NostrDatabase? _instance;

  factory NostrDatabase() {
    _instance ??= NostrDatabase._internal();
    return _instance!;
  }

  NostrDatabase._internal() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from == 1 && to == 2) {
            await m.createTable(cashuMintTable);
            await m.createTable(cashuKeysetInfoTable);
            await m.createTable(cashuInvoiceTable);
            await m.createTable(cashuUnblindingDataTable);
            await m.createTable(cashuMintInfoTable);
            await m.createTable(cashuLightningInvoiceTable);
            await m.createTable(cashuTokensTable);
            await m.createTable(cashuSpendingTable);
            await m.createTable(cashuWalletTable);
          }
        },
        beforeOpen: (details) async {
          try {
            await customStatement('PRAGMA journal_mode=WAL;');
            await customStatement('PRAGMA busy_timeout=30000;');
            await customStatement('PRAGMA synchronous=NORMAL;');
            await customStatement('PRAGMA cache_size=10000;');
            await customStatement('PRAGMA temp_store=MEMORY;');
            await customStatement(
                'CREATE INDEX IF NOT EXISTS idx_events_d_tag ON event_table (d_tag);');
            await customStatement(
                'CREATE INDEX IF NOT EXISTS idx_events_pk_kind_created ON event_table (pubkey, kind, created_at DESC);');
          } catch (_) {}
        },
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
