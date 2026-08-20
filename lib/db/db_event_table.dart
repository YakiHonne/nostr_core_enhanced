import 'package:drift/drift.dart';
import 'package:nostr_core_enhanced/db/db_type_converters.dart';

class EventTable extends Table {
  TextColumn get id => text()();
  TextColumn get pubkey => text()();
  IntColumn get createdAt => integer()();
  IntColumn get kind => integer()();
  TextColumn get tags => text()
      .withDefault(const Constant('[]'))
      .map(const StringListOfListConverter())();
  TextColumn get content => text()();
  TextColumn get sig => text()();

  TextColumn get currentUser => text().withDefault(const Constant(''))();
  TextColumn get seenOn => text()
      .withDefault(const Constant('[]'))
      .map(const StringListConverter())();
  IntColumn get lastUpdated => integer().nullable()();
  TextColumn get subscriptionId => text().nullable()();

  TextColumn get tTags => text()
      .withDefault(const Constant('[]'))
      .map(const StringListConverter())();

  TextColumn get pTags => text()
      .withDefault(const Constant('[]'))
      .map(const StringListConverter())();

  TextColumn get capitalpTags => text()
      .withDefault(const Constant('[]'))
      .map(const StringListConverter())();

  TextColumn get kTags => text()
      .withDefault(const Constant('[]'))
      .map(const StringListConverter())();

  TextColumn get eTags => text()
      .withDefault(const Constant('[]'))
      .map(const StringListConverter())();

  TextColumn get lTags => text()
      .withDefault(const Constant('[]'))
      .map(const StringListConverter())();

  TextColumn get aTags => text()
      .withDefault(const Constant('[]'))
      .map(const StringListConverter())();

  TextColumn get cTags => text()
      .withDefault(const Constant('[]'))
      .map(const StringListConverter())();

  TextColumn get qTags => text()
      .withDefault(const Constant('[]'))
      .map(const StringListConverter())();

  TextColumn get dTag => text().nullable()();
  TextColumn get root => text().nullable()();
  TextColumn get reply => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
