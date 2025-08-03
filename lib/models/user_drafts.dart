class UserDrafts {
  String pubkey;

  Map<String, String> replies;
  String noteDraft;
  String articleDraft;
  Map<String, String> smartWidgetsDraft;

  UserDrafts({
    required this.pubkey,
    required this.replies,
    required this.noteDraft,
    required this.articleDraft,
    required this.smartWidgetsDraft,
  });
}
