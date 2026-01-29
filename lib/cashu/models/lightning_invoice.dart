import 'package:bolt11_decoder/bolt11_decoder.dart';
import 'package:nostr_core_enhanced/db/drift_database.dart';
import 'package:nostr_core_enhanced/utils/utils.dart';

import '../utils/tools.dart';

abstract class Receipt {
  String get id;

  String get mintURL;

  String get amount;

  String get paymentKey;

  String get redemptionKey;

  String get request;

  /// Expiry timestamp in seconds, 0 means never expires
  int get expiry;

  bool get isExpired;
}

class LightningInvoice implements Receipt {
  LightningInvoice({
    required this.id,
    required this.pr,
    required this.hash,
    required this.amount,
    required this.mintURL,
  });

  @override
  final String id;
  final String pr;
  final String hash;
  @override
  final String amount;
  @override
  final String mintURL;

  static LightningInvoice? fromServerMap(
    Map json,
    String mintURL,
    String amount,
  ) {
    final pr = Tools.getValueAs<String>(json, 'pr', '');
    final hash = Tools.getValueAs<String>(json, 'hash', '');
    if (pr.isEmpty || hash.isEmpty) return null;
    return LightningInvoice(
      id: uuid.v4(),
      pr: pr,
      hash: hash,
      amount: amount,
      mintURL: mintURL,
    );
  }

  @override
  String toString() {
    return '${super.toString()}, pr: $pr, hash: $hash, mintURL: $mintURL';
  }

  Map<String, Object?> toMap() => {
        'id': id,
        'pr': pr,
        'hash': hash,
        'amount': amount,
        'mintURL': mintURL,
      };

  static LightningInvoice fromMap(Map<String, Object?> map) {
    return LightningInvoice(
      id: Tools.getValueAs(map, 'id', ''),
      pr: Tools.getValueAs(map, 'pr', ''),
      hash: Tools.getValueAs(map, 'hash', ''),
      amount: Tools.getValueAs(map, 'amount', ''),
      mintURL: Tools.getValueAs(map, 'mintURL', ''),
    );
  }

  static String? tableName() {
    return "LightningInvoice";
  }

  //primaryKey
  static List<String?> primaryKey() {
    return ['mintURL', 'hash'];
  }

  static List<String?> ignoreKey() {
    return [];
  }

  @override
  String get paymentKey => pr;

  @override
  String get redemptionKey => hash;

  @override
  bool get isExpired {
    try {
      final req = Bolt11PaymentRequest(pr);
      for (final tag in req.tags) {
        if (tag.type == 'expiry' && tag.data is int) {
          final expiry = req.timestamp + tag.data;
          return expiry < DateTime.now().millisecondsSinceEpoch ~/ 1000;
        }
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  @override
  String get request => pr;

  @override
  int get expiry => 0;
}

extension LightningInvoiceDriftExtension on LightningInvoice {
  /// Convert LightningInvoice model to Drift table companion for inserting/updating
  CashuLightningInvoiceTableCompanion toCompanion() {
    return CashuLightningInvoiceTableCompanion.insert(
      id: id,
      pr: pr,
      hash: hash,
      amount: amount,
      mintURL: mintURL,
    );
  }

  /// Create LightningInvoice model from Drift table data
  static LightningInvoice fromTableData(CashuLightningInvoiceTableData data) {
    return LightningInvoice.fromMap({
      'id': data.id,
      'pr': data.pr,
      'hash': data.hash,
      'amount': data.amount,
      'mintURL': data.mintURL,
    });
  }
}
