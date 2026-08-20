import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nostr_core_enhanced/db/db_wrapper.dart';
import 'package:nostr_core_enhanced/db/drift_database.dart';
import 'package:nostr_core_enhanced/db/nostr_cache_manager.dart';
import 'package:nostr_core_enhanced/nostr/nostr.dart';

Event event(int i) => Event.fromJson({
      'id': 'id$i',
      'pubkey': 'a' * 64,
      'created_at': 1700000000 + i,
      'kind': 1,
      'tags': <List<String>>[],
      'content': 'hello $i',
      'sig': 'c' * 128,
    });

void main() {
  test('concurrent flushes are single-flight and never lose events', () async {
    final database = NostrDatabase.forTesting(NativeDatabase.memory());
    final db = NostrDB()..setDatabaseForTesting(database);
    final wrapper = DbWrapper(db, maxEvents: 10);

    // Blow past the threshold: every markEvent >= 10 kicks a flush, exactly
    // the storm that used to snapshot the whole buffer per call.
    for (var i = 0; i < 50; i++) {
      wrapper.markEvent(event(i), 'wss://r');
    }
    // Pile on explicit concurrent callers (periodic timer / query-finish).
    await Future.wait([
      db.flushEventsSeenRelays(wrapper),
      db.flushEventsSeenRelays(wrapper),
      db.flushEventsSeenRelays(wrapper),
    ]);
    // Guarded calls no-op while a write is in flight; keep flushing until
    // the buffer drains (in the app the re-armed debounce timer does this).
    await Future.doWhile(() async {
      await db.flushEventsSeenRelays(wrapper);
      await Future.delayed(const Duration(milliseconds: 20));
      return wrapper.currentEvents.isNotEmpty;
    }).timeout(const Duration(seconds: 10));

    expect(wrapper.currentEvents, isEmpty);
    final rows = await database.select(database.eventTable).get();
    expect(rows.length, 50);

    wrapper.dispose();
    await database.close();
  });
}
