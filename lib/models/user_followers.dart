class UserFollowers {
  String pubkey;
  List<String> followers;
  int lastRefreshed;

  UserFollowers({
    required this.pubkey,
    required this.followers,
    required this.lastRefreshed,
  });
}
