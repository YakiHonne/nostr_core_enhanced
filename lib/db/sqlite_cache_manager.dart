// import 'dart:async';
// import 'dart:convert';
// import 'package:nostr_core/db/db_user_app_settings.dart';
// import 'package:nostr_core/db/db_user_drafts.dart';
// import 'package:nostr_core/db/db_user_followers.dart';
// import 'package:nostr_core/models/dm_session_info.dart';
// import 'package:nostr_core/models/nip05.dart';
// import 'package:path/path.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:nostr_core/cache/cache_manager.dart';
// import 'package:nostr_core/models/contact_list.dart';
// import 'package:nostr_core/models/mute_list.dart';
// import 'package:nostr_core/models/relay_set.dart';
// import 'package:nostr_core/models/user_relay_list.dart';
// import 'package:nostr_core/models/event_stats.dart';
// import 'package:nostr_core/models/metadata.dart';
// import 'package:nostr_core/nostr/event.dart';

// import 'package:nostr_core/models/wot_models.dart';

// class SQLiteCacheManager implements CacheManager {
//   static const String _databaseName = 'nostr_cache.db';
//   static const int _databaseVersion = 1;
  
//   // Singleton instance
//   static final SQLiteCacheManager _instance = SQLiteCacheManager._internal();
//   factory SQLiteCacheManager() => _instance;
  
//   // Database and tables
//   static Database? _database;
//   final Map<String, String> _tables = {
//     'events': '''
//       CREATE TABLE events (
//         id TEXT PRIMARY KEY,
//         pubkey TEXT,
//         created_at INTEGER,
//         kind INTEGER,
//         content TEXT,
//         sig TEXT,
//         tags_json TEXT,
//         d_tag TEXT,
//         root TEXT,
//         reply TEXT,
//         k_tags_json TEXT,
//         e_tags_json TEXT,
//         p_tags_json TEXT,
//         created_at_index INTEGER
//       )
//     ''',
//     'metadatas': '''
//       CREATE TABLE metadatas (
//         pubkey TEXT PRIMARY KEY,
//         name TEXT,
//         display_name TEXT,
//         picture TEXT,
//         banner TEXT,
//         website TEXT,
//         about TEXT,
//         nip05 TEXT,
//         lud16 TEXT,
//         lud06 TEXT,
//         created_at INTEGER,
//         is_deleted INTEGER,
//         refreshed_timestamp INTEGER
//       )
//     ''',
//     'contact_lists': '''
//       CREATE TABLE contact_lists (
//         pubkey TEXT PRIMARY KEY,
//         contacts_json TEXT,
//         contact_relays_json TEXT,
//         petnames_json TEXT,
//         followed_tags_json TEXT,
//         followed_communities_json TEXT,
//         followed_events_json TEXT,
//         created_at INTEGER,
//         loaded_timestamp INTEGER,
//         sources_json TEXT
//       )
//     ''',
//     'mute_lists': '''
//       CREATE TABLE mute_lists (
//         pubkey TEXT PRIMARY KEY,
//         mutes_json TEXT,
//         created_at INTEGER
//       )
//     ''',
//     'relay_sets': '''
//       CREATE TABLE relay_sets (
//         name TEXT,
//         pubkey TEXT,
//         relays_json TEXT,
//         PRIMARY KEY (name, pubkey)
//       )
//     ''',
//     'user_relay_lists': '''
//       CREATE TABLE user_relay_lists (
//         pubkey TEXT PRIMARY KEY,
//         relays_json TEXT,
//         created_at INTEGER
//       )
//     ''',
//     'event_stats': '''
//       CREATE TABLE event_stats (
//         event_id TEXT PRIMARY KEY,
//         replies INTEGER,
//         reactions INTEGER,
//         reposts INTEGER,
//         zaps INTEGER,
//         zap_amount INTEGER,
//         score REAL,
//         updated_at INTEGER
//       )
//     '''
//   };

//   SQLiteCacheManager._internal();

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     // Initialize FFI if needed (for desktop)
//     sqfliteFfiInit();
    
//     final documentsDirectory = await getApplicationDocumentsDirectory();
//     final path = join(documentsDirectory.path, _databaseName);
    
//     return await databaseFactoryFfi.openDatabase(
//       path,
//       options: OpenDatabaseOptions(
//         version: _databaseVersion,
//         onCreate: _onCreate,
//         onUpgrade: _onUpgrade,
//       ),
//     );
//   }

//   Future<void> _onCreate(Database db, int version) async {
//     // Create all tables
//     for (final table in _tables.values) {
//       await db.execute(table);
//     }
    
//     // Create indexes
//     await db.execute('CREATE INDEX idx_events_pubkey ON events(pubkey)');
//     await db.execute('CREATE INDEX idx_events_kind ON events(kind)');
//     await db.execute('CREATE INDEX idx_events_created_at ON events(created_at)');
//     await db.execute('CREATE INDEX idx_events_d_tag ON events(d_tag)');
//     await db.execute('CREATE INDEX idx_events_root ON events(root)');
//     await db.execute('CREATE INDEX idx_events_reply ON events(reply)');
//   }

