// User Relay Lists table
import 'package:drift/drift.dart';

class UserRelayListTable extends Table {
  TextColumn get pubkey => text()();
  IntColumn get createdAt => integer()();
  IntColumn get refreshedTimestamp => integer()();
  TextColumn get relays => text()();

  @override
  Set<Column> get primaryKey => {pubkey};
}
