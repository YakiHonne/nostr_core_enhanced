// Metadata table
import 'package:drift/drift.dart';

class MetadataTable extends Table {
  TextColumn get pubkey => text()();
  TextColumn get name => text().withDefault(const Constant(''))();
  TextColumn get displayName => text().withDefault(const Constant(''))();
  TextColumn get picture => text().withDefault(const Constant(''))();
  TextColumn get banner => text().withDefault(const Constant(''))();
  TextColumn get website => text().withDefault(const Constant(''))();
  TextColumn get about => text().withDefault(const Constant(''))();
  TextColumn get nip05 => text().withDefault(const Constant(''))();
  TextColumn get lud16 => text().withDefault(const Constant(''))();
  TextColumn get lud06 => text().withDefault(const Constant(''))();
  IntColumn get createdAt => integer()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
  IntColumn get refreshedTimestamp => integer().nullable()();

  @override
  Set<Column> get primaryKey => {pubkey};

  List<Index> get customIndexes => [
        Index('idx_metadata_name', [name.name] as String),
        Index('idx_metadata_display_name', [displayName.name] as String),
        Index('idx_metadata_nip05', [nip05.name] as String),
      ];
}
