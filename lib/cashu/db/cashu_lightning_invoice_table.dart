import 'package:drift/drift.dart';

@DataClassName('CashuLightningInvoiceTableData')
class CashuLightningInvoiceTable extends Table {
  TextColumn get id => text()();
  TextColumn get pr => text()();
  TextColumn get hash => text()();
  TextColumn get amount => text()();
  TextColumn get mintURL => text()();

  @override
  Set<Column> get primaryKey => {mintURL, hash};

  @override
  String get tableName => 'cashu_lightning_invoice';
}
