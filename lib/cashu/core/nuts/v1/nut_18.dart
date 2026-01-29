import 'dart:convert';
import 'dart:typed_data';

import 'package:cbor/cbor.dart';

import '../../../utils/tools.dart';

class Transport {
  final String type;
  final String target;
  final List<List<String>>? tags;

  Transport({
    required this.type,
    required this.target,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    return {
      't': type,
      'a': target,
      if (tags != null) 'g': tags,
    };
  }

  factory Transport.fromJson(Map<String, dynamic> json) {
    return Transport(
      type: json['t'] as String,
      target: json['a'] as String,
      tags: (json['g'] as List?)
          ?.map((e) => (e as List).cast<String>().toList())
          .toList(),
    );
  }
}

class Nut10Option {
  final String kind;
  final String data;
  final List<List<String>>? tags;

  Nut10Option({
    required this.kind,
    required this.data,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    return {
      'k': kind,
      'd': data,
      if (tags != null) 't': tags,
    };
  }

  factory Nut10Option.fromJson(Map<String, dynamic> json) {
    return Nut10Option(
      kind: json['k'] as String,
      data: json['d'] as String,
      tags: (json['t'] as List?)
          ?.map((e) => (e as List).cast<String>().toList())
          .toList(),
    );
  }
}

class PaymentRequest {
  final String? id;
  final int? amount;
  final String? unit;
  final bool? singleUse;
  final List<String>? mints;
  final String? description;
  final List<Transport>? transports;
  final Nut10Option? nut10;

  PaymentRequest({
    this.id,
    this.amount,
    this.unit,
    this.singleUse,
    this.mints,
    this.description,
    this.transports,
    this.nut10,
  });

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'i': id,
      if (amount != null) 'a': amount,
      if (unit != null) 'u': unit,
      if (singleUse != null) 's': singleUse,
      if (mints != null) 'm': mints,
      if (description != null) 'd': description,
      if (transports != null) 't': transports!.map((e) => e.toJson()).toList(),
      if (nut10 != null) 'nut10': nut10!.toJson(),
    };
  }

  factory PaymentRequest.fromJson(Map<String, dynamic> json) {
    return PaymentRequest(
      id: json['i'] as String?,
      amount: json['a'] as int?,
      unit: json['u'] as String?,
      singleUse: json['s'] as bool?,
      mints: (json['m'] as List?)?.cast<String>(),
      description: json['d'] as String?,
      transports: (json['t'] as List?)
          ?.map((e) => Transport.fromJson(e as Map<String, dynamic>))
          .toList(),
      nut10: json['nut10'] != null
          ? Nut10Option.fromJson(json['nut10'] as Map<String, dynamic>)
          : null,
    );
  }

  String encodeV18() {
    final jsonData = toJson();
    final cborBytes = cbor.encode(CborValue(jsonData));
    final base64String = Uint8List.fromList(cborBytes).asBase64String();
    return 'creqA${base64String.base64urlFromBase64()}';
  }

  static PaymentRequest decode(String encoded) {
    if (encoded.startsWith('creqA')) {
      final base64String = encoded.substring(5);
      final normalized = base64String.base64FromBase64url();
      final cborBytes = base64.decode(normalized);
      final cborValue = cbor.decode(cborBytes);
      final jsonMap = _cborToJson(cborValue);
      if (jsonMap is Map) {
        return PaymentRequest.fromJson(jsonMap.cast<String, dynamic>());
      }
      throw Exception('Invalid CBOR data');
    } else {
      throw Exception('Unsupported encoding format');
    }
  }

  static dynamic _cborToJson(CborValue value) {
    return value.toObject();
  }
}
