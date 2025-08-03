// User App Settings table
import 'package:drift/drift.dart';

class UserAppSettingsTable extends Table {
  TextColumn get pubkey => text()();
  TextColumn get settings =>
      text().withDefault(const Constant('{}'))(); // JSON object
  IntColumn get lastUpdated => integer().nullable()();

  @override
  Set<Column> get primaryKey => {pubkey};
}
