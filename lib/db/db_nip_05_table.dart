// NIP05 table
import 'package:drift/drift.dart';

class Nip05Table extends Table {
  TextColumn get nip05 => text()();
  TextColumn get pubkey => text()();
  BoolColumn get valid => boolean().withDefault(const Constant(false))();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {pubkey};
}
