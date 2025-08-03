// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:cryptography/cryptography.dart';
import 'package:flutter/services.dart';
import 'package:kepler/kepler.dart';
import 'package:nostr_core_enhanced/nostr/event_signer/bip340_event_signer.dart';
import 'package:nostr_core_enhanced/nostr/nips/nip_019.dart';
import 'package:nostr_core_enhanced/nostr/nips/nip_044_v2.dart';
import 'package:nostr_core_enhanced/nostr/utils.dart';
import 'package:pointycastle/digests/sha256.dart';

class Nip44 {
  static Future<String> decryptContent(
    String content,
    String peerPubkey,
    String myPubkey,
    String privkey, {
    String encodeType = 'base64',
    String? prefix,
  }) async {
    try {
      Uint8List? decodeContent;

      if (encodeType == 'base64') {
        decodeContent = base64Decode(content);
      } else if (encodeType == 'bech32') {
        Map map = Nip19.bech32Decode(content, maxLength: content.length);
        assert(map['prefix'] == prefix);
        decodeContent = hexToBytes(map['data']);
      }
      final v = decodeContent![0];
      final nonce = decodeContent.sublist(1, 25);
      final cipherText = decodeContent.sublist(25);
      if (v == 1) {
        final algorithm = Xchacha20(macAlgorithm: MacAlgorithm.empty);
        final secretKey = shareSecret(privkey, peerPubkey);
        SecretBox secretBox =
            SecretBox(cipherText, nonce: nonce, mac: Mac.empty);
        final result =
            await algorithm.decrypt(secretBox, secretKey: SecretKey(secretKey));
        return utf8.decode(result);
      } else if (v == 2) {
        Uint8List shareKey = Nip44v2.shareSecret(privkey, peerPubkey);
        return await Nip44v2.decrypt(content, shareKey);
      } else {
        print("nip44: decryptContent error: unknown algorithm version: $v");
        return "";
      }
    } catch (e) {
      print("nip44: decryptContent error: $e");
      return "";
    }
  }

  static Future<String> encryptContent(
    String plainText,
    String peerPubkey,
    Bip340EventSigner signer,
  ) async {
    Uint8List shareKey = Nip44v2.shareSecret(signer.privateKey!, peerPubkey);
    return await Nip44v2.encrypt(plainText, shareKey);
  }

  static Uint8List shareSecret(String privateString, String publicString) {
    final secretIV = Kepler.byteSecret(privateString, '02$publicString');
    final key = Uint8List.fromList(secretIV[0]);
    return SHA256Digest().process(key);
  }

  static List<int> generate24RandomBytes() {
    final random = Random.secure();
    return List<int>.generate(24, (i) => random.nextInt(256));
  }
}
