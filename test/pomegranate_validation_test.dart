import 'package:flutter_test/flutter_test.dart';
import 'package:nostr_core_enhanced/pomegranate/pomegranate_helpers.dart';

void main() {
  group('pomNormaliseUrl', () {
    test('accepts a bare host and adds https', () {
      expect(pomNormaliseUrl('po.example.com'), 'https://po.example.com');
    });

    test('strips a trailing slash', () {
      // Would otherwise produce '…//account' when concatenated.
      expect(pomNormaliseUrl('https://po.example.com/'), 'https://po.example.com');
    });

    test('rejects non-https and empty input', () {
      expect(pomNormaliseUrl('http://po.example.com'), isNull);
      expect(pomNormaliseUrl('   '), isNull);
    });

    // Sign-in is gated on this returning null: a half-typed host must not
    // reach OAuth, which would send the user to a bogus login page.
    test('rejects a half-typed host', () {
      expect(pomNormaliseUrl('po'), isNull);
      expect(pomNormaliseUrl('po.'), isNull);
      expect(pomNormaliseUrl('https://'), isNull);
      expect(pomNormaliseUrl('ftp://po.example.com'), isNull);
    });
  });

  group('pomParsePrivateKey', () {
    // Trust boundary: an invalid key that slipped through would be sharded to
    // the operators and the account left unrecoverable.
    const validHex =
        '67dea2ed018072d675f5415ecfaed7d2597555e202d85b3d65ea4e58d2d92ffa';

    test('accepts 64-char hex, normalising case', () {
      expect(pomParsePrivateKey(validHex), validHex);
      expect(pomParsePrivateKey(validHex.toUpperCase()), validHex);
      expect(pomParsePrivateKey('  $validHex  '), validHex);
    });

    test('rejects malformed encodings', () {
      expect(pomParsePrivateKey(''), isNull);
      expect(pomParsePrivateKey('nsec1notarealkey'), isNull);
      expect(pomParsePrivateKey('zz${validHex.substring(2)}'), isNull);
      expect(pomParsePrivateKey(validHex.substring(1)), isNull);
    });

    test('rejects scalars outside the secp256k1 range', () {
      // 0 and n are both invalid private keys; n - 1 is the largest valid one.
      const order =
          'fffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364141';
      const orderMinusOne =
          'fffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364140';

      expect(pomParsePrivateKey('0' * 64), isNull);
      expect(pomParsePrivateKey(order), isNull);
      expect(pomParsePrivateKey(orderMinusOne), orderMinusOne);
    });
  });
}
