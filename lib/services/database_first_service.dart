// import 'package:nostr_core_enhanced/db/drift_cache_manager.dart';
// import 'package:nostr_core_enhanced/db/drift_cache_manager_fixed.dart';
// import 'package:nostr_core_enhanced/models/contact_list.dart';
// import 'package:nostr_core_enhanced/models/metadata.dart';
// import 'package:nostr_core_enhanced/models/user_relay_list.dart';
// import 'package:nostr_core_enhanced/nostr/event.dart';

// /// Service layer that implements database-first architecture
// /// Always queries local database first, only fetches from network when needed
// class DatabaseFirstService {
//   final DriftCacheManager _cacheManager;

//   // Data freshness thresholds
//   static const Duration eventFreshness = Duration(minutes: 5);
//   static const Duration metadataFreshness = Duration(hours: 1);
//   static const Duration contactListFreshness = Duration(hours: 6);
//   static const Duration relayListFreshness = Duration(hours: 12);

//   DatabaseFirstService(this._cacheManager);

//   /// Database-first event loading
//   Future<Event?> loadEvent(String eventId) async {
//     // 1. Check local database first
//     final cachedEvent = await _cacheManager.loadEventAsync(eventId);

//     if (cachedEvent != null) {
//       // 2. Check if data is fresh enough
//       if (_isDataFresh(cachedEvent.lastUpdated, eventFreshness)) {
//         return cachedEvent;
//       }
//     }

//     // 3. Fetch from network only if needed
//     final networkEvent = await _fetchEventFromRelays(eventId);

//     // 4. Update cache with fresh data
//     if (networkEvent != null) {
//       await _cacheManager.saveEvent(networkEvent);
//       return networkEvent;
//     }

//     // 5. Return cached data even if stale (better than nothing)
//     return cachedEvent;
//   }

//   /// Database-first metadata loading with background refresh
//   Future<Metadata?> loadMetadata(String pubkey) async {
//     // 1. Always check database first
//     final cachedMetadata = await _cacheManager.loadMetadataAsync(pubkey);

//     if (cachedMetadata != null) {
//       // 2. Check staleness (metadata changes less frequently)
//       if (_isDataFresh(cachedMetadata.refreshedTimestamp, metadataFreshness)) {
//         return cachedMetadata;
//       }
//     }

//     // 3. Background refresh if stale but return cached immediately
//     if (cachedMetadata != null) {
//       // Return cached data immediately
//       _backgroundRefreshMetadata(pubkey);
//       return cachedMetadata;
//     }

//     // 4. Only block for network if no cached data exists
//     return await _fetchMetadataFromRelays(pubkey);
//   }

//   /// Database-first contact list loading
//   Future<ContactList?> loadContactList(String pubkey) async {
//     final cached = await _cacheManager.loadContactListAsync(pubkey);

//     // Social graph data is relatively stable
//     if (cached != null &&
//         _isDataFresh(cached.loadedTimestamp, contactListFreshness)) {
//       return cached;
//     }

//     // Fetch and update if stale or missing
//     final fresh = await _fetchContactListFromRelays(pubkey);
//     if (fresh != null) {
//       await _cacheManager.saveContactList(fresh);
//     }

//     return fresh ?? cached;
//   }

//   /// Database-first user relay list loading
//   Future<UserRelayList?> loadUserRelayList(String pubkey) async {
//     final cached = await _cacheManager.loadUserRelayListAsync(pubkey);

//     // Relay preferences are very stable
//     if (cached != null &&
//         _isDataFresh(cached.loadedTimestamp, relayListFreshness)) {
//       return cached;
//     }

//     // Fetch and update if stale or missing
//     final fresh = await _fetchUserRelayListFromRelays(pubkey);
//     if (fresh != null) {
//       await _cacheManager.saveUserRelayList(fresh);
//     }

//     return fresh ?? cached;
//   }

//   /// Batch loading with database-first approach
//   Future<List<Metadata>> loadMetadataBatch(List<String> pubkeys) async {
//     final results = <Metadata>[];
//     final missingPubkeys = <String>[];

//     // 1. Check database for all requested pubkeys
//     for (final pubkey in pubkeys) {
//       final cached = await _cacheManager.loadMetadataAsync(pubkey);
//       if (cached != null &&
//           _isDataFresh(cached.refreshedTimestamp, metadataFreshness)) {
//         results.add(cached);
//       } else {
//         missingPubkeys.add(pubkey);
//       }
//     }

