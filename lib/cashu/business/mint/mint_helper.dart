import 'package:nostr_core_enhanced/cashu/business/mint/mint_info_store.dart';
import 'package:nostr_core_enhanced/cashu/business/mint/mint_store.dart';
import 'package:nostr_core_enhanced/cashu/business/proof/keyset_helper.dart';
import 'package:nostr_core_enhanced/cashu/models/keyset_info.dart';
import 'package:nostr_core_enhanced/cashu/models/mint_info.dart';
import 'package:nostr_core_enhanced/cashu/models/mint_model.dart';
import 'package:nostr_core_enhanced/cashu/utils/list_extension.dart';
import 'package:nostr_core_enhanced/utils/utils.dart';

import '../../core/keyset_store.dart';
import '../../core/mint_actions.dart';
import '../../core/nuts/define.dart';
import '../../core/nuts/v1/nut.dart' as v1;

class MintHelper {
  static String getMintURL(String url) {
    url = url.trim();
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      logger.e(() => '[E][Cashu - getMintURL] mintURL must starts with https');
      url = 'https://$url';
    }

    if (url.endsWith('/')) {
      url = url.substring(0, url.length - 1);
    }
    return url;
  }

  static Future<MintInfo?> getMintInfo(String mintURL) async {
    final url = getMintURL(mintURL);
    final info = await MintInfoStore.getMintInfo(url);

    if (info != null) {
      return info;
    }

    final mintVersion = await getMaxNutsVersion(url);
    final mint = IMint(pubkey: '', mintURL: url, maxNutsVersion: mintVersion);
    final response = await mint.requestMintInfoAction(mintURL: mint.mintURL);

    if (response.isSuccess) {
      await MintInfoStore.addMintInfo(response.data);
      return response.data;
    }

    return null;
  }

  static Future<bool> updateMintInfoFromRemote(IMint mint) async {
    final mintInfo = await getMintInfo(mint.mintURL);

    if (mintInfo == null) {
      return false;
    }

    mint.info = mintInfo;

    if (mint.name.isEmpty) {
      mint.name = mintInfo.name;
    }

    MintStore.updateMint(mint);
    return true;
  }

  static Future updateMintKeysetFromRemote(IMint mint) async {
    final keysets = await KeysetHelper.fetchKeysetFromRemote(mint);
    if (keysets.isEmpty) return;

    mint.cleanKeysetId();
    _updateMintKeyset(mint, keysets);
  }

  static Future updateMintKeysetFromLocal(IMint mint) async {
    final keysets =
        await KeysetStore.getKeyset(mintURL: mint.mintURL, active: true);
    if (keysets.isEmpty) return;

    _updateMintKeyset(mint, keysets);
  }

  static void _updateMintKeyset(IMint mint, List<KeysetInfo> keysets) {
    if (keysets.isEmpty) return;
    final newKeysets = keysets
        .groupBy((item) => item.unit)
        .entries
        .map((map) {
          final target = KeysetHelper.findBetterKeyset(map.value);
          return MapEntry(map.key, target);
        })
        .expand((map) => [map.value])
        .nonNulls;
    for (var keyset in newKeysets) {
      mint.updateKeysetId(keyset.id, keyset.unit);
    }
  }

  static Future<int> getMaxNutsVersion(String mintURL) async {
    final response = await v1.Nut6.requestMintInfo(mintURL: mintURL);
    if (response.isSuccess) return 1;
    return 0;
  }
}

extension MintKeysPayloadEx on MintKeysPayload {
  KeysetInfo asKeysetInfo(String mintURL) {
    return KeysetInfo(
      id: id,
      mintURL: mintURL,
      unit: unit,
      active: true,
      keyset: keys,
    );
  }
}
