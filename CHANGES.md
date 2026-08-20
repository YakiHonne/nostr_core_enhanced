# Optimization pass — 2026-07-07

Changes to `nostr_core_enhanced`, uncommitted working tree. Motivation: real
ANRs in production on Flutter 3.41+ (merged UI/platform threads on Android)
caused by relay message parsing on the main isolate, plus a set of
correctness and hygiene fixes found along the way.

No public API signatures were changed or removed (one additive method:
`Filter.copyWithSince`). All mobile-app call sites were checked before
touching anything shared.

---

## 1. Relay message parsing moved off the UI isolate

**New file: `lib/core/relay_event_parser.dart`**

- `RelayEventParser`: a single long-lived background isolate, lazily spawned
  on the first EVENT frame, app-lifetime (matches `NostrCore`, which has no
  dispose). (Fixed post-review: the spawn guard originally released before
  the handshake completed, so flushes landing in that window spawned extra
  isolates; the guard now holds until the isolate's SendPort arrives.)
- **The isolate and its queues are static (shared across all
  `RelayEventParser` — and therefore all `NostrCore` — instances).** The app
  creates multiple `NostrCore`s (`nc` at startup, plus a fresh `wnc` inside
  every `WalletsManagerCubit`), and per-instance isolates accumulated with
  no dispose path. One shared isolate now serves them all; each frame
  carries its owner so callbacks still route to the right instance.
- EVENT frames are detected in `_handleMessage` with a cheap anchored regex
  (`^\s*\[\s*"EVENT"`) and **batched** across the isolate boundary — flush at
  100 frames or 8 ms, whichever comes first. Per-message round-trips would
  have erased the win.
- The isolate runs the same `Message.deserialize` → `Event` construction
  (including `setTags`); fully built `Event` objects cross back via the VM
  object copy. No re-parsing on the main isolate.
- **AUTH / OK / EOSE / NOTICE stay inline** on the main isolate — small
  payloads, latency-sensitive (AUTH especially). That path is unchanged.
- Ordering: one FIFO isolate, sequence-numbered batches, replies dispatched
  against the in-flight queue head — callbacks fire on the main isolate in
  arrival order per subscription.
- Never drops messages: unanswered batches are re-sent if the isolate dies
  (respawn on the onExit sentinel; stale-sequence replies ignored so nothing
  double-fires). If `Isolate.spawn` itself fails, frames are parsed
  synchronously on the main isolate as a fallback.
- Unparsable frames come back as null markers and get the same
  `printLog('Received message not supported…')` as before.

**Test:** `test/relay_event_parser_test.dart` — 150 frames + 1 garbage frame
through the real isolate: order preserved, relay pairing preserved,
tags/subscriptionId intact, garbage logged not dropped.

## 2. Publish futures complete directly (no polling)

`publish()` and `sendEventAsync()` previously polled a boolean with
`Timer.periodic(500ms)`. They now complete their `Completer` directly from
the OK callback, with `.timeout(...)` for the failure case. Up to 500 ms of
artificial latency per publish removed. `sendEventAsync`'s `timeout`
parameter keeps its old meaning (number of 500 ms ticks) so caller behavior
is identical.

## 3. `Message.deserialize` assert → real check

`assert(messages.contains(data[0]))` is stripped in release builds, letting
unsupported payloads fall through unchecked. Both `Message.deserialize` and
`RemoteCacheMessage.deserialize` now throw `ArgumentError` on
malformed/unsupported payloads; `_handleMessage`'s existing catch logs them.

## 4. Logging / leak hygiene

- Removed the raw `print(message)` in the AUTH branch of `_handleMessage`.
- Routed the two remaining bare production `print()` calls (relay-list
  loading progress) through `printLog` (kDebugMode-gated).
- `closeConnect` now removes the relay's `connectStatus` entry (it already
  removed `webSockets` and `attempts`; `connectStatus` leaked forever).
- Deleted `test/widget_test.dart` — a broken counter-app template that
  failed any bare `flutter test` run.

## 5. Relay reconnect fixes

- **`attempts` resets on successful connect.** It previously counted every
  connect (including successes) and never reset, so a relay that reconnected
  successfully a few times over a long session permanently fell out of
  `relaysAutoReconnect`'s `attempts <= 3` check.
