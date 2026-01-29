import 'package:nostr_core_enhanced/cashu/business/wallet/cashu_manager.dart';
import 'package:nostr_core_enhanced/cashu/models/mint_info.dart';

class MintInfoStore {
  static Future<MintInfo?> getMintInfo(String mintURL) async {
    final db = CashuManager.shared.db;
    return db.loadMintInfo(mintURL);
  }

  static Future<bool> addMintInfo(MintInfo info) async {
    await CashuManager.shared.db.saveMintInfo(info);
    return true;
  }

  static Future<bool> deleteMint(String mintURL) async {
    await CashuManager.shared.db.removeMintInfo(mintURL);
    return true;
  }
}
