import 'package:nostr_core_enhanced/cashu/business/wallet/cashu_manager.dart';
import 'package:nostr_core_enhanced/cashu/models/keyset_info.dart';

class KeysetStore {
  /// Adds a keyset collection
  static Future<bool> addOrReplaceKeysets(List<KeysetInfo> keysets) async {
    if (keysets.isEmpty) return false;
    await CashuManager.shared.db.saveKeysetInfos(keysets);
    return true;
  }

  /// Returns a valid keyset object based on the parameters
  static Future<List<KeysetInfo>> getKeyset({
    String? mintURL,
    String? id,
    String? unit,
    bool? active,
  }) async {
    final db = CashuManager.shared.db;
    return db.loadKeysetInfos(
      mintURL: mintURL,
      id: id,
      unit: unit,
      active: active,
    );
  }
}
