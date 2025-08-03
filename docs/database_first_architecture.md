# Database-First Architecture for Nostr Core Enhanced

## Overview

This document outlines the database-first architecture design for migrating from Isar to Drift and implementing a performance-optimized core that prioritizes local database queries over network fetches.

## Current State vs Target State

### Current State (Isar-based)
- **Network-First**: Core frequently fetches from relays even when data exists locally
- **Query Issues**: Isar has bugs that return incorrect data in some scenarios
- **Performance Impact**: Unnecessary network requests slow down the application
- **Cache Inconsistency**: Data freshness not properly managed

### Target State (Drift-based, Database-First)
- **Database-First**: Always query local database first
- **Smart Fetching**: Only fetch from network when data is missing or stale
- **Reliable Queries**: Drift provides more reliable SQL-based queries
- **Performance Optimized**: Reduced network requests, faster response times

## Database-First Core Logic Flow

### 1. Data Request Flow
```
User Request → Core Logic → Database Query → Data Available?
                                              ↓
                                         Yes → Return Data
                                              ↓
                                         No → Check Staleness
                                              ↓
                                         Fresh → Return Data
                                              ↓
                                         Stale → Fetch from Network
                                              ↓
                                         Update Database → Return Data
```

### 2. Core Components Architecture

#### A. Database Layer (Drift)
```
NostrDatabase (Drift)
├── Events Table (primary content)
├── Metadata Table (user profiles)
├── ContactLists Table (social graph)
├── UserRelayLists Table (relay preferences)
├── RelaySets Table (relay configurations)
├── EventStats Table (engagement metrics)
├── MuteLists Table (blocked content)
├── WotScores Table (web of trust)
└── Cache Management Tables
```

#### B. Cache Manager Layer
```
DriftCacheManager
├── CRUD Operations for all entities
├── Batch Operations for performance
├── Staleness Detection
├── Cache Invalidation
└── Query Optimization
```

#### C. Core Repository Layer
```
NostrCoreRepository
├── Database-First Query Logic
├── Network Fallback Logic
├── Data Freshness Management
├── Subscription Management
└── Event Processing Pipeline
```

## Implementation Strategy

### Phase 1: Database Migration
1. **Create Drift Schema**: Define all tables with proper indexes
2. **Implement Cache Manager**: Full CRUD operations with Drift
3. **Data Migration**: Convert existing Isar data to Drift format
4. **Testing**: Ensure data integrity and query performance

### Phase 2: Database-First Logic
1. **Modify Core Repository**: Implement database-first query patterns
2. **Staleness Detection**: Add timestamp-based freshness checks
3. **Smart Fetching**: Only fetch when data is missing or stale
4. **Cache Warming**: Proactive background updates for critical data

### Phase 3: Performance Optimization
1. **Query Optimization**: Add strategic indexes and query tuning
2. **Batch Operations**: Group related database operations
3. **Background Sync**: Intelligent background data updates
4. **Memory Management**: Efficient data loading and caching

## Database-First Query Patterns

### 1. Event Queries
```dart
// Database-first event loading
Future<Event?> loadEvent(String eventId) async {
  // 1. Check local database first
  final cachedEvent = await cacheManager.loadEvent(eventId);
  
  if (cachedEvent != null) {
    // 2. Check if data is fresh enough
    if (isDataFresh(cachedEvent.lastUpdated)) {
      return cachedEvent;
    }
  }
  
  // 3. Fetch from network only if needed
  final networkEvent = await fetchEventFromRelays(eventId);
  
  // 4. Update cache with fresh data
  if (networkEvent != null) {
    await cacheManager.saveEvent(networkEvent);
    return networkEvent;
  }
  
  // 5. Return cached data even if stale (better than nothing)
  return cachedEvent;
}
```

