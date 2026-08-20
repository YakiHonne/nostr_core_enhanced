import 'dart:async';

import 'package:nostr_core_enhanced/db/nostr_cache_manager.dart';
import 'package:nostr_core_enhanced/nostr/nostr.dart';

class DbWrapper {
  final currentEvents = <String, Event>{};
  final NostrDB db;
  final Duration flushDelay;
  final int maxEvents;
  Timer? _flushTimer;

  /// True while NostrDB is flushing this wrapper's buffer; concurrent flush
  /// calls no-op instead of each snapshotting the whole buffer.
  bool flushing = false;

  DbWrapper(
    this.db, {
    this.flushDelay = const Duration(seconds: 2),
    this.maxEvents = 300,
  });

  void markEvent(Event event, String relay) {
    final e = currentEvents.putIfAbsent(event.id, () => event);
    e.addSeenOnRelay(relay);

    // If we hit the max events threshold, flush immediately
    if (currentEvents.length >= maxEvents) {
      _doFlush();
    }

    // Always (re)arm the debounce: events buffered while a flush is in
    // flight (its single-flight guard no-ops the call above) still get
    // flushed shortly after.
    _flushTimer?.cancel();
    _flushTimer = Timer(flushDelay, _doFlush);
  }

  /// Cancels the debounce timer. Buffered events stay in [currentEvents];
  /// the owner flushes them once more before dropping the wrapper.
  void dispose() {
    _flushTimer?.cancel();
    _flushTimer = null;
  }

  Future<void> _doFlush() async {
    _flushTimer?.cancel();
    _flushTimer = null;
    await flushEventsSeenRelays();
  }

  // The db side snapshots the buffer and removes only what it wrote —
  // clearing here raced the (previously un-awaited) write and dropped
  // events that were never persisted.
  Future<void> flushEventsSeenRelays() => db.flushEventsSeenRelays(this);

  Future<List<Event>> loadEvents({
    required List<Filter> filters,
    required List<String> relays,
    required NostrDB db,
    bool includeExpired = true,
  }) async {
    final events = <Event>[];

    for (final filter in filters) {
      final evs = await db.loadEvents(
        f: filter,
        relays: relays,
        includeExpired: includeExpired,
      );

      events.addAll(evs);
    }

    if (relays.isNotEmpty) {
      events.removeWhere(
        (element) => !element.seenOn.any(
          (element) => relays.contains(element),
        ),
      );
    }

    return events.toList();
  }
}
