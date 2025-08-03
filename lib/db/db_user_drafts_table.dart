// User Drafts table
import 'package:drift/drift.dart';

class UserDraftTable extends Table {
  TextColumn get id => text()();
  TextColumn get pubkey => text()();
  TextColumn get content => text()();
  IntColumn get kind => integer()();
  TextColumn get tags =>
      text().withDefault(const Constant('[]'))(); // JSON array
  IntColumn get createdAt => integer()();
  IntColumn get lastUpdated => integer().nullable()();

  @override
  Set<Column> get primaryKey => {pubkey};

  List<Index> get customIndexes => [
        Index('idx_user_drafts_pubkey', [pubkey.name] as String),
      ];
}
