import 'package:drift/drift.dart';

class CashuInvoiceTable extends Table {
  TextColumn get id => text()();
  TextColumn get quote => text()();
  TextColumn get request => text()();
  BoolColumn get paid => boolean()();
  TextColumn get amount => text()();
  IntColumn get expiry => integer()();
  TextColumn get mintURL => text()();

  @override
  Set<Column> get primaryKey => {mintURL, quote};

  @override
  String get tableName => 'IInvoice';
}
