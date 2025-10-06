// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:nostr_core_enhanced/utils/enums.dart';
import 'package:nostr_core_enhanced/utils/utils.dart';

class PubkeyMapping {
  String pubKey;

  ReadWriteMarker rwMarker;

  PubkeyMapping({
    required this.pubKey,
    required this.rwMarker,
  });

  // coverage:ignore-start
  @override
  String toString() {
    String result = '$pubKey ';
    if (rwMarker == ReadWriteMarker.readOnly) {
      result += "(read)";
    }
    if (rwMarker == ReadWriteMarker.writeOnly) {
      result += "(write)";
    }
    return result;
  }
  // coverage:ignore-end

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PubkeyMapping &&
          runtimeType == other.runtimeType &&
          pubKey == other.pubKey;

  @override
  int get hashCode => pubKey.hashCode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pubKey': pubKey,
      'rwMarker': rwMarker.name,
    };
  }

  factory PubkeyMapping.fromMap(Map<String, dynamic> map) {
    return PubkeyMapping(
      pubKey: map['pubKey'] as String,
      rwMarker: ReadWriteMarker.values.firstWhere(
        (element) => element.name == map['rwMarker'],
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PubkeyMapping.fromJson(String source) =>
      PubkeyMapping.fromMap(json.decode(source) as Map<String, dynamic>);
}
