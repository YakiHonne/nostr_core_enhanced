import 'package:drift/drift.dart';

class CashuHistoryEntryTable extends Table {
  TextColumn get id => text()();
  RealColumn get amount => real()();
  IntColumn get typeRaw => integer()();
  RealColumn get timestamp => real()();
  TextColumn get value => text()();
  TextColumn get mintsRaw => text().withDefault(const Constant(''))();
  TextColumn get sender => text().nullable()();
  TextColumn get recipient => text().nullable()();
  TextColumn get preImage => text().nullable()();
  RealColumn get fee => real().nullable()();
  IntColumn get isSpent => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'IHistoryEntry';
}
