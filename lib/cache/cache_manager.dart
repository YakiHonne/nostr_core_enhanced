import 'package:nostr_core_enhanced/models/app_shared_settings.dart';
import 'package:nostr_core_enhanced/models/models.dart';
import 'package:nostr_core_enhanced/models/user_drafts.dart';
import 'package:nostr_core_enhanced/models/user_followers.dart';
import 'package:nostr_core_enhanced/nostr/nostr.dart';

import '../models/event_stats.dart';
import '../models/mute_list.dart';
import '../models/wot_models.dart';

abstract class CacheManager {
  Future<void> saveEvent(Event event);
  Future<void> saveEvents(List<Event> events);
  Future<Event?> loadEventById(String id, bool r);
  Future<Event?> loadEvent({
    String? e,
    String? pubkey,
    String? kTag,
    String? pTag,
    int? kind,
  });
  Future<List<Event>> loadEvents({
    List<String>? pubkeys,
    List<String>? ids,
    List<String>? eTags,
    List<int>? kinds,
    String? pTag,
    String? currentUser,
  });

  Future<void> removeEvent(String id);
  Future<void> removeAllEventsByPubKey(String pubKey);
  Future<void> removeAllEvents();
  Future<void> removeAllEventsByKinds(List<int> kinds);

  Future<void> saveUserRelayList(UserRelayList userRelayList);
  Future<void> saveUserRelayLists(List<UserRelayList> userRelayLists);
  Future<UserRelayList?> loadUserRelayList(String pubKey);
  Future<void> removeUserRelayList(String pubKey);
  Future<void> removeAllUserRelayLists();

  Future<RelaySet?> loadRelaySet(String name, String pubKey);
  Future<void> saveRelaySet(RelaySet relaySet);
  Future<void> removeRelaySet(String name, String pubKey);
  Future<void> removeAllRelaySets();

  Future<WotScore?> loadWotScore(String pubkey, String originPubkey);
  Future<List<WotScore>> loadWotScoreList(
      List<String> pubkeys, String originPubkey);
  Future<void> saveWotScoresBatch(List<WotScore> wotScores);
  Future<void> saveWotScore(WotScore wotScore);
  Future<void> removeWotScore(String id);
  Future<void> removeAllWotScore();
  Future<Map<String, WotScore>> loadWotScoreMap(
    List<String> pubkeys,
    String originPubkey,
  );
  Future<Map<String, Map<String, int>>> getWotAvailabilityBatch({
    required List<String> originPubkeyList,
    required List<String> peerPubkeys,
  });

  Future<void> saveContactList(ContactList contactList);
  Future<void> saveContactLists(List<ContactList> contactLists);
  Future<ContactList?> loadContactList(String pubKey);
  Future<void> removeContactList(String pubKey);
  Future<void> removeAllContactLists();
  Future<int?> getContactWotAvailability({
    required List<String> originPubkeyList,
    required String peerPubkey,
  });

  Future<void> saveMuteList(MuteList muteList);
  Future<void> saveMuteLists(List<MuteList> muteLists);
  Future<MuteList?> loadMuteList(String pubKey);
  Future<void> removeMuteList(String pubKey);
  Future<void> removeAllMuteLists();
  Future<int?> getMutesWotAvailability({
    required List<String> originPubkeyList,
    required String peerPubkey,
  });

  Future<void> saveMetadata(Metadata metadata);
  Future<void> saveMetadatas(List<Metadata> metadatas);
  Future<Metadata?> loadMetadata(String pubKey);
  Future<Metadata?> getMetadataByNip05(String nip05);
  Future<List<Metadata?>> loadMetadatas(List<String> pubKeys);
  Future<List<Metadata>> getAllMetadatas();
  Future<void> removeMetadata(String pubKey);
  Future<void> removeAllMetadatas();
  Future<Iterable<Metadata>> searchMetadatas(String search, int limit);
  Future<Iterable<Metadata>> searchRelatedMetadatas(
    String search,
    List<String> pubkeys,
    int limit,
  );

  Future<void> saveNip05(Nip05 nip05);
  Future<void> saveNip05s(List<Nip05> nip05s);
  Future<Nip05?> loadNip05(String pubKey);
  Future<List<Nip05?>> loadNip05s(List<String> pubKeys);
  Future<void> removeNip05(String pubKey);
  Future<void> removeAllNip05s();

  Future<void> saveDmSessionsInfo(DMSessionInfo info);
  Future<void> saveDmSessionsInfos(List<DMSessionInfo> infos);
  Future<DMSessionInfo?> loadDmSessionsInfo(String id);
  Future<List<DMSessionInfo?>> loadDmSessionsInfos(List<String> ids);
  Future<void> removeDmSessionsInfo(String id);
  Future<void> removeAllDmSessionsInfo();

  Future<void> saveEventStats(EventStats stats);
  Future<void> saveEventStatsList(List<EventStats> stats);
  Future<EventStats?> loadEventStats(String eventId);
  Future<List<EventStats?>> loadEventStatsList(List<String> eventIds);
  Future<void> removeEventStats(String eventId);
  Future<void> removeAllEventStats();

  Future<void> saveUserFollowers(UserFollowers dbUserFollowers);
  Future<UserFollowers?> loadUserFollowers(String pubkey);
  Future<void> removeUserFollowers(String pubkey);
  Future<void> removeAllUserFollowers();

  Future<void> saveUserDrafts(UserDrafts dbUserDrafts);
  Future<UserDrafts?> loadUserDrafts(String pubkey);
  Future<void> removeUserDrafts(String pubkey);
  Future<void> removeAllUserDrafts();

  Future<void> saveUserAppSettings(AppSharedSettings dbUserAppSettings);
  Future<AppSharedSettings?> loadUserAppSettings(String pubkey);
  Future<void> removeUserAppSettings(String pubkey);
  Future<void> removeAllAppSettings();

  Future<void> saveUserWot(WotModel wotModel);
  Future<WotModel?> loadUserWot(String pubkey);
  Future<void> removeUserWot(String pubkey);
  Future<void> removeAllWot();

  Future<void> clearCache();
}
