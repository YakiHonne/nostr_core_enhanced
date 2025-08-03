import 'package:bip340/bip340.dart' as bip340;
import 'package:nostr_core_enhanced/utils/helpers.dart';

class Bip340 {
  /// [message] is a hex string
  /// [privateKey] is a  32-bytes hex encoded string
  /// returns a hex string
  static String sign(String message, String privateKey) {
    final aux = Helpers.getSecureRandomHex(32);
    return bip340.sign(privateKey, message, aux);
  }

  /// [message] is a hex string
  /// [signature] is a hex string
  /// [publicKey] is a 32-bytes hex-encoded string
  /// true if the signature is valid otherwise false
  static bool verify(String message, String signature, String? publicKey) {
    return bip340.verify(publicKey!, message, signature);
  }

  /// [privateKey] is a 32-bytes hex-encoded string
  /// returns the public key in form of 32-bytes hex-encoded string
  static String getPublicKey(String privateKey) {
    return bip340.getPublicKey(privateKey);
  }
}
