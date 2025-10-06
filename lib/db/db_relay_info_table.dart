import 'package:drift/drift.dart';
import 'package:nostr_core_enhanced/db/db_type_converters.dart';

class RelayInfoListTable extends Table {
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get pubkey => text()();
  TextColumn get contact => text()();
  TextColumn get nips => text()
      .withDefault(const Constant('[]'))
      .map(const StringListConverter())();
  TextColumn get software => text()();
  TextColumn get icon => text()();
  TextColumn get version => text()();
  TextColumn get url => text()();
  TextColumn get location => text()();
  TextColumn get latency => text()();
  BoolColumn get isPaid => boolean()();
  BoolColumn get isAuth => boolean()();
  IntColumn get lastUpdated => integer()();

  @override
  Set<Column> get primaryKey => {name};
}