### 2. Metadata Queries
```dart
// Database-first metadata loading
Future<Metadata?> loadMetadata(String pubkey) async {
  // 1. Always check database first
  final cachedMetadata = await cacheManager.loadMetadata(pubkey);
  
  if (cachedMetadata != null) {
    // 2. Check staleness (metadata changes less frequently)
    if (isMetadataFresh(cachedMetadata.refreshedTimestamp)) {
      return cachedMetadata;
    }
  }
  
  // 3. Background refresh if stale but return cached immediately
  if (cachedMetadata != null) {
    // Return cached data immediately
    _backgroundRefreshMetadata(pubkey);
    return cachedMetadata;
  }
  
  // 4. Only block for network if no cached data exists
  return await fetchMetadataFromRelays(pubkey);
}
```

### 3. Social Graph Queries
```dart
// Database-first contact list loading
Future<ContactList?> loadContactList(String pubkey) async {
  final cached = await cacheManager.loadContactList(pubkey);
  
  // Social graph data is relatively stable
  if (cached != null && isContactListFresh(cached.loadedTimestamp)) {
    return cached;
  }
  
  // Fetch and update if stale or missing
  final fresh = await fetchContactListFromRelays(pubkey);
  if (fresh != null) {
    await cacheManager.saveContactList(fresh);
  }
  
  return fresh ?? cached;
}
```

## Data Freshness Strategy

### Freshness Thresholds
```dart
class DataFreshnessConfig {
  static const Duration eventFreshness = Duration(minutes: 5);
  static const Duration metadataFreshness = Duration(hours: 1);
  static const Duration contactListFreshness = Duration(hours: 6);
  static const Duration relayListFreshness = Duration(hours: 12);
  static const Duration wotScoreFreshness = Duration(days: 1);
}
```

### Staleness Detection
```dart
bool isDataFresh(int? lastUpdated, Duration threshold) {
  if (lastUpdated == null) return false;
  
  final now = DateTime.now().millisecondsSinceEpoch;
  final age = Duration(milliseconds: now - lastUpdated);
  
  return age < threshold;
}
```

## Performance Benefits

### 1. Reduced Network Requests
- **Before**: Every request potentially hits the network
- **After**: Network requests only when data is missing or stale
- **Impact**: 70-90% reduction in network requests

### 2. Faster Response Times
- **Before**: Wait for network response every time
- **After**: Immediate response from local database
- **Impact**: Sub-millisecond response times for cached data

### 3. Better Offline Experience
- **Before**: Limited functionality without network
- **After**: Full functionality with cached data
- **Impact**: Seamless offline experience

### 4. Reduced Bandwidth Usage
- **Before**: Redundant data fetching
- **After**: Smart, minimal data fetching
- **Impact**: Significant bandwidth savings

## Migration Checklist

### Database Setup
- [ ] Create Drift database schema
- [ ] Implement all table definitions
- [ ] Add proper indexes for query performance
- [ ] Set up database migrations

### Cache Manager
- [ ] Implement all CRUD operations
- [ ] Add batch operation support
- [ ] Implement staleness detection
- [ ] Add query optimization

### Core Logic Updates
- [ ] Modify event loading to be database-first
- [ ] Update metadata queries
- [ ] Implement smart contact list loading
- [ ] Add background refresh mechanisms

### Testing & Validation
- [ ] Unit tests for all database operations
- [ ] Integration tests for database-first flows
- [ ] Performance benchmarks
- [ ] Data migration validation

## Monitoring & Metrics

### Key Performance Indicators
1. **Cache Hit Rate**: Percentage of requests served from cache
2. **Network Request Reduction**: Comparison with previous architecture
3. **Response Time**: Average time to serve data requests
4. **Data Freshness**: How often stale data is served
5. **Background Sync Efficiency**: Success rate of background updates

### Implementation Timeline
- **Week 1-2**: Database schema and basic CRUD operations
- **Week 3-4**: Database-first core logic implementation
- **Week 5-6**: Performance optimization and testing
- **Week 7**: Migration and deployment

This database-first architecture will significantly improve the performance and reliability of your Nostr Core Enhanced package while providing a better user experience through faster response times and reduced network dependency.
