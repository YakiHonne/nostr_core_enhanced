import 'package:nostr_core_enhanced/cashu/business/wallet/cashu_manager.dart';
import 'package:nostr_core_enhanced/cashu/models/unblinding_data.dart';

class UnblindingDataStore {
  static Future add(List<UnblindingData> list) async {
    await CashuManager.shared.db.saveUnblindingDataList(list);
  }

  static Future<List<UnblindingData>> getData() async {
    return CashuManager.shared.db.loadAllUnblindingData();
  }

  static Future<bool> delete(List<UnblindingData> delData) async {
    if (delData.isEmpty) return true;

    await CashuManager.shared.db.removeUnblindingDataList(delData);
    return true;
  }
}
