import 'dart:convert';

import 'package:nostr_core_enhanced/core/nostr_core_repository.dart';
import 'package:nostr_core_enhanced/db/drift_database.dart';
import 'package:nostr_core_enhanced/nostr/event.dart';

class CashuWallet {
  final String id;
  final int createdAt;
  final String pubkey;
  final String signSecret;
  final List<String> mints;

  CashuWallet({
    required this.id,
    required this.createdAt,
    required this.pubkey,
    required this.signSecret,
    required this.mints,
  });

  factory CashuWallet.fromJson(Map<String, dynamic> json) {
    return CashuWallet(
      id: json['id'],
      createdAt: json['created_at'],
      pubkey: json['pubkey'],
      signSecret: json['sign_secret'],
      mints: json['mints'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'pubkey': pubkey,
      'sign_secret': signSecret,
      'mints': mints,
    };
  }

  @override
  String toString() {
    return 'CashuWallet(pubkey: $pubkey, signSecret: $signSecret, mints: $mints)';
  }

  static Future<CashuWallet?> fromEvent(Event event, NostrCore nc) async {
    final content = await nc.currentSigner!.decrypt44(
      event.content,
      event.pubkey,
    );

    if (content == null) {
      return null;
    }

    final list = jsonDecode(content) as List;
    String signSecret = '';
    List<String> mints = [];

    for (final l in list) {
      if (l is List && l.length >= 2 && l[0] == 'privkey') {
        signSecret = l[1];
      } else if (l is List && l.length >= 2 && l[0] == 'mint') {
        mints.add(l[1]);
      }
    }

    return CashuWallet(
      id: event.id,
      createdAt: event.createdAt,
      pubkey: event.pubkey,
      signSecret: signSecret,
      mints: mints,
    );
  }
}

extension CashuWalletDriftExtension on CashuWallet {
  CashuWalletTableCompanion toCompanion() {
    return CashuWalletTableCompanion.insert(
      id: id,
      createdAt: createdAt,
      pubkey: pubkey,
      signSecret: signSecret,
      mints: mints,
    );
  }

  static CashuWallet fromTableData(CashuWalletTableData data) {
    return CashuWallet(
      id: data.id,
      createdAt: data.createdAt,
      pubkey: data.pubkey,
      signSecret: data.signSecret,
      mints: data.mints,
    );
  }
}
