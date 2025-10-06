// User App Settings table
import 'package:drift/drift.dart';

class UserAppSettingsTable extends Table {
  TextColumn get pubkey => text()();
  TextColumn get filters => text().withDefault(const Constant('{}'))();
  TextColumn get contentSources => text().withDefault(const Constant('{}'))();

  @override
  Set<Column> get primaryKey => {pubkey};
}
