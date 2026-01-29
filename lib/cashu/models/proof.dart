import 'dart:convert';

import 'package:nostr_core_enhanced/cashu/core/dhke_helper.dart';
import 'package:nostr_core_enhanced/cashu/core/nuts/define.dart';
import 'package:nostr_core_enhanced/cashu/utils/tools.dart';

class Proof {
  Proof({
    required this.id,
    required this.keysetId,
    required this.amount,
    required this.secret,
    required this.C,
    this.witness = '',
    this.stateRaw = 0,
    this.dleq,
    this.lastCheckedMs = 0,
  });

  /// Keyset id, used to link proofs to a mint an its MintKeys.
  final String id;

  final String keysetId;

  /// Amount denominated in Satoshis. Has to match the amount of the mints signing key.
  final String amount;

  /// The initial secret that was (randomly) chosen for the creation of this proof.
  final String secret;

  /// The unblinded signature for this secret, signed by the mints private key.
  final String C;

  String witness;

  String dleqPlainText = '';

  Map<String, dynamic>? dleq;

  int stateRaw;

  /// Last time we checked state (epoch ms). 0 means unknown.
  int lastCheckedMs;

  int get amountNum => int.tryParse(amount) ?? 0;

  /// Y: hash_to_curve(secret)
  String get Y => DhkeHelper.hashToCurve(secret);

  Map<String, dynamic> toJson() => {
        'id': id,
        'keysetId': keysetId,
        'amount': int.tryParse(amount) ?? 0,
        'secret': secret,
        'C': C,
        'state': stateRaw,
        'lastChecked': lastCheckedMs,
        if (witness.isNotEmpty) 'witness': witness,
        if (dleqPlainText.isNotEmpty) 'dleqPlainText': dleqPlainText,
      };

  Map<String, dynamic> toSwap() => {
        'id': keysetId,
        'amount': int.tryParse(amount) ?? 0,
        'secret': secret,
        'C': C,
        if (witness.isNotEmpty) 'witness': witness,
        if (dleqPlainText.isNotEmpty) 'dleq': dleq,
      };

  factory Proof.fromJson(String json) {
    final map = jsonDecode(json);

    final dleqPlainText = map['dleqPlainText'];
    Map<String, dynamic>? dleq;
    if (dleqPlainText is String && dleqPlainText.isNotEmpty) {
      try {
        dleq = jsonDecode(dleqPlainText);
      } catch (_) {}
    }

    return Proof(
      id: map['id']?.toString() ?? '',
      keysetId: map['keysetId']?.toString() ?? '',
      amount: map['amount']?.toString() ?? '0',
      secret: map['secret']?.toString() ?? '',
      C: map['C']?.toString() ?? '',
      witness: map['witness']?.toString() ?? '',
      dleq: dleq,
      stateRaw: map['state'] ?? 0,
      lastCheckedMs: map['lastChecked'] ?? 0,
    );
  }

  Map<String, dynamic> toV4Json() {
    // dleq
    final e = dleq?['e'];
    final s = dleq?['s'];
    final r = dleq?['r'];

    final dleqMap = {
      if (e is String && e.isNotEmpty) 'e': e.hexToBytes(),
      if (s is String && s.isNotEmpty) 's': s.hexToBytes(),
      if (r is String && r.isNotEmpty) 'r': r.hexToBytes(),
    };

    return {
      'a': int.tryParse(amount) ?? 0,
      's': secret,
      'c': C.hexToBytes(),
      if (witness.isNotEmpty) 'w': witness,
      if (dleqMap.keys.length == 3) 'd': dleqMap,
    };
  }

  TokenState get state {
    if (stateRaw < 0 || stateRaw >= TokenState.values.length) {
      return TokenState.live;
    }
    return TokenState.values[stateRaw];
  }

  static Proof fromServerJson(Map<String, Object?> map, {bool fromDb = false}) {
    var amount = '0';
    final amountRaw = map['amount'];

    if (amountRaw is int) {
      amount = amountRaw.toString();
    } else if (amountRaw is String) {
      amount = amountRaw;
    }

    var witness = map['witness'];
    if (witness is! String) {
      witness = '';
    }

    final dleqRaw = map['dleq'];
    Map<String, dynamic>? dleq;
    if (dleqRaw is Map) {
      dleq = dleqRaw.map((key, value) => MapEntry(key.toString(), value));
    }

    final keysetId =
        Tools.getValueAs<String>(map, fromDb ? 'keysetId' : 'id', '');
    final secret = Tools.getValueAs<String>(map, 'secret', '');
    final C = Tools.getValueAs<String>(map, 'C', '');

    return Proof(
      id: '$secret+$keysetId',
      keysetId: keysetId,
      amount: amount,
      secret: secret,
      C: C,
      witness: witness,
      dleq: dleq,
    );
  }

