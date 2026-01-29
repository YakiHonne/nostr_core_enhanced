import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart';

import '../../../../nostr/nips/nip_019.dart';
import 'nut_18.dart';

class Nut26 {
  static const String hrp = 'creqb';

  static String encode(PaymentRequest request) {
    final tlvBytes = _encodeTLV(request);
    // final fiveBitWords = _convertBits(tlvBytes, 8, 5, true);
    // final bech32Data = Bech32(hrp, fiveBitWords);
    // Note: Most bech32 packages for Dart are old and only support bech32.
    // However, we need bech32m for NUT-26.
    // If the package doesn't support it, we'd need a custom implementation.
    // For now, let's use the package and hope it supports it via a codec or similar,
    // or implement the checksum manually if we want to be safe.
    // NUT-26 Spec: creqb + 1 + bech32m(TLV(PaymentRequest))

    return _bech32mEncode(hrp, tlvBytes).toUpperCase();
  }

  static PaymentRequest decode(String encoded) {
    if (!encoded.toLowerCase().startsWith(hrp)) {
      throw Exception('Invalid HRP');
    }
    final tlvBytes = _bech32mDecode(encoded);
    return _decodeTLV(tlvBytes);
  }

  static Uint8List _encodeTLV(PaymentRequest request) {
    final List<int> bytes = [];

    void addTLV(int type, Uint8List value) {
      bytes.add(type);
      final length = value.length;
      final lengthBytes = ByteData(2)..setUint16(0, length, Endian.big);
      bytes.addAll(lengthBytes.buffer.asUint8List());
      bytes.addAll(value);
    }

    if (request.id != null) {
      addTLV(0x01, Uint8List.fromList(utf8.encode(request.id!)));
    }
    if (request.amount != null) {
      final amountBytes = ByteData(8)
        ..setUint64(0, request.amount!, Endian.big);
      addTLV(0x02, amountBytes.buffer.asUint8List());
    }
    if (request.unit != null) {
      if (request.unit == 'sat') {
        addTLV(0x03, Uint8List.fromList([0x00]));
      } else {
        addTLV(0x03, Uint8List.fromList(utf8.encode(request.unit!)));
      }
    }
    if (request.singleUse != null) {
      addTLV(0x04, Uint8List.fromList([request.singleUse! ? 0x01 : 0x00]));
    }
    if (request.mints != null) {
      for (final mint in request.mints!) {
        addTLV(0x05, Uint8List.fromList(utf8.encode(mint)));
      }
    }
    if (request.description != null) {
      addTLV(0x06, Uint8List.fromList(utf8.encode(request.description!)));
    }
    if (request.transports != null) {
      for (final transport in request.transports!) {
        addTLV(0x07, _encodeTransportTLV(transport));
      }
    }
    if (request.nut10 != null) {
      addTLV(0x08, _encodeNut10TLV(request.nut10!));
    }

    return Uint8List.fromList(bytes);
  }

  static Uint8List _encodeTransportTLV(Transport transport) {
    final List<int> bytes = [];

    void addSubTLV(int type, Uint8List value) {
      bytes.add(type);
      final length = value.length;
      final lengthBytes = ByteData(2)..setUint16(0, length, Endian.big);
      bytes.addAll(lengthBytes.buffer.asUint8List());
      bytes.addAll(value);
    }

    // kind: 0=nostr, 1=http_post
    int kind = 1;
    if (transport.type == 'nostr') kind = 0;
    addSubTLV(0x01, Uint8List.fromList([kind]));

    // target
    if (kind == 0) {
      // nostr target: 32-byte pubkey
      String pubkey = transport.target;
      if (pubkey.startsWith('npub')) {
        pubkey = Nip19.decodePubkey(pubkey);
      } else if (pubkey.startsWith('nprofile')) {
        final decoded = Nip19.decodeShareableEntity(pubkey);
        pubkey = decoded['special'] ?? '';
      }
      addSubTLV(0x02, Uint8List.fromList(hex.decode(pubkey)));

      // If it was nprofile, we might have relays to add as tags
      if (transport.target.startsWith('nprofile')) {
        final decoded = Nip19.decodeShareableEntity(transport.target);
        final relays = decoded['relays'] as List<String>?;
        if (relays != null) {
          for (final relay in relays) {
            addSubTLV(0x03, _encodeTagTuple('r', [relay]));
          }
        }
      }
    } else {
      addSubTLV(0x02, Uint8List.fromList(utf8.encode(transport.target)));
    }

    if (transport.tags != null) {
      for (final tag in transport.tags!) {
        if (tag.isNotEmpty) {
          addSubTLV(0x03, _encodeTagTuple(tag[0], tag.sublist(1)));
        }
      }
    }

    return Uint8List.fromList(bytes);
  }

