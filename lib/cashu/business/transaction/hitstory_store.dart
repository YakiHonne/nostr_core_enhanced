import 'package:nostr_core_enhanced/cashu/models/cashu_spending_data.dart';
import 'package:nostr_core_enhanced/cashu/models/history_entry.dart';
import 'package:nostr_core_enhanced/cashu/models/lightning_invoice.dart';
import 'package:nostr_core_enhanced/utils/utils.dart';

import '../wallet/cashu_manager.dart';

class HistoryStore {
  /// add history entry
  static Future<bool> _add(IHistoryEntry entry) async {
    // await CashuManager.shared.db.saveHistoryEntry(entry);
    return true;
  }

  /// get history entries
  static Future<List<CashuSpendingData>> getHistory() async {
    final history = await CashuManager.shared.db.getCashuSpendingsByPubkey(
      CashuManager.shared.pubkey,
    );
    return history;
  }

  /// update history entries
  static Future<bool> updateHistoryEntry(IHistoryEntry newEntry) async {
    return _add(newEntry);
  }

  static Future<IHistoryEntry> addToHistory({
    required num amount,
    required IHistoryType type,
    required String value,
    required List<String> mints,
    num? fee,
    bool? isSpent,
  }) async {
    final item = IHistoryEntry(
      id: uuid.v4(),
      amount: amount.toDouble(),
      type: type,
      value: value,
      mints: mints,
      timestamp: DateTime.now().millisecondsSinceEpoch.toDouble(),
      fee: fee?.toInt(),
      isSpent: isSpent,
    );
    await _add(item);
    CashuManager.shared.notifyListenerForHistoryChanged();
    return item;
  }

  static Future<bool> deleteHistory(List<IHistoryEntry> entries) async {
    if (entries.isEmpty) return true;

    // await CashuManager.shared.db.removeHistoryEntries(entries);
    return true;
  }

  static Future<bool> hasReceiptRedeemHistory(Receipt receipt) async {
    // return await CashuManager.shared.db.hasReceiptRedeemHistory(receipt);
    return false;
  }
}
