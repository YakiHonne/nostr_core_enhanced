// User Drafts table
import 'package:drift/drift.dart';
import 'package:nostr_core_enhanced/db/db_type_converters.dart';

class UserDraftTable extends Table {
  TextColumn get pubkey => text()();
  TextColumn get noteDraft => text()();
  TextColumn get articleDraft => text()();
  TextColumn get replies => text()
      .withDefault(const Constant('{}'))
      .map(const StringMapConverter())();
  TextColumn get smartWidgetsDraft => text()
      .withDefault(const Constant('{}'))
      .map(const StringMapConverter())();

  @override
  Set<Column> get primaryKey => {pubkey};

  List<Index> get customIndexes => [
        Index('idx_user_drafts_pubkey', [pubkey.name] as String),
      ];
}
