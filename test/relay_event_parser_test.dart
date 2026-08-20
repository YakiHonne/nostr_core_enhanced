import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nostr_core_enhanced/core/relay_event_parser.dart';
import 'package:nostr_core_enhanced/nostr/nostr.dart';

String eventFrame(String id, {String sub = 'sub1'}) {
  return jsonEncode([
    'EVENT',
    sub,
    {
      'id': id,
      'pubkey': 'a' * 64,
      'created_at': 1700000000,
      'kind': 1,
      'tags': [
        ['p', 'b' * 64],
      ],
      'content': 'hello',
      'sig': 'c' * 128,
    },
  ]);
}

String eoseFrame(String sub) => jsonEncode(['EOSE', sub]);

void main() {
  test('parses batched EVENT frames off-isolate, in order, never dropping',
      () async {
    final received = <String>[];
    final unparsable = <String>[];

    final parser = RelayEventParser(
      onMessage: (m, raw, relay) =>
          received.add('${(m.message as Event).id}@$relay'),
      onUnparsable: (message, relay) => unparsable.add(message),
    );

    for (var i = 0; i < 150; i++) {
      parser.add(eventFrame('id$i'), 'wss://relay$i');
    }
    parser.add('not json at all', 'wss://relayX');

    await Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 50));
      return received.length + unparsable.length < 151;
    }).timeout(const Duration(seconds: 10));

    expect(received.length, 150);
    expect(unparsable, ['not json at all']);
    // Order and relay pairing preserved across the isolate boundary.
    expect(received.first, 'id0@wss://relay0');
    expect(received.last, 'id149@wss://relay149');
    // Events come back fully constructed (setTags ran in the isolate).
    final parsed = <Event>[];
    final p2 = RelayEventParser(
      onMessage: (m, raw, relay) => parsed.add(m.message as Event),
      onUnparsable: (_, __) {},
    );
    p2.add(eventFrame('idZ'), 'wss://r');
    await Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 50));
      return parsed.isEmpty;
    }).timeout(const Duration(seconds: 10));
    expect(parsed.single.pTags, ['b' * 64]);
    expect(parsed.single.subscriptionId, 'sub1');
  });

  test('multiple parser instances share one isolate, callbacks route per-owner',
      () async {
    final a = <String>[];
    final b = <String>[];
    final pa = RelayEventParser(
      onMessage: (m, raw, relay) => a.add((m.message as Event).id),
      onUnparsable: (_, __) {},
    );
    final pb = RelayEventParser(
      onMessage: (m, raw, relay) => b.add((m.message as Event).id),
      onUnparsable: (_, __) {},
    );

    // Interleaved adds land in the same shared batch.
    pa.add(eventFrame('a1'), 'wss://r');
    pb.add(eventFrame('b1'), 'wss://r');
    pa.add(eventFrame('a2'), 'wss://r');

    await Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 50));
      return a.length + b.length < 3;
    }).timeout(const Duration(seconds: 10));

    expect(a, ['a1', 'a2']);
    expect(b, ['b1']);
  });

  test('EVENT and its EOSE arrive in wire order, never reordered', () async {
    final order = <String>[];

    final parser = RelayEventParser(
      onMessage: (m, raw, relay) {
        if (m.type == 'EVENT') {
          order.add('EVENT:${(m.message as Event).id}');
        } else if (m.type == 'EOSE') {
          order.add('EOSE');
        }
      },
      onUnparsable: (_, __) {},
    );

    parser.add(eventFrame('e1'), 'wss://r');
    parser.add(eventFrame('e2'), 'wss://r');
    parser.add(eoseFrame('sub1'), 'wss://r');

    await Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 50));
      return order.length < 3;
    }).timeout(const Duration(seconds: 10));

    expect(order, ['EVENT:e1', 'EVENT:e2', 'EOSE']);
  });
}
