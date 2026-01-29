import 'package:drift/drift.dart';

class CashuProofTable extends Table {
  TextColumn get id => text()();
  TextColumn get keysetId => text()();
  TextColumn get amount => text()();
  TextColumn get secret => text()();
  TextColumn get C => text()();
  TextColumn get witness => text().withDefault(const Constant(''))();
  TextColumn get dleqPlainText => text().withDefault(const Constant(''))();
  IntColumn get stateRaw => integer().withDefault(const Constant(0))();
  IntColumn get lastCheckedMs => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'Proof';
}
