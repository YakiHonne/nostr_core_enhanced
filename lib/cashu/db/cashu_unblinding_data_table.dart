// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';

class CashuUnblindingDataTable extends Table {
  TextColumn get mintURL => text()();
  TextColumn get unit => text()();
  IntColumn get actionTypeRaw => integer()();
  TextColumn get actionValue => text()();
  TextColumn get id => text()();
  TextColumn get amount => text()();
  TextColumn get C_ => text()();
  TextColumn get dleqPlainText => text().withDefault(const Constant(''))();
  TextColumn get r => text()();
  TextColumn get secret => text()();

  @override
  Set<Column> get primaryKey => {id, secret};

  @override
  String get tableName => 'UnblindingData';
}