  static Uint8List _encodeNut10TLV(Nut10Option nut10) {
    final List<int> bytes = [];

    void addSubTLV(int type, Uint8List value) {
      bytes.add(type);
      final length = value.length;
      final lengthBytes = ByteData(2)..setUint16(0, length, Endian.big);
      bytes.addAll(lengthBytes.buffer.asUint8List());
      bytes.addAll(value);
    }

    // kind: 0=P2PK, 1=HTLC
    int kind = 0;
    if (nut10.kind == 'HTLC') kind = 1;
    addSubTLV(0x01, Uint8List.fromList([kind]));

    addSubTLV(0x02, Uint8List.fromList(utf8.encode(nut10.data)));

    if (nut10.tags != null) {
      for (final tag in nut10.tags!) {
        if (tag.isNotEmpty) {
          addSubTLV(0x03, _encodeTagTuple(tag[0], tag.sublist(1)));
        }
      }
    }

    return Uint8List.fromList(bytes);
  }

  static Uint8List _encodeTagTuple(String key, List<String> values) {
    final List<int> bytes = [];
    final keyBytes = utf8.encode(key);
    bytes.add(keyBytes.length);
    bytes.addAll(keyBytes);
    for (final val in values) {
      final valBytes = utf8.encode(val);
      bytes.add(valBytes.length);
      bytes.addAll(valBytes);
    }
    return Uint8List.fromList(bytes);
  }

  static PaymentRequest _decodeTLV(Uint8List data) {
    String? id;
    int? amount;
    String? unit;
    bool? singleUse;
    List<String> mints = [];
    String? description;
    List<Transport> transports = [];
    Nut10Option? nut10;

    var index = 0;
    while (index < data.length) {
      final type = data[index++];
      final length =
          ByteData.sublistView(data, index, index + 2).getUint16(0, Endian.big);
      index += 2;
      final value = data.sublist(index, index + length);
      index += length;

      switch (type) {
        case 0x01:
          id = utf8.decode(value);
          break;
        case 0x02:
          amount = ByteData.sublistView(value).getUint64(0, Endian.big);
          break;
        case 0x03:
          if (value.length == 1 && value[0] == 0x00) {
            unit = 'sat';
          } else {
            unit = utf8.decode(value);
          }
          break;
        case 0x04:
          singleUse = value[0] == 0x01;
          break;
        case 0x05:
          mints.add(utf8.decode(value));
          break;
        case 0x06:
          description = utf8.decode(value);
          break;
        case 0x07:
          transports.add(_decodeTransportTLV(value));
          break;
        case 0x08:
          nut10 = _decodeNut10TLV(value);
          break;
      }
    }

    return PaymentRequest(
      id: id,
      amount: amount,
      unit: unit,
      singleUse: singleUse,
      mints: mints.isEmpty ? null : mints,
      description: description,
      transports: transports.isEmpty ? null : transports,
      nut10: nut10,
    );
  }

  static Transport _decodeTransportTLV(Uint8List data) {
    String type = '';
    String target = '';
    List<List<String>> tags = [];

    var index = 0;
    while (index < data.length) {
      final subType = data[index++];
      final length =
          ByteData.sublistView(data, index, index + 2).getUint16(0, Endian.big);
      index += 2;
      final value = data.sublist(index, index + length);
      index += length;

      switch (subType) {
        case 0x01:
          type = value[0] == 0 ? 'nostr' : 'post';
          break;
        case 0x02:
          if (type == 'nostr') {
            target = hex.encode(value);
          } else {
            target = utf8.decode(value);
          }
          break;
        case 0x03:
          tags.add(_decodeTagTuple(value));
          break;
      }
    }

    // Post-process nostr target to npub if no relays, or keep as hex for now
    // Spec says: If no "r" tag tuples are present: encode public key as npub
    if (type == 'nostr') {
      final rTags = tags.where((t) => t.isNotEmpty && t[0] == 'r').toList();
      if (rTags.isEmpty) {
        target = Nip19.encodePubkey(target);
      } else {
        // Encode as nprofile
        target = Nip19.encodeShareableEntity(
            'nprofile', target, rTags.map((e) => e[1]).toList(), null, null);
      }
      // Remove 'r' tags from general tags as they are part of target encoding
      tags.removeWhere((t) => t.isNotEmpty && t[0] == 'r');
    }

    return Transport(
        type: type, target: target, tags: tags.isEmpty ? null : tags);
  }

