import 'package:flutter_test/flutter_test.dart';
import 'package:nostr_core_enhanced/pomegranate/pomegranate_lookup.dart';

void main() {
  // Cross-checked against argon2-cffi (the RFC 9106 reference):
  //   hash_secret_raw(b'test@example.com', b'pomegranate',
  //                   time_cost=1, memory_cost=65536, parallelism=4,
  //                   hash_len=32, type=Type.ID)
  // A mismatch here means the `m` tag matches no 16440 event, which looks
  // exactly like "no account registered elsewhere".
  test('pomEmailTag matches the argon2id reference vector', () async {
    expect(
      await pomEmailTag('test@example.com'),
      'cd11d61fc202dfd23a1edf0b705b3d9833405e8bfc2a61b7c91a40d49493f519',
    );
  });
}