//     // 2. Fetch missing/stale data from network in batch
//     if (missingPubkeys.isNotEmpty) {
//       final networkResults =
//           await _fetchMetadataBatchFromRelays(missingPubkeys);

//       // 3. Update cache and add to results
//       for (final metadata in networkResults) {
//         await _cacheManager.saveMetadata(metadata);
//         results.add(metadata);
//       }
//     }

//     return results;
//   }

//   /// Smart cache warming - proactively update data in background
//   Future<void> warmCache({
//     List<String>? importantPubkeys,
//     List<String>? recentEventIds,
//   }) async {
//     // Warm metadata cache for important users
//     if (importantPubkeys != null) {
//       for (final pubkey in importantPubkeys) {
//         final cached = await _cacheManager.loadMetadataAsync(pubkey);
//         if (cached == null ||
//             !_isDataFresh(cached.refreshedTimestamp, metadataFreshness)) {
//           _backgroundRefreshMetadata(pubkey);
//         }
//       }
//     }

//     // Warm event cache for recent events
//     if (recentEventIds != null) {
//       for (final eventId in recentEventIds) {
//         final cached = await _cacheManager.loadEventAsync(eventId);
//         if (cached == null ||
//             !_isDataFresh(cached.lastUpdated, eventFreshness)) {
//           _backgroundRefreshEvent(eventId);
//         }
//       }
//     }
//   }

//   /// Check if data is fresh based on timestamp and threshold
//   bool _isDataFresh(int? lastUpdated, Duration threshold) {
//     if (lastUpdated == null) return false;

//     final now = DateTime.now().millisecondsSinceEpoch;
//     final age = Duration(milliseconds: now - lastUpdated);

//     return age < threshold;
//   }

//   /// Background refresh methods (non-blocking)
//   void _backgroundRefreshMetadata(String pubkey) {
//     // Run in background without blocking
//     Future.microtask(() async {
//       try {
//         final fresh = await _fetchMetadataFromRelays(pubkey);
//         if (fresh != null) {
//           await _cacheManager.saveMetadata(fresh);
//         }
//       } catch (e) {
//         // Log error but don't throw
//         print('Background metadata refresh failed for $pubkey: $e');
//       }
//     });
//   }

//   void _backgroundRefreshEvent(String eventId) {
//     Future.microtask(() async {
//       try {
//         final fresh = await _fetchEventFromRelays(eventId);
//         if (fresh != null) {
//           await _cacheManager.saveEvent(fresh);
//         }
//       } catch (e) {
//         print('Background event refresh failed for $eventId: $e');
//       }
//     });
//   }

//   // Network fetch methods (these would integrate with your existing relay logic)
//   Future<Event?> _fetchEventFromRelays(String eventId) async {
//     // TODO: Implement actual relay fetching logic
//     // This would use your existing NostrCoreRepository or relay manager
//     return null;
//   }

//   Future<Metadata?> _fetchMetadataFromRelays(String pubkey) async {
//     // TODO: Implement actual relay fetching logic
//     return null;
//   }

//   Future<ContactList?> _fetchContactListFromRelays(String pubkey) async {
//     // TODO: Implement actual relay fetching logic
//     return null;
//   }

//   Future<UserRelayList?> _fetchUserRelayListFromRelays(String pubkey) async {
//     // TODO: Implement actual relay fetching logic
//     return null;
//   }

//   Future<List<Metadata>> _fetchMetadataBatchFromRelays(
//       List<String> pubkeys) async {
//     // TODO: Implement batch fetching from relays
//     return [];
//   }

//   /// Performance metrics
//   Map<String, dynamic> getPerformanceMetrics() {
//     return {
//       'cache_hit_rate': 0.0, // TODO: Implement metrics tracking
//       'average_response_time': 0.0,
//       'background_refresh_count': 0,
//       'network_request_count': 0,
//     };
//   }
// }

// /// Extension methods for easy integration
// extension DatabaseFirstExtensions on DatabaseFirstService {
//   /// Quick check if data exists in cache (synchronous)
//   Future<bool> hasEvent(String eventId) async {
//     final event = await _cacheManager.loadEventAsync(eventId);
//     return event != null;
//   }

//   Future<bool> hasMetadata(String pubkey) async {
//     final metadata = await _cacheManager.loadMetadataAsync(pubkey);
//     return metadata != null;
//   }

//   /// Preload data for better UX
//   Future<void> preloadUserData(String pubkey) async {
//     await Future.wait([
//       loadMetadata(pubkey),
//       loadContactList(pubkey),
//       loadUserRelayList(pubkey),
//     ]);
//   }
// }
