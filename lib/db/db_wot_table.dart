// WoT Score table
import 'package:drift/drift.dart';

class WotScoreTable extends Table {
  TextColumn get id => text()();
  TextColumn get pubkey => text()();
  TextColumn get originPubkey => text()();
  RealColumn get score => real().withDefault(const Constant(0.0))();
  IntColumn get depth => integer().withDefault(const Constant(0))();
  IntColumn get lastUpdated => integer().nullable()();

  @override
  Set<Column> get primaryKey => {pubkey};

  List<Index> get customIndexes => [
        Index('idx_wot_score_pubkey', [pubkey.name] as String),
        Index('idx_wot_score_origin', [originPubkey.name] as String),
        Index('idx_wot_score_composite',
            [pubkey.name, originPubkey.name] as String),
      ];
}
