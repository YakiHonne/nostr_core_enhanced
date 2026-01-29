import 'dart:convert';

import 'package:nostr_core_enhanced/cashu/models/proof.dart';
import 'package:nostr_core_enhanced/db/drift_database.dart';

class CashuTokenData {
  final String id;
  final String mintUrl;
  final String unit;
  final String pubkey;
  final int createdAt;
  final List<Proof> proofs;
  final List<String> deletedTokensIds;

  CashuTokenData({
    required this.id,
    required this.mintUrl,
    required this.unit,
    required this.pubkey,
    required this.createdAt,
    required this.proofs,
    required this.deletedTokensIds,
  });

  factory CashuTokenData.fromEventMap(Map<String, dynamic> json) {
    return CashuTokenData(
      id: json['id'],
      mintUrl: json['mint'],
      unit: json['unit'],
      pubkey: json['pubkey'] ?? '',
      createdAt: json['created_at'] ?? 0,
      proofs:
          (json['proofs'] as List).map((x) => Proof.fromServerJson(x)).toList(),
      deletedTokensIds: List<String>.from(json['del'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mint_url': mintUrl,
      'unit': unit,
      'pubkey': pubkey,
      'created_at': createdAt,
      'proofs': proofs.map((x) => x.toMap()).toList(),
      'deleted_tokens_ids': deletedTokensIds,
    };
  }

  int get total {
    return proofs.fold(
        0, (previousValue, element) => previousValue + element.amountNum);
  }
}

extension CashuTokenDataDriftHelper on CashuTokenData {
  CashuTokensTableCompanion toCompanion() {
    return CashuTokensTableCompanion.insert(
      id: id,
      mintUrl: mintUrl,
      unit: unit,
      pubkey: pubkey,
      createdAt: createdAt,
      proofs: proofs.map((e) => jsonEncode(e.toJson())).toList(),
      deletedTokensIds: deletedTokensIds,
    );
  }

  static CashuTokenData fromTableData(CashuTokensTableData data) {
    return CashuTokenData(
      id: data.id,
      mintUrl: data.mintUrl,
      unit: data.unit,
      pubkey: data.pubkey,
      createdAt: data.createdAt,
      proofs: data.proofs
          .map((e) => Proof.fromServerJson(jsonDecode(e), fromDb: true))
          .toList(),
      deletedTokensIds: data.deletedTokensIds,
    );
  }
}
