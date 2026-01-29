import 'package:drift/drift.dart';

class CashuMintTable extends Table {
  TextColumn get pubkey => text()();
  TextColumn get mintURL => text()();
  TextColumn get name => text().withDefault(const Constant(''))();
  IntColumn get balance => integer().withDefault(const Constant(0))();
  IntColumn get maxNutsVersion => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {pubkey, mintURL};

  @override
  String get tableName => 'IMint';
}
