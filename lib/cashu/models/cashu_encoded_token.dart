// ignore_for_file: constant_identifier_names

import 'dart:convert';

List<CashuEncodedToken> cashuEncodedTokenFromJson(String str) =>
    List<CashuEncodedToken>.from(
        jsonDecode(str).map((x) => CashuEncodedToken.fromJson(x)));

String cashuEncodedTokenToJson(List<CashuEncodedToken> list) =>
    jsonEncode(list.map((x) => x.toJson()).toList());

class CashuEncodedToken {
  static const String SPENT = 'spent';
  static const String UNSPENT = 'unspent';
  static const String PENDING = 'pending';

  final String encodedToken;
  final int amount;
  final String mint;
  final int createdAt;
  final String status;

  CashuEncodedToken({
    required this.encodedToken,
    required this.amount,
    required this.mint,
    required this.createdAt,
    this.status = PENDING,
  });

  factory CashuEncodedToken.fromMap(Map<String, dynamic> json) {
    return CashuEncodedToken(
      encodedToken: json['encodedToken'],
      amount: json['amount'],
      mint: json['mint'],
      createdAt: json['createdAt'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'encodedToken': encodedToken,
      'amount': amount,
      'mint': mint,
      'createdAt': createdAt,
      'status': status,
    };
  }

  bool get isSpent => status == SPENT;

  bool get isUnspent => status == UNSPENT;

  bool get isPending => status == PENDING;

  String toJson() => jsonEncode(toMap());

  factory CashuEncodedToken.fromJson(String json) =>
      CashuEncodedToken.fromMap(jsonDecode(json));

  CashuEncodedToken copyWith({
    String? encodedToken,
    int? amount,
    String? mint,
    int? createdAt,
    String? status,
  }) {
    return CashuEncodedToken(
      encodedToken: encodedToken ?? this.encodedToken,
      amount: amount ?? this.amount,
      mint: mint ?? this.mint,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
    );
  }
}
