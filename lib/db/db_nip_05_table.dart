// NIP05 table
import 'package:drift/drift.dart';

class Nip05Table extends Table {
  TextColumn get nip05 => text()();
  TextColumn get pubkey => text()();
  BoolColumn get valid => boolean().withDefault(const Constant(false))();
  IntColumn get lastCheck => integer().nullable()();
  IntColumn get networkFetch => integer().nullable()();

  @override
  Set<Column> get primaryKey => {nip05};

  List<Index> get customIndexes => [
        Index('idx_nip05_pubkey', [pubkey.name] as String),
      ];
}