//   Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
//     // Handle database upgrades here when needed
//     if (oldVersion < 2) {
//       // Example of future upgrade
//       // await db.execute('ALTER TABLE events ADD COLUMN new_column TEXT');
//     }
//   }

//   @override
//   Future<void> clearCache() async {
//     final db = await database;
//     await db.transaction((txn) async {
//       for (final table in _tables.keys) {
//         await txn.delete(table);
//       }
//     });
//   }

//   // Helper methods for JSON serialization
//   String _listToJson(List<dynamic> list) => jsonEncode(list);
//   List<dynamic> _jsonToList(String json) => 
//       json.isNotEmpty ? List<dynamic>.from(jsonDecode(json)) : [];
      
//   // Helper method to create Event from database map
//   Event _eventFromMap(Map<String, dynamic> map) {
//     final tags = _jsonToList(map['tags_json'] as String? ?? '[]');
    
//     return Event(
//       id: map['id'] as String,
//       pubkey: map['pubkey'] as String,
//       createdAt: map['created_at'] as int,
//       kind: map['kind'] as int,
//       tags: List<List<dynamic>>.from(
//         tags.map((tag) => List<dynamic>.from(tag as List)),
//       ),
//       content: map['content'] as String? ?? '',
//       sig: map['sig'] as String? ?? '',
//     );
//   }

//   // Event methods
//   @override
//   Future<void> saveEvent(Event event) async {
//     final db = await database;
//     await db.insert(
//       'events',
//       {
//         'id': event.id,
//         'pubkey': event.pubkey,
//         'created_at': event.createdAt,
//         'kind': event.kind,
//         'content': event.content,
//         'sig': event.sig,
//         'tags_json': _listToJson(event.tags),
//         'd_tag': event.tags.firstWhere(
//           (tag) => tag.isNotEmpty && tag[0] == 'd',
//           orElse: () => [],
//         ).length > 1 ? event.tags.firstWhere((tag) => tag[0] == 'd')[1] : null,
//         'root': event.tags.firstWhere(
//           (tag) => tag.isNotEmpty && tag[0] == 'e' && tag.length > 3 && tag[3] == 'root',
//           orElse: () => [],
//         ).length > 1 ? event.tags.firstWhere((tag) => tag[0] == 'e' && tag[3] == 'root')[1] : null,
//         'reply': event.tags.firstWhere(
//           (tag) => tag.isNotEmpty && tag[0] == 'e' && tag.length > 3 && tag[3] == 'reply',
//           orElse: () => [],
//         ).length > 1 ? event.tags.firstWhere((tag) => tag[0] == 'e' && tag[3] == 'reply')[1] : null,
//         'k_tags_json': _listToJson(event.tags.where((tag) => tag.isNotEmpty && tag[0] == 'k').toList()),
//         'e_tags_json': _listToJson(event.tags.where((tag) => tag.isNotEmpty && tag[0] == 'e').toList()),
//         'p_tags_json': _listToJson(event.tags.where((tag) => tag.isNotEmpty && tag[0] == 'p').toList()),
//         'created_at_index': event.createdAt,
//       },
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   @override
//   Future<void> saveEvents(List<Event> events) async {
//     final batch = (await database).batch();
//     for (final event in events) {
//       batch.insert(
//         'events',
//         {
//           'id': event.id,
//           'pubkey': event.pubkey,
//           'created_at': event.createdAt,
//           'kind': event.kind,
//           'content': event.content,
//           'sig': event.sig,
//           'tags_json': _listToJson(event.tags),
//           // ... other fields
//         },
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     }
//     await batch.commit(noResult: true);
//   }

//   @override
//   Future<Event?> loadEventById(String id, bool r) async {
//     final db = await database;
//     List<Map<String, dynamic>> results;
    
//     if (r) {
//       // If r is true, search by d_tag (replaceable event)
//       results = await db.query(
//         'events',
//         where: 'd_tag = ?',
//         whereArgs: [id],
//         orderBy: 'created_at DESC',
//         limit: 1,
//       );
//     } else {
//       // Otherwise search by event id
//       results = await db.query(
//         'events',
//         where: 'id = ?',
//         whereArgs: [id],
//       );
//     }
    
//     if (results.isEmpty) return null;
    
//     return _eventFromMap(results.first);
//   }

//   @override
//   Future<Event?> loadEvent({String? e, String? pubkey, String? pTag, int? kind}) async {
//     final db = await database;
//     final where = <String>[];
//     final whereArgs = <dynamic>[];
    
//     if (e != null) {
//       where.add('id = ?');
//       whereArgs.add(e);
//     }
    
//     if (pubkey != null) {
//       where.add('pubkey = ?');
//       whereArgs.add(pubkey);
//     }
    
