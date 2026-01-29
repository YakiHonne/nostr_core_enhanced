import 'package:bolt11_decoder/bolt11_decoder.dart';
import 'package:nostr_core_enhanced/cashu/core/nuts/nut_00.dart';

import '../utils/tools.dart';

enum IHistoryType {
  unknown(0),
  eCash(1),
  lnInvoice(2),
  multiMintSwap(3),
  swapForP2PK(4);

  final int value;

  const IHistoryType(this.value);

  static IHistoryType fromValue(dynamic value) =>
      IHistoryType.values
          .where(
            (element) => element.value == value,
          )
          .firstOrNull ??
      IHistoryType.unknown;
}

class IHistoryEntry {
  IHistoryEntry({
    required this.id,
    required this.amount,
    required this.type,
    required this.timestamp,
    required this.value,
    required this.mints,
    this.sender,
    this.recipient,
    this.preImage,
    this.fee,
    this.isSpent,
  });

  final String id;
  final num amount;

  final int typeRaw = -1;
  final IHistoryType type;

  final double timestamp;

  /// [Receipt.paymentKey] (Lightning invoice) or encoded Cashu token
  final String value;

  /// mints involved
  final String mintsRaw = '';
  final List<String> mints;

  /// sender (nostr username)
  final String? sender;

  /// recipient (nostr username)
  final String? recipient;

  final String? preImage;

  final num? fee;

  /// Whether the token is spent
  bool? isSpent;

  Map<String, Object?> toMap() => {
        'id': id,
        'amount': amount,
        'typeRaw': type.value,
        'timestamp': timestamp,
        'value': value,
        'mintsRaw': mints.join(','),
        'sender': sender,
        'recipient': recipient,
        'preImage': preImage,
        'fee': fee,
        'isSpent': isSpent,
      };

  static IHistoryEntry fromMap(Map<String, Object?> map) {
    final id = Tools.getValueAs(map, 'id', '');
    final amount = Tools.getValueAs<num>(map, 'amount', 0);
    final type = IHistoryType.fromValue(map['typeRaw']);
    final timestamp = Tools.getValueAs(map, 'timestamp', 0.0);
    final value = Tools.getValueAs(map, 'value', '');
    final mintsRaw = Tools.getValueAs(map, 'mintsRaw', '');
    final sender = Tools.getValueAs<String?>(map, 'sender', null);
    final recipient = Tools.getValueAs<String?>(map, 'recipient', null);
    final preImage = Tools.getValueAs<String?>(map, 'preImage', null);
    final fee = Tools.getValueAs<num?>(map, 'fee', 0);
    final isSpent = Tools.getValueAs<int?>(map, 'isSpent', null);

    return IHistoryEntry(
      id: id,
      amount: amount,
      type: type,
      timestamp: timestamp,
      value: value,
      mints: mintsRaw.isEmpty ? <String>[] : mintsRaw.split(','),
      sender: sender,
      recipient: recipient,
      preImage: preImage,
      fee: fee,
      isSpent: isSpent == null ? null : isSpent == 1,
    );
  }

  static String? tableName() {
    return "IHistoryEntry";
  }

  //primaryKey
  static List<String?> primaryKey() {
    return ['id'];
  }

  static List<String?> ignoreKey() {
    return ['mints', 'type'];
  }

  String? get memo {
    switch (type) {
      case IHistoryType.eCash:
        return Nut0.decodedToken(value)?.memo;
      case IHistoryType.lnInvoice:
        try {
          final req = Bolt11PaymentRequest(value);
          for (final tag in req.tags) {
            if (tag.type == 'description' && tag.data is String?) {
              return tag.data == 'enuts' ? 'Cashu deposit' : tag.data;
            }
          }
          return null;
        } catch (_) {
          return null;
        }
      default:
        return null;
    }
  }
}

/// Extension on [IHistoryEntry] to handle functionalities related to Lightning Network invoices.
///
/// This extension is particularly useful when the `type` of [IHistoryEntry] is [IHistoryType.lnInvoice].
extension LnHistoryEntryEx on IHistoryEntry {
  /// Convert IHistoryEntry model to Drift table companion for inserting/updating
  // CashuHistoryEntryTableCompanion toCompanion() {
  //   return CashuHistoryEntryTableCompanion.insert(
  //     id: id,
  //     amount: amount.toDouble(),
  //     typeRaw: type.value,
  //     timestamp: timestamp,
  //     value: value,
  //     mintsRaw: Value(mints.join(',')),
  //     sender: Value(sender),
  //     recipient: Value(recipient),
  //     preImage: Value(preImage),
  //     fee: Value(fee?.toDouble()),
  //     isSpent: Value(isSpent == null ? null : (isSpent! ? 1 : 0)),
  //   );
  // }

  // /// Create IHistoryEntry model from Drift table data
  // static IHistoryEntry fromTableData(CashuHistoryEntryTableData data) {
  //   return IHistoryEntry.fromMap({
  //     'id': data.id,
  //     'amount': data.amount,
  //     'typeRaw': data.typeRaw,
  //     'timestamp': data.timestamp,
  //     'value': data.value,
  //     'mintsRaw': data.mintsRaw,
  //     'sender': data.sender,
  //     'recipient': data.recipient,
  //     'preImage': data.preImage,
  //     'fee': data.fee,
  //     'isSpent': data.isSpent,
  //   });
  // }

  String? get paymentHash {
    if (type != IHistoryType.lnInvoice) return null;
    try {
      final req = Bolt11PaymentRequest(value);
      for (final tag in req.tags) {
        if (tag.type == 'payment_hash' && tag.data is String?) {
          return tag.data;
        }
      }
      return null;
    } catch (_) {
      return null;
    }
  }
}
