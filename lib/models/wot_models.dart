// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:nostr_core_enhanced/db/drift_database.dart';

class WotCalculationData {
  final String pubkey;
  final Set<String> mutes;
  final Map<String, Set<String>> followings;
  final Set<String> contacts;

  WotCalculationData({
    required this.pubkey,
    required this.mutes,
    required this.followings,
    required this.contacts,
  });

  // factory WotCalculationData.fromUserWotTableData(UserWotTableData data) {
  //   return WotCalculationData(
  //     pubkey: data.pubkey,
  //     mutes: data.mutes,
  //     contacts: data.contacts,
  //     followings: jsonDecode(data.followings),
  //   );
  // }
  // Convert to JSON-compatible format
  Map<String, dynamic> toJson() {
    return {
      'pubkey': pubkey,
      'mutes': mutes,
      'followings': followings,
      'contacts': contacts,
    };
  }

  // Create from JSON-compatible format
  factory WotCalculationData.fromJson(Map<String, dynamic> json) {
    return WotCalculationData(
      pubkey: json['pubkey'] as String,
      mutes: Set<String>.from(json['mutes'] as List),
      followings: (json['followings'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, Set<String>.from(value as Set)),
      ),
      contacts: Set<String>.from(json['contacts'] as Set),
    );
  }
}

class WotModel {
  final String pubkey;
  final int createdAt;
  final Map<String, double> wot;

  WotModel({
    required this.pubkey,
    required this.createdAt,
    required this.wot,
  });

  UserWotTableCompanion toCompanion() {
    return UserWotTableCompanion(
      pubkey: Value(pubkey),
      createdAt: Value(createdAt),
      wot: Value(wot),
    );
  }

  factory WotModel.fromUserWotTableData(UserWotTableData data) {
    return WotModel(
      pubkey: data.pubkey,
      createdAt: data.createdAt,
      wot: data.wot,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pubkey': pubkey,
      'createdAt': createdAt,
      'wot': wot,
    };
  }

  factory WotModel.fromMap(Map<String, dynamic> map) {
    return WotModel(
      pubkey: map['pubkey'] as String,
      createdAt: map['createdAt'] as int,
      wot: Map<String, double>.from((map['wot'] as Map)),
    );
  }

  String toJson() => json.encode(toMap());

  factory WotModel.fromJson(String source) =>
      WotModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class WotScore {
  final String id;
  final String pubkey;
  final double score;
  final int createdAt;
  final String originPubkey;

  WotScore({
    required this.id,
    required this.pubkey,
    required this.score,
    required this.createdAt,
    required this.originPubkey,
  });

  WotScoreTableCompanion toCompanion() {
    return WotScoreTableCompanion(
      id: Value(id),
      pubkey: Value(pubkey),
      score: Value(score),
      createdAt: Value(createdAt),
      originPubkey: Value(originPubkey),
    );
  }

  factory WotScore.fromWotScoreTableData(WotScoreTableData data) {
    return WotScore(
      id: data.id,
      pubkey: data.pubkey,
      score: data.score,
      createdAt: data.createdAt,
      originPubkey: data.originPubkey,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'pubkey': pubkey,
      'score': score,
      'createdAt': createdAt,
      'originPubkey': originPubkey,
    };
  }

  factory WotScore.fromMap(Map<String, dynamic> map) {
    return WotScore(
      id: map['id'] as String,
      pubkey: map['pubkey'] as String,
      score: map['score'] as double,
      createdAt: map['createdAt'] as int,
      originPubkey: map['originPubkey'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WotScore.fromJson(String source) =>
      WotScore.fromMap(json.decode(source) as Map<String, dynamic>);
}
