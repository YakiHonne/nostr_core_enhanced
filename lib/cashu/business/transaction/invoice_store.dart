import 'package:nostr_core_enhanced/cashu/business/wallet/cashu_manager.dart';
import 'package:nostr_core_enhanced/cashu/models/invoice.dart';
import 'package:nostr_core_enhanced/cashu/models/lightning_invoice.dart';

class InvoiceStore {
  static Future<bool> addInvoice(Receipt invoice) async {
    final db = CashuManager.shared.db;
    if (invoice is IInvoice) {
      await db.saveInvoice(invoice);
    } else if (invoice is LightningInvoice) {
      await db.saveLightningInvoice(invoice);
    }
    return true;
  }

  static Future<List<Receipt>> getAllInvoice() async {
    return [
      ...await CashuManager.shared.db.loadAllInvoices(),
      ...await CashuManager.shared.db.loadAllLightningInvoices()
    ];
  }

  static Future<bool> deleteInvoice(List<Receipt> delInvoices) async {
    if (delInvoices.isEmpty) return true;

    final invoiceIds = <String>[];
    final lightningInvoiceIds = <String>[];

    for (var invoice in delInvoices) {
      if (invoice is IInvoice) {
        invoiceIds.add(invoice.id);
      } else if (invoice is LightningInvoice) {
        lightningInvoiceIds.add(invoice.id);
      }
    }

    int deleted = 0;

    deleted += await CashuManager.shared.db.removeInvoices(invoiceIds);
    deleted += await CashuManager.shared.db
        .removeLightningInvoices(lightningInvoiceIds);

    return deleted == delInvoices.length;
  }
}
