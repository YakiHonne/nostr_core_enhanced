import 'dart:async';

import 'package:nostr_core_enhanced/db/nostr_cache_manager.dart';
import 'package:nostr_core_enhanced/nostr/nostr.dart';

class DbWrapper {
  final currentEvents = <String, Event>{};
  final NostrDB db;
  final Duration flushDelay;
  final int maxEvents;
  Timer? _flushTimer;
  DateTime lastFlush = DateTime.fromMillisecondsSinceEpoch(0);

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
      return;
    }

    // Otherwise, debounce flush
    _flushTimer?.cancel();
    _flushTimer = Timer(flushDelay, _doFlush);
  }

  Future<void> _doFlush() async {
    _flushTimer?.cancel();
    _flushTimer = null;
    await flushEventsSeenRelays();
    currentEvents.clear();
  }

  Future<void> flushEventsSeenRelays() async {
    if (currentEvents.isEmpty) return;

    db.flushEventsSeenRelays(this);
    currentEvents.clear();
  }

  Future<List<Event>> loadEvents({
    required List<Filter> filters,
    required List<String> relays,
    required NostrDB db,
  }) async {
    final events = <Event>[];

    for (final filter in filters) {
      final evs = await db.loadEvents(
        f: filter,
        relays: relays,
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
