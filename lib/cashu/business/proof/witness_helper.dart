import 'dart:convert';

import 'package:nostr_core_enhanced/cashu/core/nuts/v1/nut_11.dart';
import 'package:nostr_core_enhanced/cashu/models/proof.dart';
import 'package:nostr_core_enhanced/utils/spider_util.dart';

import '../../core/nuts/nut_00.dart';
import '../../core/nuts/v1/nut_14.dart';
import '../wallet/cashu_manager.dart';

class WitnessHelper {
  static Future addP2PKWitnessToProof({
    required Proof proof,
    required P2PKSecret secret,
    P2PKWitnessParam? param,
    List<Proof>? allInputs,
    List<BlindedMessage>? allOutputs,
  }) async {
    final pubkeyList = param?.pubkeyList ?? [];
    final defaultKey = CashuManager.shared.defaultSignPubkey?.call() ?? '';
    final immutablePubkeyList = {
      ...pubkeyList,
      if (defaultKey.isNotEmpty) defaultKey
    };
    try {
      final witnessRaw = proof.witness;
      Map witness = {};
      if (witnessRaw.isNotEmpty) {
        witness = jsonDecode(witnessRaw) as Map;
      }
      var originSign = witness['signatures'];
      if (originSign is! List) {
        originSign = [];
      }
      final signatures = [
        ...originSign.map((e) => e.toString()).toList().cast<String>()
      ];
      for (final pubkey in immutablePubkeyList) {
        String msg = proof.secret;

        // if (secret.sigFlag == P2PKSecretSigFlag.all &&
        //     allInputs != null &&
        //     allOutputs != null) {
        //   // If it's SIG_ALL, only the first proof needs the witness
        //   if (proof != allInputs.first) {
        //     return;
        //   }
        //   msg = _constructSigAllMessage(allInputs, allOutputs);
        // }

        final sign = await CashuManager.shared.signFn?.call(
          pubkey,
          msg,
        );
        logger.i(sign?.length);
        if (sign != null && sign.isNotEmpty) signatures.add(sign);
      }

      if (signatures.isNotEmpty) {
        witness['signatures'] = signatures;
      }

      if (witness.isNotEmpty) {
        proof.witness = jsonEncode(witness);
      }
    } catch (e, stack) {
      logger.e(() => '[WitnessHelper - addP2PKWitnessToProof] $e');
      logger.e(() => '[WitnessHelper - addP2PKWitnessToProof] $stack');
    }
  }

  static Future addHTLCWitnessToProof({
    required Proof proof,
    required HTLCSecret secret,
    HTLCWitnessParam? param,
  }) async {
    var pubkey = param?.pubkey ?? '';
    if (pubkey.isEmpty) {
      pubkey = CashuManager.shared.defaultSignPubkey?.call() ?? '';
    }

    final preimage = param?.preimage ?? '';
    if (preimage.isEmpty) return;

    try {
      final witness = HTLCWitness(preimage: preimage);

      // Signature
      if (secret.receivePubKeys.contains(pubkey) ||
          secret.refundPubKeys.contains(pubkey)) {
        final sign =
            await CashuManager.shared.signFn?.call(pubkey, proof.secret);
        if (sign != null && sign.isNotEmpty) witness.signature = sign;
      }

      proof.witness = jsonEncode(witness.toJson());
    } catch (e, stack) {
      logger.e(() => '[WitnessHelper - addHTLCWitnessToProof] $e');
      logger.e(() => '[WitnessHelper - addHTLCWitnessToProof] $stack');
    }
  }

  static String _constructSigAllMessage(
    List<Proof> inputs,
    List<BlindedMessage> outputs,
  ) {
    String msg = '';
    // inputs: secret0 || C0 || secret1 || C1 ...
    for (var proof in inputs) {
      msg += proof.secret;
      msg += proof.C;
    }
    // outputs: amount0 || B_0 || amount1 || B_1 ...
    for (var output in outputs) {
      msg += output.amount.toString();
      msg += output.B_;
    }
    return msg;
  }
}

abstract class WitnessParam {}

class P2PKWitnessParam extends WitnessParam {
  P2PKWitnessParam({
    this.pubkeyList = const [],
  });
  final List<String> pubkeyList;
}

class HTLCWitnessParam extends WitnessParam {
  HTLCWitnessParam({
    this.preimage = '',
    this.pubkey = '',
  });
  final String preimage;
  final String pubkey;
}
