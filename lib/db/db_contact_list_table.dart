// Contact Lists table
import 'package:drift/drift.dart';
import 'package:nostr_core_enhanced/db/db_type_converters.dart';

class ContactListTable extends Table {
  TextColumn get pubkey => text()();

  TextColumn get contacts => text()
      .withDefault(const Constant('[]'))
      .map(const StringListConverter())();

  IntColumn get createdAt => integer()();
  IntColumn get loadedTimestamp => integer().nullable()();

  TextColumn get sources => text()
      .withDefault(const Constant('[]'))
      .map(const StringListConverter())();

  TextColumn get followedCommunities => text()
      .withDefault(const Constant('[]'))
      .map(const StringListConverter())();

  TextColumn get followedTags => text()
      .withDefault(const Constant('[]'))
      .map(const StringListConverter())();

  TextColumn get followedEvents => text()
      .withDefault(const Constant('[]'))
      .map(const StringListConverter())();

  TextColumn get contactRelays => text()
      .withDefault(const Constant('[]'))
      .map(const StringListConverter())();

  TextColumn get petnames => text()
      .withDefault(const Constant('[]'))
      .map(const StringListConverter())();

  @override
  Set<Column> get primaryKey => {pubkey};
}
