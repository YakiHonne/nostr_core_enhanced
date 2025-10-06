// Event Stats table
import 'package:drift/drift.dart';
import 'package:nostr_core_enhanced/db/db_type_converters.dart';

class EventStatsTable extends Table {
  TextColumn get id => text()();

  TextColumn get replies => text()
      .withDefault(const Constant('{}'))
      .map(const StringMapConverter())();
  TextColumn get reposts => text()
      .withDefault(const Constant('{}'))
      .map(const StringMapConverter())();
  TextColumn get reactions => text()
      .withDefault(const Constant('{}'))
      .map(const StringMapConverter())();
  TextColumn get quotes => text()
      .withDefault(const Constant('{}'))
      .map(const StringMapConverter())();
  TextColumn get zaps => text()
      .withDefault(const Constant('{}'))
      .map(const NestedMapIntConverter())();

  IntColumn get newestCreatedAt => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
