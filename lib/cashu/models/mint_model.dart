import 'package:drift/drift.dart';
import 'package:nostr_core_enhanced/db/drift_database.dart';

import '../business/mint/mint_helper.dart';
import '../utils/tools.dart';
import 'mint_info.dart';

class IMint {
  IMint({
    required this.pubkey,
    required String mintURL,
    this.maxNutsVersion = 0,
    this.name = '',
    this.balance = 0,
  }) : mintURL = MintHelper.getMintURL(mintURL);

  final String pubkey;

  final String mintURL;

  String name;

  int balance;

  int maxNutsVersion;

  /// key: unit, value: keysetId
  final Map<String, String> _keysetIds = {};

  MintInfo? info;

  String? keysetId(String unit) => _keysetIds[unit];
  void updateKeysetId(String keysetId, String unit) {
    if (keysetId.isEmpty) return;
    _keysetIds[unit] = keysetId;
  }

  void cleanKeysetId() => _keysetIds.clear();

  @override
  String toString() {
    return '${super.toString()}, url: $mintURL, maxNutsVersion: $maxNutsVersion, balance: $balance, info: $info';
  }

  Map<String, Object?> toMap() => {
        'mintURL': mintURL,
        'maxNutsVersion': maxNutsVersion,
        'name': name,
        'balance': balance,
      };

  static IMint fromMap(Map<String, Object?> map) => IMint(
        pubkey: Tools.getValueAs(map, 'pubkey', ''),
        mintURL: Tools.getValueAs(map, 'mintURL', ''),
        maxNutsVersion: Tools.getValueAs(map, 'maxNutsVersion', 0),
        name: Tools.getValueAs(map, 'name', ''),
        balance: Tools.getValueAs(map, 'balance', 0),
      );

  static String? tableName() {
    return "IMint";
  }

  static List<String?> primaryKey() {
    return ['mintURL'];
  }

  static List<String?> ignoreKey() {
    return ['_keysetIds, info'];
  }
}

extension MintDriftExtension on IMint {
  /// Convert IMint model to Drift table companion for inserting/updating
  CashuMintTableCompanion toCompanion() {
    return CashuMintTableCompanion.insert(
      pubkey: pubkey,
      mintURL: mintURL,
      name: Value(name),
      balance: Value(balance),
      maxNutsVersion: Value(maxNutsVersion),
    );
  }

  /// Create IMint model from Drift table data
  static IMint fromTableData(CashuMintTableData data) {
    return IMint.fromMap({
      'pubkey': data.pubkey,
      'mintURL': data.mintURL,
      'name': data.name,
      'balance': data.balance,
      'maxNutsVersion': data.maxNutsVersion,
    });
  }
}
