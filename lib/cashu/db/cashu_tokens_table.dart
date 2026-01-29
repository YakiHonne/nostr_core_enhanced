import 'package:drift/drift.dart';
import 'package:nostr_core_enhanced/db/db_type_converters.dart';

class CashuTokensTable extends Table {
  TextColumn get id => text()();
  TextColumn get mintUrl => text()();
  TextColumn get unit => text()();
  TextColumn get pubkey => text()();
  IntColumn get createdAt => integer()();
  TextColumn get proofs => text().map(const StringListConverter())();
  TextColumn get deletedTokensIds => text().map(const StringListConverter())();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'CashuTokens';
}
