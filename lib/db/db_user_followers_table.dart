// User Followers table
import 'package:drift/drift.dart';
import 'package:nostr_core_enhanced/db/db_type_converters.dart';

class UserFollowersTable extends Table {
  TextColumn get pubkey => text()();
  TextColumn get followers => text()
      .withDefault(const Constant('[]'))
      .map(const StringListConverter())();
  IntColumn get lastRefreshed => integer()();

  @override
  Set<Column> get primaryKey => {pubkey};

  List<Index> get customIndexes => [
        Index('idx_user_followers_pubkey', [pubkey.name] as String),
      ];
}
