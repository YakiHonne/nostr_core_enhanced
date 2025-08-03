// import 'package:nostr_core/cache/cache_manager.dart';
// import 'package:nostr_core/db/db_cache_manager.dart';
// import 'package:nostr_core/db/sqlite_cache_manager.dart';

// enum CacheType {
//   isar,
//   sqlite,
// }

// class CacheManagerFactory {
//   static CacheManager? _instance;
//   static CacheType _currentType = CacheType.isar; // Default to Isar

//   static Future<CacheManager> getManager({CacheType type = CacheType.isar}) async {
//     if (_instance != null && _currentType == type) {
//       return _instance!;
//     }

//     _currentType = type;
    
//     switch (type) {
//       case CacheType.isar:
//         final manager = DbCacheManager();
//         await manager.init();
//         _instance = manager;
//         break;
//       case CacheType.sqlite:
//         final manager = SQLiteCacheManager();
//         _instance = manager;
//         break;
//     }
    
//     return _instance!;
//   }

//   static void setCacheType(CacheType type) {
//     if (_currentType != type) {
//       _instance = null;
//       _currentType = type;
//     }
//   }

//   static CacheType get currentType => _currentType;
// }
