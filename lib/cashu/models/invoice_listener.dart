import 'package:nostr_core_enhanced/cashu/models/lightning_invoice.dart';
import 'package:nostr_core_enhanced/cashu/models/mint_model.dart';

abstract mixin class CashuListener {
  void handleInvoicePaid(Receipt receipt) {}
  void handleBalanceChanged(IMint mint) {}
  void handleMintListChanged(List<IMint> mints) {}
  void handlePaymentCompleted(String paymentKey) {}
  void handleHistoryChanged() {}
}
