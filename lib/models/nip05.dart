// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nostr_core_enhanced/db/drift_database.dart';

class Nip05 extends Equatable {
  final String pubkey;
  final String nip05;
  final bool valid;
  final int updatedAt;

  const Nip05({
    required this.pubkey,
    required this.nip05,
    required this.valid,
    required this.updatedAt,
  });

  bool needsUpdate(Duration duration) =>
      updatedAt <
      (DateTime.now().subtract(duration).millisecondsSinceEpoch ~/ 1000);

  Nip05TableCompanion toCompanion() {
    return Nip05TableCompanion.insert(
      pubkey: pubkey,
      nip05: nip05,
      valid: Value(valid),
      updatedAt: updatedAt,
    );
  }

  factory Nip05.fromNip05TableData(Nip05TableData data) {
    return Nip05(
      pubkey: data.pubkey,
      nip05: data.nip05,
      valid: data.valid,
      updatedAt: data.updatedAt,
    );
  }

  static Future<bool> check(String nip05Address, String pubkey) async {
    var name = "_";
    var address = nip05Address;
    var strs = nip05Address.split("@");
    if (strs.length > 1) {
      name = strs[0];
      address = strs[1];
    }

    var url = "https://$address/.well-known/nostr.json?name=$name";

    try {
      Uri uri = Uri.parse(url).replace(scheme: 'https');

      var response = await http.get(uri);

      final data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      if (data["names"] != null) {
        var dataPubkey = data["names"][name];
        if (dataPubkey != null && dataPubkey == pubkey) {
          return true;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return false;
  }

  static Future<String?> getPubkey(String nip05Address) async {
    var name = "_";
    var address = nip05Address;
    var strs = nip05Address.split("@");
    if (strs.length > 1) {
      name = strs[0];
      address = strs[1];
    }

    var url = "https://$address/.well-known/nostr.json?name=$name";

    try {
      Uri uri = Uri.parse(url).replace(scheme: 'https');

      var response = await http.get(uri);

      final data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      if (data["names"] != null) {
        return data["names"][name];
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return null;
  }

  @override
  List<Object?> get props => [
        pubkey,
        nip05,
        valid,
        updatedAt,
      ];

  Nip05 copyWith({
    String? pubkey,
    String? nip05,
    bool? valid,
    int? updatedAt,
  }) {
    return Nip05(
      pubkey: pubkey ?? this.pubkey,
      nip05: nip05 ?? this.nip05,
      valid: valid ?? this.valid,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
