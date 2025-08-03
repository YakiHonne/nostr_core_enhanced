// Mute Lists table
import 'package:drift/drift.dart';

class MuteListTable extends Table {
  TextColumn get pubkey => text()();
  TextColumn get mutes =>
      text().withDefault(const Constant('[]'))(); // JSON array
  IntColumn get createdAt => integer()();
  IntColumn get loadedTimestamp => integer().nullable()();
  TextColumn get sources =>
      text().withDefault(const Constant('[]'))(); // JSON array

  @override
  Set<Column> get primaryKey => {pubkey};
}
