// User WoT table
import 'package:drift/drift.dart';
import 'package:nostr_core_enhanced/db/db_type_converters.dart';

class UserWotTable extends Table {
  TextColumn get pubkey => text()();
  IntColumn get createdAt => integer()();
  TextColumn get wot => text()
      .withDefault(const Constant('{}'))
      .map(const DoubleMapConverter())();

  @override
  Set<Column> get primaryKey => {pubkey};

  List<Index> get customIndexes => [
        Index('idx_user_wot_pubkey', [pubkey.name] as String),
      ];
}