//     if (kind != null) {
//       where.add('kind = ?');
//       whereArgs.add(kind);
//     }
    
//     if (pTag != null) {
//       where.add('p_tags_json LIKE ?');
//       whereArgs.add('%$pTag%');
//     }
    
//     if (where.isEmpty) return null;
    
//     final results = await db.query(
//       'events',
//       where: where.join(' AND '),
//       whereArgs: whereArgs,
//       orderBy: 'created_at DESC',
//       limit: 1,
//     );
    
//     if (results.isEmpty) return null;
//     return _eventFromMap(results.first);
//   }

//   @override
//   Future<List<Event>> loadEvents({
//     List<String> pubKeys = const [],
//     List<String>? ids,
//     List<String>? eTags,
//     List<int>? kinds,
//     String? pTag,
//     String? currentUser,
//   }) async {
//     final db = await database;
//     final where = <String>[];
//     final whereArgs = <dynamic>[];
    
//     if (pubKeys.isNotEmpty) {
//       where.add('pubkey IN (${List.filled(pubKeys.length, '?').join(',')})');
//       whereArgs.addAll(pubKeys);
//     }
    
//     if (ids != null && ids.isNotEmpty) {
//       where.add('id IN (${List.filled(ids.length, '?').join(',')})');
//       whereArgs.addAll(ids);
//     }
    
//     if (eTags != null && eTags.isNotEmpty) {
//       final eTagConditions = eTags.map((_) => 'e_tags_json LIKE ?').toList();
//       where.add('(${eTagConditions.join(' OR ')})');
//       whereArgs.addAll(eTags.map((e) => '%$e%').toList());
//     }
    
//     if (kinds != null && kinds.isNotEmpty) {
//       where.add('kind IN (${List.filled(kinds.length, '?').join(',')})');
//       whereArgs.addAll(kinds);
//     }
    
//     if (pTag != null) {
//       where.add('p_tags_json LIKE ?');
//       whereArgs.add('%$pTag%');
//     }
    
//     final results = await db.query(
//       'events',
//       where: where.isNotEmpty ? where.join(' AND ') : null,
//       whereArgs: whereArgs.isNotEmpty ? whereArgs : null,
//       orderBy: 'created_at DESC',
//     );
    
//     return results.map((map) => _eventFromMap(map)).toList();
//   }

//   // Implement other required methods with appropriate SQL queries
//   // This is a partial implementation - you'll need to implement all methods from CacheManager
  
//   @override
//   Future<void> removeEvent(String id) async {
//     final db = await database;
//     await db.delete('events', where: 'id = ?', whereArgs: [id]);
//   }

//   @override
//   Future<void> removeAllEventsByPubKey(String pubKey) async {
//     final db = await database;
//     await db.delete('events', where: 'pubkey = ?', whereArgs: [pubKey]);
//   }

//   @override
//   Future<void> removeAllEvents() async {
//     final db = await database;
//     await db.delete('events');
//   }

//   @override
//   Future<void> removeAllEventsByKinds(List<int> kinds) async {
//     if (kinds.isEmpty) return;
//     final db = await database;
//     await db.delete(
//       'events',
//       where: 'kind IN (${List.filled(kinds.length, '?').join(',')})',
//       whereArgs: kinds,
//     );
//   }

//   // Metadata methods
//   @override
//   Future<void> saveMetadata(Metadata metadata) async {
//     final db = await database;
//     await db.insert(
//       'metadatas',
//       {
//         'pubkey': metadata.pubkey,
//         'name': metadata.name,
//         'display_name': metadata.displayName,
//         'picture': metadata.picture,
//         'banner': metadata.banner,
//         'website': metadata.website,
//         'about': metadata.about,
//         'nip05': metadata.nip05,
//         'lud16': metadata.lud16,
//         'lud06': metadata.lud06,
//         'created_at': metadata.createdAt,
//         'is_deleted': metadata.isDeleted ? 1 : 0,
//         'refreshed_timestamp': metadata.refreshedTimestamp,
//       },
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   @override
//   Future<void> saveMetadatas(List<Metadata> metadatas) async {
//     final batch = (await database).batch();
//     for (final metadata in metadatas) {
//       batch.insert(
//         'metadatas',
//         {
//           'pubkey': metadata.pubkey,
//           'name': metadata.name,
//           'display_name': metadata.displayName,
//           'picture': metadata.picture,
//           'banner': metadata.banner,
//           'website': metadata.website,
//           'about': metadata.about,
//           'nip05': metadata.nip05,
//           'lud16': metadata.lud16,
//           'lud06': metadata.lud06,
//           'created_at': metadata.createdAt,
//           'is_deleted': metadata.isDeleted ? 1 : 0,
//           'refreshed_timestamp': metadata.refreshedTimestamp,
//         },
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     }
//     await batch.commit(noResult: true);
//   }

