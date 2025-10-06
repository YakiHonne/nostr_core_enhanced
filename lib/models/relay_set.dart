// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:nostr_core_enhanced/db/drift_database.dart';
import 'package:nostr_core_enhanced/models/pubkey_mapping.dart';
import 'package:nostr_core_enhanced/utils/enums.dart';

class RelaySet {
  String get id => buildId(name, pubkey);

  Iterable<String> get urls => relaysMap.keys;

  late String name;

  late String pubkey;

  int relayMinCountPerPubkey;

  RelayDirection direction;

  Map<String, List<PubkeyMapping>> relaysMap = {};

  RelaySetTableCompanion toCompanion() {
    return RelaySetTableCompanion.insert(
      id: id,
      name: name,
      pubkey: pubkey,
      relayMinCountPerPubkey: Value(relayMinCountPerPubkey),
      direction: direction.name,
      relaysMap: Value(
        jsonEncode(
          relaysMap.map(
            (key, value) => MapEntry(
              key,
              value.map((e) => e.toJson()).toList(),
            ),
          ),
        ),
      ),
    );
  }

  RelaySet({
    required this.name,
    required this.pubkey,
    this.relayMinCountPerPubkey = 0,
    required this.relaysMap,
    required this.direction,
  });

  factory RelaySet.fromRelaySetTableData(RelaySetTableData relaySetTableData) {
    final decoded =
        jsonDecode(relaySetTableData.relaysMap) as Map<String, dynamic>;

    final relaysMap = decoded.map(
      (key, value) => MapEntry(
        key,
        (value as List)
            .map((e) =>
                PubkeyMapping.fromMap(jsonDecode(e) as Map<String, dynamic>))
            .toList(),
      ),
    );

    return RelaySet(
      name: relaySetTableData.name,
      pubkey: relaySetTableData.pubkey,
      relayMinCountPerPubkey: relaySetTableData.relayMinCountPerPubkey,
      relaysMap: relaysMap,
      direction: RelayDirection.values.firstWhere(
        (e) => e.name == relaySetTableData.direction,
      ),
    );
  }

  static buildId(String name, String pubKey) {
    return "$name,$pubKey";
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'pubkey': pubkey,
      'relayMinCountPerPubkey': relayMinCountPerPubkey,
      'direction': direction.name,
      'relaysMap': jsonEncode(relaysMap),
    };
  }

  factory RelaySet.fromMap(Map<String, dynamic> map) {
    return RelaySet(
      name: map['name'],
      pubkey: map['pubkey'],
      relayMinCountPerPubkey: map['relayMinCountPerPubkey'] as int,
      direction: RelayDirection.values
          .firstWhere((element) => element.name == map['direction']),
      relaysMap: jsonDecode(map['relaysMap']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RelaySet.fromJson(String source) =>
      RelaySet.fromMap(json.decode(source) as Map<String, dynamic>);
}
