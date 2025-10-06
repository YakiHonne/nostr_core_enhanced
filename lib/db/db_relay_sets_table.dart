// Relay Sets table
import 'package:drift/drift.dart';

class RelaySetTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get pubkey => text()();
  TextColumn get relaysMap => text().withDefault(const Constant('{}'))();
  TextColumn get direction => text()();
  IntColumn get relayMinCountPerPubkey =>
      integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};

  List<Index> get customIndexes => [
        Index('idx_relay_sets_pubkey', [pubkey.name] as String),
        Index('idx_relay_sets_name', [name.name] as String),
      ];
}