//   @override
//   Metadata? loadMetadata(String pubKey) {
//     // This is a synchronous method in the interface, but we need async DB access
//     // We'll use a Completer to handle the async operation
//     final completer = Completer<Metadata?>();
//     database.then((db) async {
//       final results = await db.query(
//         'metadatas',
//         where: 'pubkey = ?',
//         whereArgs: [pubKey],
//       );
      
//       if (results.isEmpty) {
//         completer.complete(null);
//       } else {
//         completer.complete(_metadataFromMap(results.first));
//       }
//     }).catchError((e) {
//       completer.complete(null);
//     });
    
//     try {
//       // This will block until the future completes
//       return completer.future.then((value) => value);
//     } catch (e) {
//       return null;
//     }
//   }

//   @override
//   List<Metadata?> loadMetadatas(List<String> pubKeys) {
//     if (pubKeys.isEmpty) return [];
    
//     final completer = Completer<List<Metadata?>>();
//     database.then((db) async {
//       final results = await db.query(
//         'metadatas',
//         where: 'pubkey IN (${List.filled(pubKeys.length, '?').join(',')})',
//         whereArgs: pubKeys,
//       );
      
//       final metadataMap = {
//         for (var m in results) m['pubkey'] as String: _metadataFromMap(m)
//       };
      
//       final result = pubKeys.map((key) => metadataMap[key]).toList();
//       completer.complete(result);
//     }).catchError((e) {
//       completer.complete(List.filled(pubKeys.length, null));
//     });
    
//     try {
//       return completer.future.then((value) => value);
//     } catch (e) {
//       return List.filled(pubKeys.length, null);
//     }
//   }

//   @override
//   Future<void> removeMetadata(String pubKey) async {
//     final db = await database;
//     await db.delete(
//       'metadatas',
//       where: 'pubkey = ?',
//       whereArgs: [pubKey],
//     );
//   }

//   @override
//   Future<void> removeAllMetadatas() async {
//     final db = await database;
//     await db.delete('metadatas');
//   }

//   @override
//   Metadata? getMetadataByNip05(String nip05) {
//     final completer = Completer<Metadata?>();
//     database.then((db) async {
//       final results = await db.query(
//         'metadatas',
//         where: 'nip05 = ?',
//         whereArgs: [nip05],
//       );
      
//       if (results.isEmpty) {
//         completer.complete(null);
//       } else {
//         completer.complete(_metadataFromMap(results.first));
//       }
//     }).catchError((e) {
//       completer.complete(null);
//     });
    
//     try {
//       return completer.future.then((value) => value);
//     } catch (e) {
//       return null;
//     }
//   }

//   @override
//   List<Metadata> getAllMetadatas() {
//     final completer = Completer<List<Metadata>>();
//     database.then((db) async {
//       final results = await db.query('metadatas');
//       final metadatas = results.map((m) => _metadataFromMap(m)).toList();
//       completer.complete(metadatas);
//     }).catchError((e) {
//       completer.complete([]);
//     });
    
//     try {
//       return completer.future.then((value) => value);
//     } catch (e) {
//       return [];
//     }
//   }

//   // Helper method to create Metadata from database map
//   Metadata _metadataFromMap(Map<String, dynamic> map) {
//     return Metadata(
//       pubkey: map['pubkey'] as String,
//       name: map['name'] as String?,
//       displayName: map['display_name'] as String?,
//       picture: map['picture'] as String?,
//       banner: map['banner'] as String?,
//       website: map['website'] as String?,
//       about: map['about'] as String?,
//       nip05: map['nip05'] as String?,
//       lud16: map['lud16'] as String?,
//       lud06: map['lud06'] as String?,
//       createdAt: map['created_at'] as int? ?? 0,
//       isDeleted: (map['is_deleted'] as int? ?? 0) == 1,
//       refreshedTimestamp: map['refreshed_timestamp'] as int?,
//     );
//   }

//   // Contact List methods
//   @override
//   Future<void> saveContactList(ContactList contactList) async {
//     final db = await database;
//     await db.insert(
//       'contact_lists',
//       {
//         'pubkey': contactList.pubkey,
//         'contacts_json': _listToJson(contactList.contacts),
//         'contact_relays_json': _mapToJson(contactList.contactRelays),
//         'petnames_json': _mapToJson(contactList.petnames),
//         'followed_tags_json': _listToJson(contactList.followedTags),
//         'followed_communities_json': _listToJson(contactList.followedCommunities),
//         'followed_events_json': _listToJson(contactList.followedEvents),
//         'created_at': contactList.createdAt,
//         'loaded_timestamp': contactList.loadedTimestamp,
//         'sources_json': _listToJson(contactList.sources),
//       },
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   @override
//   Future<void> saveContactLists(List<ContactList> contactLists) async {
//     final batch = (await database).batch();
//     for (final contactList in contactLists) {
//       batch.insert(
//         'contact_lists',
//         {
//           'pubkey': contactList.pubkey,
//           'contacts_json': _listToJson(contactList.contacts),
//           'contact_relays_json': _mapToJson(contactList.contactRelays),
//           'petnames_json': _mapToJson(contactList.petnames),
//           'followed_tags_json': _listToJson(contactList.followedTags),
//           'followed_communities_json': _listToJson(contactList.followedCommunities),
//           'followed_events_json': _listToJson(contactList.followedEvents),
//           'created_at': contactList.createdAt,
//           'loaded_timestamp': contactList.loadedTimestamp,
//           'sources_json': _listToJson(contactList.sources),
//         },
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     }
//     await batch.commit(noResult: true);
//   }