- **Exponential reconnect backoff** in `_onDisconnected`: 1 s → 2 s → 4 s …
  capped at 32 s, driven by the consecutive-failure count. Was a flat 1 s
  retry loop.
- **`_authenticateRelay` completes on every path.** The old version left a
  dangling completer when the signer failed to produce the AUTH event; also
  guards against double-complete.

## 5b. `NostrCore.dispose()` (additive API)

The app creates secondary `NostrCore` instances (the wallet cubit's `wnc`)
that previously leaked sockets and timers when discarded. New
`dispose()`: cancels the periodic + debounce flush timers, flushes buffered
events, closes all WebSockets (marked closed so `_onDisconnected` doesn't
reconnect them), clears request/send maps. The **database is not closed** —
it's shared across instances (`NostrCore(db: nc.db, ...)`). `connect()`
no-ops after dispose. `WalletsManagerCubit.close()` in the app now calls
`wnc.dispose()`.

## 6. `doQuery` / `doSubscribe` cache-vs-relay fixes

Shared new helper `_loadCacheAndBumpSince`:

- **Per-filter `since` bump.** The old code computed "newest cached event"
  across the concatenated results of *all* filters and applied it to *every*
  filter — a filter with a cold cache could have its `since` bumped past
  everything by another filter's warm cache, silently fetching nothing.
- **No caller mutation.** Filters sent to relays are copies (new
  `Filter.copyWithSince`); the caller's `Filter` objects are never touched.
  (Previously `filter.since` was overwritten in place.)
- **Inclusive bump** (`newest`, not `newest + 1`): an uncached event in the
  same second as the newest cached one is re-sent rather than lost.
  Duplicates are already the norm (every relay re-sends the same event).
- **Gap guard:** the bump only happens when the cache returned at least the
  filter's `limit` rows. A partial hit means holes below the newest cached
  event, so those filters fall back to a full relay query. No-limit filters
  keep the always-bump behavior (no completeness signal).
- Per-filter cache loads run in parallel (`Future.wait`).

Also in `doQuery`:

- **Dead-relay timeout fixed.** The initial timer was a no-op placeholder;
  a query whose relays never sent EOSE waited for the `timeOut + 10`
  fallback (15 s by default). The initial timer now completes the query
  after `timeOut`; the first EOSE swaps it for the rolling per-EOSE timer,
  so healthy queries are unchanged. The `+10` fallback remains as a safety
  net.
- The four duplicated completion blocks collapsed into one `finish()`
  closure. It preserves the old asymmetry where only timeout paths close
  ad-hoc-connected relays.

**Bonus fix:** `Filter.fromJson` read `json['#search']` (while `toJson`
writes `'search'`) and `.toString()`'d it — deserialized filters without a
search term got the literal string `"null"`. Now accepts both keys and stays
null when absent.

**Test:** `test/filter_test.dart` — `copyWithSince` field preservation +
non-mutation, and the `search`/null regression.

## 7. Database flush pipeline (event loss fix)

Two compounding bugs dropped events from the cache under load:

- `DbWrapper.flushEventsSeenRelays` called the DB write **without awaiting**
  and immediately cleared the live buffer the write was reading from.
- `NostrDB.flushEventsSeenRelays` had a 2-second throttle that **returned
  without writing** — while the wrapper cleared the buffer anyway. During
  feed loads (300-event flush threshold firing faster than every 2 s),
  entire batches were discarded.

Now: the DB side snapshots ids + companions synchronously, awaits the batch
write, and removes **only the written entries** afterward. The throttle and
the wrapper-side clears are gone; the dead `lastFlush` field went with them.
Events marked mid-write stay buffered for the next flush. Flush callers are
self-limiting (no-op on empty buffer).

Known edge (deliberate): an event whose `seenOn` gains a relay mid-write may
persist without that one entry — advisory data, not worth copy-on-write
snapshots.

Also: `NostrDB.init({String? directory})` → `init()` — the parameter was
ignored and the only call site passes nothing.

**Follow-up fix (flush stampede → OOM):** the snapshot-don't-clear flow made
`markEvent` start a *new* full flush on every event past the 300 threshold
(the buffer isn't trimmed until the write completes), and the periodic/
query-finish callers stacked on top — dozens of concurrent flushes each
jsonEncoding the whole buffer exhausted the heap under feed load. Flushes
are now single-flight per wrapper (`DbWrapper.flushing` guard; concurrent
calls no-op), and `markEvent` always re-arms the debounce timer so events
buffered during an in-flight write drain right after it.

**Test:** `test/db_flush_test.dart` — 50 events through a 10-threshold
wrapper + concurrent explicit flushes against an in-memory drift DB: buffer
drains, all 50 rows persisted, nothing double-written. (Added
`NostrDatabase.forTesting` and `NostrDB.setDatabaseForTesting` hooks,
both `@visibleForTesting`.)

## 8. Cache retention sweep (30 days)

New `NostrDB.sweepOldEvents({maxAge = 30 days, exemptPubkey})` — one indexed
DELETE removing events older than the window. Exempt:

- **DM kinds** — 4 (legacy NIP-04), 13 (seal), 14 (private DM), 1059 (gift
  wrap). The cache is the only reliable DM store, and gift-wrap timestamps
  are deliberately randomized (NIP-59), so age logic would act on falsified
  data.
- **The user's own events** — matched by pubkey, plus any row with a
  non-empty `currentUser` as a second net.

Triggered once per session from `NostrCore.setSigner` (earliest point the
pubkey exists for the exemption; runs after `db.init()` in the app's
initializer order). Fire-and-forget, swallows its own errors — a failed
sweep retries next session. No VACUUM (pages get reused; revisit if
Crashlytics size telemetry says otherwise).

Known edge: multi-account users sweeping under account A's pubkey can evict
account B's >30-day-old own events from cache (they remain on relays).

## 9. Replaceable-event dedup (NIP-01 semantics)

Upserts key on event `id`, but replaceable kinds get a new id per update, so
superseded versions accumulated and were all served from cache. New
`_removeStaleReplaceableVersions`, called from the flush path: for each
replaceable event written (kinds 0, 3, 10000–19999 per `(pubkey, kind)`;
30000–39999 per `(pubkey, kind, dTag)`), one DELETE drops rows older than
the group's newest. Works in both directions — a stale version arriving
late is written and immediately removed. Groups deduplicated per batch.

Edge (deliberate): a parameterized event missing its `d` tag is skipped
rather than risking a cross-dTag delete.

---

## Not changed (deliberately)

- **Signature verification stays a no-op** — by design, for performance.
  Note: the parser isolate now makes re-enabling it nearly free if wanted.
- Relays exhausting reconnect attempts stay as null entries in `webSockets`
  (removing them would shrink `relays()`, which the app reads).
- EOSE/NOTICE decode→re-encode→decode round trip (~50-byte payloads).
- `EventsSource.cache` queries resolve with `''`, indistinguishable from the
  no-relays-connected path.

## Parked pending profiling

- Tag-table migration (tag filters are unindexable `LIKE` scans) — only if
  traces show it now that retention bounds table size.
- Drift row-mapping on the main isolate (~11 jsonDecodes per cached row) —
  only if cache loads still show jank after the parser isolate ships.

## Verification status

- `flutter analyze`: clean in both this package and mobile-app
  (pre-existing, unrelated infos/warnings only).
- `flutter test`: passing (5 tests).
- **Device smoke test still pending:** feed load, notifications, DM decrypt,
  publish, relay AUTH, cold-restart cache render, profile shows latest
  version, DB size stabilizes over days.

## Files touched

| File | Change |
|------|--------|
| `lib/core/relay_event_parser.dart` | **new** — parser isolate |
| `lib/core/nostr_core_repository.dart` | message routing, publish futures, reconnect, doQuery/doSubscribe, sweep trigger |
| `lib/nostr/message.dart` | assert → throw |
| `lib/nostr/filter.dart` | `copyWithSince`, `search` parse fix |
| `lib/db/db_wrapper.dart` | flush race fix, `dispose()` |
| `lib/db/nostr_cache_manager.dart` | flush fix, retention sweep, replaceable dedup, `init()` param |
| `test/relay_event_parser_test.dart` | **new** |
| `test/filter_test.dart` | **new** |
