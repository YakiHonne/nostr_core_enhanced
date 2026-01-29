// ignore_for_file: non_constant_identifier_names

import 'package:nostr_core_enhanced/cashu/models/proof.dart';
import 'package:nostr_core_enhanced/cashu/models/unblinding_data.dart';
import 'package:nostr_core_enhanced/cashu/utils/crypto_utils.dart';
import 'package:nostr_core_enhanced/cashu/utils/tools.dart';
import 'package:pointycastle/export.dart';

import 'define.dart';

/*
  Bob (mint)
  [k] private key of mint (one for each amount)
  [K] public key of mint
  [Q] promise (blinded signature)

  Alice (user)
  [x] random string (secret message), corresponds to point Y on curve
  [r] private key (blinding factor)
  [T] blinded message
  [Z] proof (unblinded signature)

  Blind Diffie-Hellmann key exchange (BDHKE)
  Mint Bob publishes public key K = kG
  Alice picks secret x and computes Y = hash_to_curve(x)
  Alice sends to Bob: B_ = Y + rG with r being a random blinding factor (blinding)
  Bob sends back to Alice blinded key: C_ = kB_ (these two steps are the DH key exchange) (signing)
  Alice can calculate the unblinded key as C_ - rK = kY + krG - krG = kY = C (unblinding)
  Alice can take the pair (x, C) as a token and can send it to Carol.
  Carol can send (x, C) to Bob who then checks that k*hash_to_curve(x) == C (verification), and if so treats it as a valid spend of a token, adding x to the list of spent secrets.
*/

class Dhke {
  // blinding: B_ = Y + rG
  static BlindMessageResult blindMessage(String secret, [BigInt? r]) {
    var Y = secret.hashToCurve();

    // Random r
    r ??= CryptoUtils.randomPrivateKey().asBigInt();

    // Calculate the point rG
    final G = CryptoUtils.getG();
    final rG = G * r;
    final B_ = Y + rG;

    final bStr = B_ != null ? B_.ecPointToHex() : '';
    return (bStr, r);
  }

  // unblinding: C_ - rK = kY + krG - krG = kY = C
  static ECPoint? unblindingSignature(String cHex, BigInt r, String kHex) {
    final C_ = cHex.pointFromHex();
    final rK = kHex.pointFromHex() * r;
    if (rK == null) return null;
    return C_ - rK;
  }

  static Future<List<Proof>?> constructProofs({
    required List<UnblindingData> data,
    required Future<MintKeys?> Function(
      String mintURL,
      String unit,
      String keysetId,
    ) keysFetcher,
  }) async {
    final List<Proof> proofs = [];
    for (int i = 0; i < data.length; i++) {
      final unblindingData = data[i];
      final promise = unblindingData.signature;
      final secret = unblindingData.secret;
      final keysetId = promise.id;
      final keys = await keysFetcher(
        unblindingData.mintURL,
        unblindingData.unit,
        keysetId,
      );
      if (keys == null) return null;

      final r = unblindingData.r.asBigInt();
      final K = keys[promise.amount];
      if (K == null || r == BigInt.zero) {
        throw Exception('[E][Cashu - constructProofs] key not found.');
      }

      final dleq =
          promise.dleq?.map((key, value) => MapEntry(key.toString(), value));

      final C = unblindingSignature(promise.C_, r, K);
      if (C == null) return null;
      final unblindingProof = Proof(
        id: '$secret+$keysetId',
        keysetId: keysetId,
        amount: promise.amount,
        secret: secret,
        C: C.ecPointToHex(),
        dleq: dleq,
      );

      proofs.add(unblindingProof);
    }

    if (proofs.length != data.length) return null;

    return proofs;
  }
}