//   @override
//   ContactList? loadContactList(String pubKey) {
//     final completer = Completer<ContactList?>();
//     database.then((db) async {
//       final results = await db.query(
//         'contact_lists',
//         where: 'pubkey = ?',
//         whereArgs: [pubKey],
//       );
      
//       if (results.isEmpty) {
//         completer.complete(null);
//       } else {
//         completer.complete(_contactListFromMap(results.first));
//       }
//     }).catchError((e) {
//       completer.complete(null);
//     });
    
//     try {
//       return completer.future.then((value) => value);
//     } catch (e) {
//       return null;
//     }
//   }

//   @override
//   Future<void> removeContactList(String pubKey) async {
//     final db = await database;
//     await db.delete(
//       'contact_lists',
//       where: 'pubkey = ?',
//       whereArgs: [pubKey],
//     );
//   }

//   @override
//   Future<void> removeAllContactLists() async {
//     final db = await database;
//     await db.delete('contact_lists');
//   }

//   // Mute List methods
//   @override
//   Future<void> saveMuteList(MuteList muteList) async {
//     final db = await database;
//     await db.insert(
//       'mute_lists',
//       {
//         'pubkey': muteList.pubkey,
//         'mutes_json': _listToJson(muteList.mutes),
//         'created_at': muteList.createdAt,
//       },
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   @override
//   Future<void> saveMuteLists(List<MuteList> muteLists) async {
//     final batch = (await database).batch();
//     for (final muteList in muteLists) {
//       batch.insert(
//         'mute_lists',
//         {
//           'pubkey': muteList.pubkey,
//           'mutes_json': _listToJson(muteList.mutes),
//           'created_at': muteList.createdAt,
//         },
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     }
//     await batch.commit(noResult: true);
//   }

//   @override
//   MuteList? loadMuteList(String pubKey) {
//     final completer = Completer<MuteList?>();
//     database.then((db) async {
//       final results = await db.query(
//         'mute_lists',
//         where: 'pubkey = ?',
//         whereArgs: [pubKey],
//       );
      
//       if (results.isEmpty) {
//         completer.complete(null);
//       } else {
//         completer.complete(_muteListFromMap(results.first));
//       }
//     }).catchError((e) {
//       completer.complete(null);
//     });
    
//     try {
//       return completer.future.then((value) => value);
//     } catch (e) {
//       return null;
//     }
//   }

//   @override
//   Future<void> removeMuteList(String pubKey) async {
//     final db = await database;
//     await db.delete(
//       'mute_lists',
//       where: 'pubkey = ?',
//       whereArgs: [pubKey],
//     );
//   }

//   @override
//   Future<void> removeAllMuteLists() async {
//     final db = await database;
//     await db.delete('mute_lists');
//   }

//   // Helper methods for JSON serialization
//   String _mapToJson(Map<String, dynamic> map) => jsonEncode(map);
//   Map<String, dynamic> _jsonToMap(String json) => 
//       json.isNotEmpty ? Map<String, dynamic>.from(jsonDecode(json)) : {};

//   // Helper method to create ContactList from database map
//   ContactList _contactListFromMap(Map<String, dynamic> map) {
//     return ContactList(
//       pubkey: map['pubkey'] as String,
//       contacts: List<String>.from(_jsonToList(map['contacts_json'] as String? ?? '[]')),
//     )..contactRelays = List<String>.from(_jsonToList(map['contact_relays_json'] as String? ?? '[]'))
//     ..petnames = List<String>.from(_jsonToList(map['petnames_json'] as String? ?? '[]')) 
//     ..followedTags = List<String>.from(_jsonToList(map['followed_tags_json'] as String? ?? '[]'))
//     ..followedCommunities = List<Map<String, dynamic>>.from(
//       _jsonToList(map['followed_communities_json'] as String? ?? '[]'),
//     )
//     ..followedEvents = List<String>.from(_jsonToList(map['followed_events_json'] as String? ?? '[]'))
//     ..createdAt = map['created_at'] as int? ?? 0
//     ..loadedTimestamp = map['loaded_timestamp'] as int? ?? 0
//     ..sources = List<String>.from(_jsonToList(map['sources_json'] as String? ?? '[]')) ;
//   }

