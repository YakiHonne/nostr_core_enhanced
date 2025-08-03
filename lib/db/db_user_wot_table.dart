// User WoT table
import 'package:drift/drift.dart';

class UserWotTable extends Table {
  TextColumn get id => text()();
  TextColumn get pubkey => text()();
  TextColumn get wotData =>
      text().withDefault(const Constant('{}'))(); // JSON object
  IntColumn get lastUpdated => integer().nullable()();

  @override
  Set<Column> get primaryKey => {pubkey};

  List<Index> get customIndexes => [
        Index('idx_user_wot_pubkey', [pubkey.name] as String),
      ];
}
