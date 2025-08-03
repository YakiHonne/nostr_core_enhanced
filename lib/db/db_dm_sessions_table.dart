// DM Session Info table
import 'package:drift/drift.dart';

class DmSessionInfosTable extends Table {
  TextColumn get dmSessionId => text()();
  TextColumn get pubkey => text()();
  TextColumn get peer => text()();
  IntColumn get readMessageTime => integer().nullable()();
  IntColumn get hiddenMessageTime => integer().nullable()();

  @override
  Set<Column> get primaryKey => {dmSessionId};

  List<Index> get customIndexes => [
        Index('idx_dm_session_pubkey', [pubkey.name] as String),
        Index('idx_dm_session_peer', [peer.name] as String),
      ];
}