//   // Helper method to create MuteList from database map
//   MuteList _muteListFromMap(Map<String, dynamic> map) {
//     return MuteList(
//       pubkey: map['pubkey'] as String,
//       mutes: List<Map<String, dynamic>>.from(_jsonToList(map['mutes_json'] as String? ?? '[]')),
//       createdAt: map['created_at'] as int? ?? 0,
//     );
//   }
  
//   // Relay Set methods
//   @override
//   Future<void> saveRelaySet(RelaySet relaySet) async {
//     final db = await database;
//     await db.insert(
//       'relay_sets',
//       {
//         'name': relaySet.name,
//         'pubkey': relaySet.pubkey,
//         'relays_json': _listToJson(relaySet.relays),
//       },
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   @override
//   Future<void> saveRelaySets(List<RelaySet> relaySets) async {
//     final batch = (await database).batch();
//     for (final relaySet in relaySets) {
//       batch.insert(
//         'relay_sets',
//         {
//           'name': relaySet.name,
//           'pubkey': relaySet.pubkey,
//           'relays_json': _listToJson(relaySet.relays),
//         },
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     }
//     await batch.commit(noResult: true);
//   }

//   @override
//   Future<RelaySet?> loadRelaySet(String name, String pubKey)async {
//     final completer = Completer<RelaySet?>();
//     database.then((db) async {
//       final results = await db.query(
//         'relay_sets',
//         where: 'name = ? AND pubkey = ?',
//         whereArgs: [name, pubKey],
//       );
      
//       if (results.isEmpty) {
//         completer.complete(null);
//       } else {
//         completer.complete(_relaySetFromMap(results.first));
//       }
//     }).catchError((e) {
//       completer.complete(null);
//     });
    
//     try {
//       return completer.future.then((value) => value);
//     } catch (e) {
//       return null;
//     }
//   }

//   @override
//   Future<void> removeRelaySet(String name, String pubKey) async {
//     final db = await database;
//     await db.delete(
//       'relay_sets',
//       where: 'name = ? AND pubkey = ?',
//       whereArgs: [name, pubKey],
//     );
//   }

//   @override
//   Future<void> removeAllRelaySets() async {
//     final db = await database;
//     await db.delete('relay_sets');
//   }

//   // Event Stats methods
//   @override
//   Future<void> saveEventStats(EventStats stats) async {
//     final db = await database;
//     await db.insert(
//       'event_stats',
//       {
//         'event_id': stats.eventId,
//         'replies': stats.replies.length,
//         'reactions': stats.reactions.length,
//         'reposts': stats.reposts.length,
//         'zaps': stats.zaps.length,
//         'zap_amount': stats.zaps.values.fold<int>(0, (sum, z) => sum + z.values.fold(0, (s, a) => s + a)),
//         'score': 0.0, // Calculate score if needed
//         'updated_at': DateTime.now().millisecondsSinceEpoch ~/ 1000,
//       },
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   @override
//   Future<void> saveEventStatsList(List<EventStats> statsList) async {
//     final batch = (await database).batch();
//     for (final stats in statsList) {
//       batch.insert(
//         'event_stats',
//         {
//           'event_id': stats.eventId,
//           'replies': stats.replies.length,
//           'reactions': stats.reactions.length,
//           'reposts': stats.reposts.length,
//           'zaps': stats.zaps.length,
//           'zap_amount': stats.zaps.values.fold<int>(0, (sum, z) => sum + z.values.fold(0, (s, a) => s + a)),
//           'score': 0.0, // Calculate score if needed
//           'updated_at': DateTime.now().millisecondsSinceEpoch ~/ 1000,
//         },
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     }
//     await batch.commit(noResult: true);
//   }

//   @override
//   Future<EventStats?> loadEventStats(String eventId) async {
//     try {
//       final db = await database;
//       final results = await db.query(
//         'event_stats',
//         where: 'event_id = ?',
//         whereArgs: [eventId],
//       );
      
//       return results.isNotEmpty ? _eventStatsFromMap(results.first) : null;
//     } catch (e) {
//       print('Error loading event stats: $e');
//       return null;
//     }
//   }

//   @override
//   Future<List<EventStats?>> loadEventStatsList(List<String> eventIds) async {
//     try {
//       if (eventIds.isEmpty) return [];
      
//       final db = await database;
//       final results = await db.query(
//         'event_stats',
//         where: 'event_id IN (${List.filled(eventIds.length, '?').join(',')})',
//         whereArgs: eventIds,
//       );
      
//       return results.map((e) => _eventStatsFromMap(e)).toList();
//     } catch (e) {
//       print('Error loading event stats list: $e');
//       return [];
//     }
//   }

//   @override
//   Future<void> removeEventStats(String eventId) async {
//     final db = await database;
//     await db.delete(
//       'event_stats',
//       where: 'event_id = ?',
//       whereArgs: [eventId],
//     );
//   }

//   @override
//   Future<void> removeAllEventStats() async {
//     final db = await database;
//     await db.delete('event_stats');
//   }

