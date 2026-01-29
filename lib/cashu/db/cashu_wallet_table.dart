import 'package:drift/drift.dart';
import 'package:nostr_core_enhanced/db/db_type_converters.dart';

class CashuWalletTable extends Table {
  TextColumn get id => text()();
  IntColumn get createdAt => integer()();
  TextColumn get pubkey => text()();
  TextColumn get signSecret => text()();
  TextColumn get mints => text().map(const StringListConverter())();

  @override
  Set<Column> get primaryKey => {pubkey};

  @override
  String get tableName => 'CashuWallet';
}
