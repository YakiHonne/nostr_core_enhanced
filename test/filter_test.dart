import 'package:flutter_test/flutter_test.dart';
import 'package:nostr_core_enhanced/nostr/nostr.dart';

void main() {
  test('copyWithSince overrides since without mutating the original', () {
    final f = Filter(
      kinds: [1],
      authors: ['abc'],
      t: ['tag'],
      search: 'query',
      since: 100,
      until: 900,
      limit: 50,
    );

    final copy = f.copyWithSince(500);

    expect(copy.since, 500);
    expect(f.since, 100);
    expect(copy.kinds, [1]);
    expect(copy.authors, ['abc']);
    expect(copy.t, ['tag']);
    expect(copy.search, 'query');
    expect(copy.until, 900);
    expect(copy.limit, 50);
  });

  test('fromJson leaves search null when absent (not the string "null")', () {
    expect(Filter.fromJson({'kinds': [1]}).search, isNull);
    expect(Filter.fromJson({'search': 'x'}).search, 'x');
    expect(Filter.fromJson({'#search': 'y'}).search, 'y');
  });
}
