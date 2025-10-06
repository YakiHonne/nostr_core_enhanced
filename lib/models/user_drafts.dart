import 'package:nostr_core_enhanced/db/drift_database.dart';

class UserDrafts {
  String pubkey;
  String noteDraft;
  String articleDraft;
  Map<String, String> replies;
  Map<String, String> smartWidgetsDraft;

  UserDraftTableData toCompanion() {
    return UserDraftTableData(
      pubkey: pubkey,
      replies: replies,
      noteDraft: noteDraft,
      articleDraft: articleDraft,
      smartWidgetsDraft: smartWidgetsDraft,
    );
  }

  UserDrafts({
    required this.pubkey,
    required this.replies,
    required this.noteDraft,
    required this.articleDraft,
    required this.smartWidgetsDraft,
  });

  factory UserDrafts.fromUserDraftTableData(UserDraftTableData data) {
    return UserDrafts(
      pubkey: data.pubkey,
      replies: data.replies,
      noteDraft: data.noteDraft,
      articleDraft: data.articleDraft,
      smartWidgetsDraft: data.smartWidgetsDraft,
    );
  }
}