//   // Web of Trust (WoT) methods
//   @override
//   Future<void> saveUserWot(WotModel wotModel) async {
//     final db = await database;
//     await db.insert(
//       'wot_models',
//       {
//         'pubkey': wotModel.pubkey,
//         'data_json': jsonEncode(wotModel.toJson()),
//         'updated_at': DateTime.now().millisecondsSinceEpoch ~/ 1000,
//       },
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   @override
//   Future<WotModel?> loadUserWot(String pubkey) async {
//     try {
//       final db = await database;
//       final results = await db.query(
//         'wot_models',
//         where: 'pubkey = ?',
//         whereArgs: [pubkey],
//       );
      
//       if (results.isEmpty) return null;
      
//       try {
//         final data = jsonDecode(results.first['data_json'] as String);
//         return WotModel.fromJson(data);
//       } catch (e) {
//         return null;
//       }
//     } catch (e) {
//       print('Error loading WoT for user $pubkey: $e');
//       return null;
//     }
//   }

//   @override
//   Future<void> removeUserWot(String pubkey) async {
//     try {
//       final db = await database;
//       await db.delete(
//         'wot_models',
//         where: 'pubkey = ?',
//         whereArgs: [pubkey],
//       );
//     } catch (e) {
//       print('Error removing WoT for user $pubkey: $e');
//       rethrow;
//     }
//   }

//   @override
//   Future<void> removeAllWot() async {
//     final db = await database;
//     await db.delete('wot_models');
//   }

//   // Helper method to create EventStats from database map
//   EventStats _eventStatsFromMap(Map<String, dynamic> map) {
//     return EventStats(
//       eventId: map['event_id'] as String,
//       reactions: {}, // These would need to be loaded from a separate table
//       replies: {},    // or a more complex schema to store the full stats
//       quotes: {},
//       reposts: {},
//       zaps: {},
//       newestCreatedAt: map['updated_at'] as int? ?? 0,
//     );
//   }

//   // User Relay List methods
//   @override
//   Future<void> saveUserRelayList(UserRelayList userRelayList) async {
//     final db = await database;
//     await db.insert(
//       'user_relay_lists',
//       {
//         'pubkey': userRelayList.pubkey,
//         'relays_json': _mapToJson(userRelayList.relays),
//         'created_at': userRelayList.createdAt,
//       },
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   @override
//   Future<void> saveUserRelayLists(List<UserRelayList> userRelayLists) async {
//     final batch = (await database).batch();
//     for (final userRelayList in userRelayLists) {
//       batch.insert(
//         'user_relay_lists',
//         {
//           'pubkey': userRelayList.pubkey,
//           'relays_json': _mapToJson(userRelayList.relays),
//           'created_at': userRelayList.createdAt,
//         },
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     }
//     await batch.commit(noResult: true);
//   }

//   @override
//   Future<UserRelayList?> loadUserRelayList(String pubKey) async {
//     try {
//       final db = await database;
//       final results = await db.query(
//         'user_relay_lists',
//         where: 'pubkey = ?',
//         whereArgs: [pubKey],
//       );
      
//       return results.isNotEmpty ? _userRelayListFromMap(results.first) : null;
//     } catch (e) {
//       print('Error loading user relay list for $pubKey: $e');
//       return null;
//     }
//   }

//   @override
//   Future<void> removeUserRelayList(String pubKey) async {
//     final db = await database;
//     await db.delete(
//       'user_relay_lists',
//       where: 'pubkey = ?',
//       whereArgs: [pubKey],
//     );
//   }

//   @override
//   Future<void> removeAllUserRelayLists() async {
//     final db = await database;
//     await db.delete('user_relay_lists');
//   }

//   // Helper method to create RelaySet from database map
//   RelaySet _relaySetFromMap(Map<String, dynamic> map) {
//     return RelaySet(
//       name: map['name'] as String,
//       pubkey: map['pubkey'] as String,
//       relays: List<String>.from(_jsonToList(map['relays_json'] as String? ?? '[]')),
//     );
//   }

//   // Helper method to create UserRelayList from database map
//   UserRelayList _userRelayListFromMap(Map<String, dynamic> map) {
//     return UserRelayList(
//       pubkey: map['pubkey'] as String,
//       relays: Map<String, Map<String, bool>>.from(
//         _jsonToMap(map['relays_json'] as String? ?? '{}').map(
//           (key, value) => MapEntry(
//             key,
//             Map<String, bool>.from(value as Map),
//           ),
//         ),
//       ),
//       createdAt: map['created_at'] as int? ?? 0,
//     );
//   }

//   @override
//   int? getContactWotAvailability({required List<String> originPubkeyList, required String peerPubkey}) {
//     // TODO: implement getContactWotAvailability
//     throw UnimplementedError();
//   }

//   @override
//   int? getMutesWotAvailability({required List<String> originPubkeyList, required String peerPubkey}) {
//     // TODO: implement getMutesWotAvailability
//     throw UnimplementedError();
//   }

