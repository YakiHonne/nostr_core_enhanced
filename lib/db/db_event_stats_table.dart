// Event Stats table
import 'package:drift/drift.dart';

class EventStatsTable extends Table {
  TextColumn get id => text()();
  IntColumn get repliesCount => integer().withDefault(const Constant(0))();
  IntColumn get repostsCount => integer().withDefault(const Constant(0))();
  IntColumn get reactionsCount => integer().withDefault(const Constant(0))();
  IntColumn get zapsCount => integer().withDefault(const Constant(0))();
  IntColumn get zapAmount => integer().withDefault(const Constant(0))();
  IntColumn get lastUpdated => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
