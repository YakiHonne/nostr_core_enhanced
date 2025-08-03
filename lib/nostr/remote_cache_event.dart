// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class BaseEvent {}

class RemoteCacheEventsType {
  static const userFollowers = 'user_followers';
  static const userMutuals = 'mutual_follows';
  static const userProfile = 'user_profile';
  static const feed = 'feed';
  static const explore = 'explore';
  static const popularNotes = 'user_profile_scored_content';
  static const trendingUsers24 = 'scored_users_24h';
  static const scored = 'scored';
  static const search = 'search';
}

class RemoteCacheEventsSelector {
  static const trending1H = 'trending_1h';
}

class RemoteCacheEventKind {
  static const userInfoKind = 10000105;
  static const feedLastUntil = 10000113;
}

class RemoteCacheEvent implements BaseEvent {
  final int kind;
  final String? subscriptionId;
  final Map<String, dynamic> data;

  factory RemoteCacheEvent.deserialize(dynamic input) {
    Map<String, dynamic> json = {};
    String? subscriptionId;

    subscriptionId = input[1];
    json = input[2];

    return RemoteCacheEvent(
      kind: json['kind'],
      subscriptionId: subscriptionId,
      data: json,
    );
  }

  RemoteCacheEvent({
    required this.kind,
    required this.data,
    this.subscriptionId,
  });
}