//   @override
//   Future<Map<String, Map<String, int>>> getWotAvailabilityBatch({required List<String> originPubkeyList, required List<String> peerPubkeys}) {
//     // TODO: implement getWotAvailabilityBatch
//     throw UnimplementedError();
//   }

//   @override
//   Future<List<DMSessionInfo>> loadDmSessionsInfo(String id) {
//     // TODO: implement loadDmSessionsInfo
//     throw UnimplementedError();
//   }

//   @override
//   Future<List<DMSessionInfo?>> loadDmSessionsInfos(List<String> ids) {
//     // TODO: implement loadDmSessionsInfos
//     throw UnimplementedError();
//   }

//   @override
//   Future<Nip05?> loadNip05(String pubKey) {
//     // TODO: implement loadNip05
//     throw UnimplementedError();
//   }

//   @override
//   Future<List<Nip05?>> loadNip05s(List<String> pubKeys) {
//     // TODO: implement loadNip05s
//     throw UnimplementedError();
//   }

//   @override
//   Future<List<RelaySet>> loadRelaySets(String pubKey) {
//     // TODO: implement loadRelaySets
//     throw UnimplementedError();
//   }

//   @override
//   Future<DbUserAppSettings?> loadUserAppSettings(String pubkey) {
//     // TODO: implement loadUserAppSettings
//     throw UnimplementedError();
//   }

//   @override
//   Future<DbUserDrafts?> loadUserDrafts(String pubkey) {
//     // TODO: implement loadUserDrafts
//     throw UnimplementedError();
//   }

//   @override
//   Future<DbUserFollowers?> loadUserFollowers(String pubkey) {
//     // TODO: implement loadUserFollowers
//     throw UnimplementedError();
//   }

//   @override
//   Future<WotScore?> loadWotScore(String pubkey, String originPubkey) {
//     // TODO: implement loadWotScore
//     throw UnimplementedError();
//   }

//   @override
//   Future<List<WotScore>> loadWotScoreList(List<String> pubkeys, String originPubkey) {
//     // TODO: implement loadWotScoreList
//     throw UnimplementedError();
//   }

//   @override
//   Future<Map<String, WotScore>> loadWotScoreMap(List<String> pubkeys, String originPubkey) {
//     // TODO: implement loadWotScoreMap
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> removeAllAppSettings() {
//     // TODO: implement removeAllAppSettings
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> removeAllDmSessionsInfo() {
//     // TODO: implement removeAllDmSessionsInfo
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> removeAllNip05s() {
//     // TODO: implement removeAllNip05s
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> removeAllRelaySetsForPubKey(String pubKey) {
//     // TODO: implement removeAllRelaySetsForPubKey
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> removeAllUserDrafts() {
//     // TODO: implement removeAllUserDrafts
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> removeAllUserFollowers() {
//     // TODO: implement removeAllUserFollowers
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> removeAllWotScore() {
//     // TODO: implement removeAllWotScore
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> removeDmSessionsInfo(String id) {
//     // TODO: implement removeDmSessionsInfo
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> removeNip05(String pubKey) {
//     // TODO: implement removeNip05
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> removeUserAppSettings(String pubkey) {
//     // TODO: implement removeUserAppSettings
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> removeUserDrafts(String pubkey) {
//     // TODO: implement removeUserDrafts
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> removeUserFollowers(String pubkey) {
//     // TODO: implement removeUserFollowers
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> removeWotScore(String id) {
//     // TODO: implement removeWotScore
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> saveDmSessionsInfo(DMSessionInfo info) {
//     // TODO: implement saveDmSessionsInfo
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> saveDmSessionsInfos(List<DMSessionInfo> infos) {
//     // TODO: implement saveDmSessionsInfos
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> saveNip05(Nip05 nip05) {
//     // TODO: implement saveNip05
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> saveNip05s(List<Nip05> nip05s) {
//     // TODO: implement saveNip05s
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> saveUserAppSettings(DbUserAppSettings dbUserAppSettings) {
//     // TODO: implement saveUserAppSettings
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> saveUserDrafts(DbUserDrafts dbUserDrafts) {
//     // TODO: implement saveUserDrafts
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> saveUserFollowers(DbUserFollowers dbUserFollowers) {
//     // TODO: implement saveUserFollowers
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> saveWotScore(WotScore wotScore) {
//     // TODO: implement saveWotScore
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> saveWotScoresBatch(List<WotScore> wotScores) {
//     // TODO: implement saveWotScoresBatch
//     throw UnimplementedError();
//   }

//   @override
//   Future<Iterable<Metadata>> searchMetadatas(String search, int limit) {
//     // TODO: implement searchMetadatas
//     throw UnimplementedError();
//   }

//   // ... Continue with all other methods from CacheManager
  
//   // Note: You'll need to implement all the remaining methods from the CacheManager interface
//   // This is just a starting point
// }
