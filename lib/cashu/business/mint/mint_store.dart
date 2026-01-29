import 'package:nostr_core_enhanced/cashu/business/wallet/cashu_manager.dart';
import 'package:nostr_core_enhanced/cashu/models/mint_model.dart';

class MintStore {
  static Future<List<IMint>> getMints() async {
    final db = CashuManager.shared.db;
    return db.loadAllMints();
  }

  static Future<bool> updateMint(IMint mint) async {
    final db = CashuManager.shared.db;
    await db.saveMint(mint);
    return true;
  }

  static Future<bool> addMints(List<IMint> mints) async {
    final db = CashuManager.shared.db;
    await db.saveMints(mints);
    return true;
  }

  static Future<bool> deleteMint(String mintURL, String pubkey) async {
    final db = CashuManager.shared.db;
    await db.removeMint(mintURL, pubkey);
    return true;
  }
}
