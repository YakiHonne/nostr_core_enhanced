import 'package:drift/drift.dart';
import 'package:nostr_core_enhanced/db/drift_database.dart';

class UserFollowers {
  String pubkey;
  List<String> followers;
  int lastRefreshed;

  UserFollowersTableCompanion toCompanion() {
    return UserFollowersTableCompanion(
      pubkey: Value(pubkey),
      followers: Value(followers),
      lastRefreshed: Value(lastRefreshed),
    );
  }

  UserFollowers({
    required this.pubkey,
    required this.followers,
    required this.lastRefreshed,
  });

  factory UserFollowers.fromUserFollowersTableData(
    UserFollowersTableData data,
  ) {
    return UserFollowers(
      pubkey: data.pubkey,
      followers: data.followers,
      lastRefreshed: data.lastRefreshed,
    );
  }
}
