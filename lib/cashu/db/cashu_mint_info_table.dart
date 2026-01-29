import 'package:drift/drift.dart';
import 'package:nostr_core_enhanced/db/db_type_converters.dart';

class CashuMintInfoTable extends Table {
  TextColumn get mintURL => text()();
  TextColumn get name => text().withDefault(const Constant(''))();
  TextColumn get iconUrl => text().withDefault(const Constant(''))();
  TextColumn get pubkey => text().withDefault(const Constant(''))();
  TextColumn get version => text().withDefault(const Constant(''))();
  TextColumn get description => text().withDefault(const Constant(''))();
  TextColumn get descriptionLong => text().withDefault(const Constant(''))();
  TextColumn get contact => text().map(const StringListOfMapConverter())();
  TextColumn get motd => text().withDefault(const Constant(''))();
  TextColumn get nutsJson => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {mintURL};

  @override
  String get tableName => 'MintInfo';
}
