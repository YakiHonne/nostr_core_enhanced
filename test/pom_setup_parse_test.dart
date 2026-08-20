import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nostr_core_enhanced/pomegranate/pomegranate_helpers.dart';

void main() {
  // Real /account shape: operators are objects, not strings. `cast<String>()`
  // accepted this silently and only threw later inside jsonEncode when the
  // setup was persisted, crashing login far from the actual cause.
  const accountJson = '''
  {
    "operators": [
      {"url": "https://po.yakihonne.com", "pubshard": "0100"},
      {"url": "https://po.jumble.social", "pubshard": "0200"},
      {"url": "https://po.njump.me", "pubshard": "0300"},
      {"url": "https://po.f7z.io", "pubshard": "0400"}
    ],
    "threshold": 3,
    "pubkey": "0e36a6056eed5df58c5b16d0d6936889ae6fc7e066493e3bb6f52dd5dc7dd440",
    "email": "someone@example.com"
  }''';

  test('pomSetupFromAccount reads object-shaped operators', () {
    final account = jsonDecode(accountJson) as Map<String, dynamic>;
    final setup = pomSetupFromAccount('https://auth.njump.me', account)!;

    expect(setup.threshold, 3);
    expect(setup.operators, [
      'https://po.yakihonne.com',
      'https://po.jumble.social',
      'https://po.njump.me',
      'https://po.f7z.io',
    ]);
  });

  test('the parsed setup survives jsonEncode', () {
    final account = jsonDecode(accountJson) as Map<String, dynamic>;
    final setup = pomSetupFromAccount('https://auth.njump.me', account)!;

    // This is the call that used to throw during _persistKey.
    final encoded = jsonEncode(setup.toJson());
    final back = PomSetup.fromJson(
      jsonDecode(encoded) as Map<String, dynamic>,
    );

    expect(back.operators, setup.operators);
    expect(back.threshold, 3);
  });

  test('kind 16440 string operators still parse', () {
    expect(
      pomOperatorList(['https://po.a.com', 'https://po.b.com']),
      ['https://po.a.com', 'https://po.b.com'],
    );
  });
}
