// Relay Sets table
import 'package:drift/drift.dart';

class RelaySetTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get pubkey => text()();
  TextColumn get relays =>
      text().withDefault(const Constant('{}'))(); // JSON object
  IntColumn get createdAt => integer()();
  IntColumn get loadedTimestamp => integer().nullable()();
  TextColumn get sources =>
      text().withDefault(const Constant('[]'))(); // JSON array

  @override
  Set<Column> get primaryKey => {id};

  List<Index> get customIndexes => [
        Index('idx_relay_sets_pubkey', [pubkey.name] as String),
        Index('idx_relay_sets_name', [name.name] as String),
      ];
}