  factory Proof.fromV4Json(String keysetId, Map map) {
    var amount = '0';
    final amountRaw = map['a'];
    if (amountRaw is int) {
      amount = amountRaw.toString();
    } else if (amountRaw is String) {
      amount = amountRaw;
    }

    var witness = map['w'];
    if (witness is! String) {
      witness = '';
    }

    final stateRaw = map['state'];
    final lastChecked = map['lastChecked'];
    final parsedState = stateRaw is int ? stateRaw : 0;
    final parsedChecked = lastChecked is int ? lastChecked : 0;
    final secret = Tools.getValueAs<String>(map, 's', '');
    final C = Tools.getValueAs<String>(map, 'c', '');
    final dleqRaw = map['d'];

    return Proof(
      id: '$secret+$keysetId',
      keysetId: keysetId,
      amount: amount,
      secret: secret,
      C: C,
      witness: witness,
      dleq: dleqRaw,
      stateRaw: parsedState,
      lastCheckedMs: parsedChecked,
    );
  }

  Map<String, Object?> toMap() => {
        'id': id,
        'amount': amount,
        'secret': secret,
        'C': C,
        'dleqPlainText': jsonEncode(dleq)
      };

  Map<String, Object?> toEventMapRaw() => {
        'id': keysetId,
        'amount': num.parse(amount),
        'secret': secret,
        'C': C,
        'dleq': dleq,
      };

  static Proof fromMap(Map<String, Object?> map) {
    final dleqPlainText = map['dleqPlainText'];
    Map<String, dynamic>? dleq;
    if (dleqPlainText is String && dleqPlainText.isNotEmpty) {
      try {
        dleq = jsonDecode(dleqPlainText);
      } catch (_) {}
    }

    final keysetId = Tools.getValueAs<String>(map, 'id', '');
    final amount = Tools.getValueAs<String>(map, 'amount', '0');
    final secret = Tools.getValueAs<String>(map, 'secret', '');
    final C = Tools.getValueAs<String>(map, 'C', '');

    return Proof(
      id: '$secret+$keysetId',
      keysetId: keysetId,
      amount: amount,
      secret: secret,
      C: C,
      dleq: dleq,
    );
  }

  static String? tableName() {
    return "Proof";
  }

  //primaryKey
  static List<String?> primaryKey() {
    return ['id', 'secret'];
  }

  //ignoreKey
  static List<String?> ignoreKey() {
    return ['witness', 'dleq'];
  }

  Proof copyWith({
    String? id,
    int? stateRaw,
    int? lastCheckedMs,
  }) {
    final newData = {
      ...{
        'id': id,
        'keysetId': keysetId,
        'amount': amount,
        'secret': secret,
        'C': C,
        'dleqPlainText': dleqPlainText,
        'state': stateRaw ?? this.stateRaw,
        'lastChecked': lastCheckedMs ?? this.lastCheckedMs,
      },
      if (id != null) 'id': id,
      if (stateRaw != null) 'state': stateRaw,
      if (lastCheckedMs != null) 'lastChecked': lastCheckedMs,
    };
    return Proof.fromMap(newData);
  }

  @override
  String toString() {
    return '${super.toString()}, id: $id, amount: $amount, secret: $secret, C: $C';
  }
}

// extension ProofDriftExtension on Proof {
//   /// Convert Proof model to Drift table companion for inserting/updating
//   CashuProofTableCompanion toCompanion() {
//     return CashuProofTableCompanion.insert(
//       id: id,
//       keysetId: keysetId,
//       amount: amount,
//       secret: secret,
//       C: C,
//       witness: Value(witness),
//       dleqPlainText: Value(dleqPlainText),
//       stateRaw: Value(stateRaw),
//       lastCheckedMs: Value(lastCheckedMs),
//     );
//   }

//   /// Create Proof model from Drift table data
//   static Proof fromTableData(CashuProofTableData data) {
//     return Proof.fromMap({
//       'id': data.id,
//       'keysetId': data.keysetId,
//       'amount': data.amount,
//       'secret': data.secret,
//       'C': data.C,
//       'dleqPlainText': data.dleqPlainText,
//     })
//       ..stateRaw = data.stateRaw
//       ..lastCheckedMs = data.lastCheckedMs
//       ..witness = data.witness;
//   }
// }
