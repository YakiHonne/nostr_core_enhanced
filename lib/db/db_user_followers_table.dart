// User Followers table
import 'package:drift/drift.dart';

class UserFollowersTable extends Table {
  TextColumn get id => text()();
  TextColumn get pubkey => text()();
  TextColumn get followers =>
      text().withDefault(const Constant('[]'))(); // JSON array
  IntColumn get lastUpdated => integer().nullable()();

  @override
  Set<Column> get primaryKey => {pubkey};

  List<Index> get customIndexes => [
        Index('idx_user_followers_pubkey', [pubkey.name] as String),
      ];
}
