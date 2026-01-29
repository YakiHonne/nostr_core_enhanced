import 'package:drift/drift.dart';
import 'package:nostr_core_enhanced/db/db_type_converters.dart';

class CashuSpendingTable extends Table {
  TextColumn get id => text()();
  TextColumn get pubkey => text()();
  IntColumn get createdAt => integer()();
  IntColumn get kind => integer()();
  TextColumn get content => text().map(const StringListOfListConverter())();
  TextColumn get tags => text().map(const StringListOfListConverter())();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'CashuSpending';
}
