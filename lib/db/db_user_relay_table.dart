// User Relay Lists table
import 'package:drift/drift.dart';

class UserRelayListTable extends Table {
  TextColumn get pubkey => text()();
  TextColumn get readRelays =>
      text().withDefault(const Constant('{}'))(); // JSON object
  TextColumn get writeRelays =>
      text().withDefault(const Constant('{}'))(); // JSON object
  IntColumn get createdAt => integer()();
  IntColumn get loadedTimestamp => integer().nullable()();
  TextColumn get sources =>
      text().withDefault(const Constant('[]'))(); // JSON array

  @override
  Set<Column> get primaryKey => {pubkey};
}
