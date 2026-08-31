import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nostr_core_enhanced/nostr/nips/nip_020.dart';

void main() {
  test('getOk parses a full OK message', () {
    final ok = Nip20.getOk(jsonEncode(['OK', 'abc', true, 'stored']));
    expect(ok!.eventId, 'abc');
    expect(ok.status, true);
    expect(ok.message, 'stored');
  });

  test('getOk tolerates a relay omitting the message string', () {
    final ok = Nip20.getOk(jsonEncode(['OK', 'abc', false]));
    expect(ok!.eventId, 'abc');
    expect(ok.status, false);
    expect(ok.message, '');
  });

  test('getOk returns null for non-OK payloads', () {
    expect(Nip20.getOk(jsonEncode(['NOTICE', 'hi'])), isNull);
  });
}
