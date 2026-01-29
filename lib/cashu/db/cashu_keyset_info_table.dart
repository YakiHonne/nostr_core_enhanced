import 'package:drift/drift.dart';

class CashuKeysetInfoTable extends Table {
  TextColumn get id => text()();
  TextColumn get mintURL => text()();
  TextColumn get unit => text()();
  BoolColumn get active => boolean()();
  TextColumn get keysetRaw => text().withDefault(const Constant(''))();
  IntColumn get inputFeePPK => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id, mintURL};

  @override
  String get tableName => 'KeysetInfo';
}
