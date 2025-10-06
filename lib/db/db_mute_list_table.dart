// Mute Lists table
import 'package:drift/drift.dart';
import 'package:nostr_core_enhanced/db/db_type_converters.dart';

class MuteListTable extends Table {
  TextColumn get pubkey => text()();
  TextColumn get mutes => text()
      .withDefault(const Constant('[]'))
      .map(const StringListConverter())();
  IntColumn get createdAt => integer()();
  IntColumn get loadedTimestamp => integer().nullable()();

  @override
  Set<Column> get primaryKey => {pubkey};
}