  static Nut10Option _decodeNut10TLV(Uint8List data) {
    String kind = '';
    String nutData = '';
    List<List<String>> tags = [];

    var index = 0;
    while (index < data.length) {
      final subType = data[index++];
      final length =
          ByteData.sublistView(data, index, index + 2).getUint16(0, Endian.big);
      index += 2;
      final value = data.sublist(index, index + length);
      index += length;

      switch (subType) {
        case 0x01:
          kind = value[0] == 0 ? 'P2PK' : 'HTLC';
          break;
        case 0x02:
          nutData = utf8.decode(value);
          break;
        case 0x03:
          tags.add(_decodeTagTuple(value));
          break;
      }
    }

    return Nut10Option(
        kind: kind, data: nutData, tags: tags.isEmpty ? null : tags);
  }

  static List<String> _decodeTagTuple(Uint8List data) {
    final List<String> tuple = [];
    var index = 0;
    while (index < data.length) {
      final len = data[index++];
      final val = utf8.decode(data.sublist(index, index + len));
      tuple.add(val);
      index += len;
    }
    return tuple;
  }

  // Helper for bech32m encoding since base bech32 package might not support it
  static String _bech32mEncode(String hrp, List<int> data) {
    // final combined = [...data, ..._bech32mChecksum(hrp, data)];
    final characters = 'qpzry9x8gf2tvdw0s3jn54khce6mua7l';
    var result = '${hrp}1';
    final fiveBitWords = _convertBits(data, 8, 5, true);
    final checksum = _bech32mChecksum(hrp, fiveBitWords);

    for (final word in [...fiveBitWords, ...checksum]) {
      result += characters[word];
    }
    return result;
  }

  static Uint8List _bech32mDecode(String encoded) {
    final pos = encoded.lastIndexOf('1');
    final hrp = encoded.substring(0, pos).toLowerCase();
    final characters = 'qpzry9x8gf2tvdw0s3jn54khce6mua7l';
    final data = <int>[];
    for (var i = pos + 1; i < encoded.length; i++) {
      data.add(characters.indexOf(encoded[i].toLowerCase()));
    }

    if (!_bech32mVerifyChecksum(hrp, data)) {
      throw Exception('Invalid bech32m checksum');
    }

    final pureData = data.sublist(0, data.length - 6);
    return Uint8List.fromList(_convertBits(pureData, 5, 8, false));
  }

  static const _bech32mConst = 0x2bc830a3;

  static List<int> _bech32mChecksum(String hrp, List<int> data) {
    final values = [..._bech32HrpExpand(hrp), ...data, 0, 0, 0, 0, 0, 0];
    final polymod = _bech32Polymod(values) ^ _bech32mConst;
    final result = <int>[];
    for (var i = 0; i < 6; i++) {
      result.add((polymod >> (5 * (5 - i))) & 31);
    }
    return result;
  }

  static bool _bech32mVerifyChecksum(String hrp, List<int> data) {
    return _bech32Polymod([..._bech32HrpExpand(hrp), ...data]) == _bech32mConst;
  }

  static int _bech32Polymod(List<int> values) {
    var chk = 1;
    for (final v in values) {
      final b = chk >> 25;
      chk = ((chk & 0x1ffffff) << 5) ^ v;
      if ((b >> 0) & 1 == 1) chk ^= 0x3b6a57b2;
      if ((b >> 1) & 1 == 1) chk ^= 0x26508e6d;
      if ((b >> 2) & 1 == 1) chk ^= 0x1ea119fa;
      if ((b >> 3) & 1 == 1) chk ^= 0x3d4233dd;
      if ((b >> 4) & 1 == 1) chk ^= 0x2a1462b3;
    }
    return chk;
  }

  static List<int> _bech32HrpExpand(String hrp) {
    final result = <int>[];
    for (var i = 0; i < hrp.length; i++) {
      result.add(hrp.codeUnitAt(i) >> 5);
    }
    result.add(0);
    for (var i = 0; i < hrp.length; i++) {
      result.add(hrp.codeUnitAt(i) & 31);
    }
    return result;
  }

  static List<int> _convertBits(
      List<int> data, int fromBits, int toBits, bool pad) {
    var acc = 0;
    var bits = 0;
    final result = <int>[];
    final maxv = (1 << toBits) - 1;
    for (final value in data) {
      acc = (acc << fromBits) | value;
      bits += fromBits;
      while (bits >= toBits) {
        bits -= toBits;
        result.add((acc >> bits) & maxv);
      }
    }
    if (pad) {
      if (bits > 0) {
        result.add((acc << (toBits - bits)) & maxv);
      }
    } else if (bits >= fromBits || ((acc << (toBits - bits)) & maxv) != 0) {
      throw Exception('Invalid padding');
    }
    return result;
  }
}
