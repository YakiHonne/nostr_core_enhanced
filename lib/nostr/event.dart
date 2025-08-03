// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:nostr_core_enhanced/db/drift_database.dart';
import 'package:nostr_core_enhanced/nostr/nostr.dart';
import 'package:nostr_core_enhanced/nostr/remote_cache_event.dart';
import 'package:pointycastle/export.dart';

import '../utils/static_properties.dart';

class Event implements BaseEvent {
  // ============================================================================
  // PROPERTIES
  // ============================================================================

  // Core event properties
  late String id;
  late String pubkey;
  late int createdAt;
  late List<List<String>> tags;
  late int kind;
  late String sig;
  String content = '';

  // Additional metadata
  List<String> seenOn = [];
  String currentUser = '';
  String? subscriptionId;
  int? lastUpdated;

  // Parsed tag collections
  List<List<String>> tTags = [];
  List<List<String>> pTags = [];
  List<List<String>> capitalpTags = [];
  List<List<String>> kTags = [];
  List<List<String>> eTags = [];
  List<List<String>> lTags = [];
  List<List<String>> aTags = [];
  List<List<String>> other = [];

  // Special tag values
  String? dTag;
  String? root;
  String? reply;

  // ============================================================================
  // CONSTRUCTORS
  // ============================================================================

  Event({
    required this.id,
    required this.pubkey,
    required this.createdAt,
    required this.kind,
    required this.content,
    required this.tags,
    required this.sig,
    this.subscriptionId,
    this.lastUpdated,
    this.currentUser = '',
    this.seenOn = const [],
    bool verify = false,
  }) {
    pubkey = pubkey.toLowerCase();
    setTags(tags);
  }

  factory Event.partial({
    String id = '',
    String pubkey = '',
    int createdAt = 0,
    int kind = 1,
    tags = const <List<String>>[],
    String content = '',
    String sig = '',
    String currentUser = '',
    seenOn = const <String>[],
    subscriptionId,
    bool verify = false,
  }) {
    return Event(
      id: id.isEmpty
          ? _processEventId(pubkey, createdAt, kind, tags, content)
          : id,
      pubkey: pubkey,
      createdAt: createdAt,
      kind: kind,
      content: content,
      tags: tags,
      sig: sig,
      currentUser: currentUser,
      seenOn: seenOn,
      verify: verify,
    );
  }

  factory Event.withoutSignature({
    int createdAt = 0,
    required int kind,
    required List<List<String>> tags,
    required String content,
    required String pubkey,
    String? subscriptionId,
    bool verify = false,
  }) {
    if (createdAt == 0) createdAt = currentUnixTimestampSeconds();

    final id = _processEventId(
      pubkey,
      createdAt,
      kind,
      tags,
      content,
    );

    return Event(
      id: id,
      pubkey: pubkey,
      createdAt: createdAt,
      kind: kind,
      content: content,
      tags: tags,
      sig: '',
      subscriptionId: subscriptionId,
      currentUser: pubkey,
      seenOn: [],
      verify: verify,
    );
  }

  factory Event.fromEventTableData(EventTableData data) {
    return Event(
      id: data.id,
      pubkey: data.pubkey,
      createdAt: data.createdAt,
      kind: data.kind,
      content: data.content,
      tags: data.tags,
      sig: data.sig,
      currentUser: data.currentUser,
      seenOn: data.seenOn,
      subscriptionId: data.subscriptionId,
      lastUpdated: data.lastUpdated,
    );
  }

  factory Event.fromJson(
    Map<String, dynamic> json, {
    String? currentUser,
    List<String>? seenOn,
    bool verify = true,
  }) {
    var tags = (json['tags'] as List<dynamic>)
        .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
        .toList();

    return Event(
      id: json['id'],
      pubkey: json['pubkey'],
      createdAt: json['created_at'],
      kind: json['kind'],
      content: json['content'],
      tags: tags,
      sig: json['sig'],
      currentUser: currentUser ?? '',
      seenOn: seenOn ?? [],
      verify: verify,
    );
  }

  factory Event.deserialize(
    input, {
    String? currentUser,
    List<String>? seenOn,
    bool verify = true,
  }) {
    Map<String, dynamic> json = {};
    String? subscriptionId;

    if (input.length == 2) {
      json = input[1] as Map<String, dynamic>;
    } else if (input.length == 3) {
      json = input[2] as Map<String, dynamic>;
      subscriptionId = input[1] as String;
    } else {
      throw Exception('invalid input');
    }

    var tags = (json['tags'] as List<dynamic>)
        .map((e) => (e as List)
            .map((e) => e.runtimeType == String ? e as String : '')
            .toList())
        .toList();

    return Event(
      id: json['id'],
      pubkey: json['pubkey'],
      createdAt: json['created_at'],
      kind: json['kind'],
      content: json['content'],
      tags: tags,
      sig: json['sig'],
      currentUser: currentUser ?? '',
      seenOn: seenOn ?? [],
      subscriptionId: subscriptionId,
      verify: verify,
    );
  }

  // ============================================================================
  // CORE METHODS
  // ============================================================================

  void setTags(List<List<String>> tags) {
    for (final tagArray in tags) {
      if (tagArray.length >= 2) {
        if (tagArray.first == 'e') {
          eTags.add(tagArray);
        } else if (tagArray.first == 'p') {
          pTags.add(tagArray);
        } else if (tagArray.first == 'P') {
          capitalpTags.add(tagArray);
        } else if (tagArray.first == 'k') {
          kTags.add(tagArray);
        } else if (tagArray.first == 'a') {
          aTags.add(tagArray);
        } else if (tagArray.first == 'l') {
          lTags.add(tagArray);
        } else if (tagArray.first == 't') {
          tTags.add(tagArray);
        } else if (tagArray.first == 'd') {
          dTag = tagArray[1];
        } else {
          other.add(tagArray);
        }

        reply ??= getRelationId(tagArray, 'reply');
        root ??= getRelationId(tagArray, 'root');
      }
    }
  }

  // ============================================================================
  // GETTER METHODS
  // ============================================================================

  String? getEventParent() {
    String? root;
    String? reply;

    for (final tag in tags) {
      if (kind == EventKind.REACTION ||
          kind == EventKind.REPOST ||
          kind == EventKind.ZAP) {
        if ((tag.first == 'a' || tag.first == 'e') && tag.length > 1) {
          reply = tag[1];
        }
      } else {
        if (isQuote()) {
          if (tag.first == 'q' && tag.length > 1) {
            reply = tag[1];
          }
        } else {
          if (tag.length > 3 &&
              (tag.first == 'a' || tag.first == 'e') &&
              tag[3] == 'root') {
            root = tag[1];
          } else if (tag.length > 3 && tag.first == 'e' && tag[3] == 'reply') {
            reply = tag[1];
          }
        }
      }
    }

    return reply ?? root;
  }

  String? getCustomEmojiUrl(String emoji) {
    String? url;

    final e = emoji.replaceAll(':', '');

    for (final tag in other) {
      if (tag.first == 'emoji' && tag.length > 2 && tag[1] == e) {
        url = tag[2];
      }
    }

    return url;
  }

  MapEntry<String, bool>? getQtag() {
    MapEntry<String, bool>? q;

    for (final tag in other) {
      if (tag.length >= 2 && tag.first == 'q') {
        if (tag[1].contains(':')) {
          q = MapEntry(tag[1].split(':').last, true);
        } else {
          q = MapEntry(tag[1], false);
        }
      }
    }

    return q;
  }

  DateTime getPublishedAt() {
    DateTime publishedAt =
        DateTime.fromMillisecondsSinceEpoch(createdAt * 1000);

    for (var tag in tags) {
      if (tag.first == 'published_at' && tag.length >= 2) {
        publishedAt = DateTime.fromMillisecondsSinceEpoch(
          int.tryParse(tag[1]) ?? createdAt * 1000,
        );
      }
    }

    return publishedAt;
  }

  String getNEvent() {
    return Nip19.encodeShareableEntity(
      'nevent',
      id,
      [],
      pubkey,
      kind,
    );
  }

  List<String> currentPtags() => getTags(pTags, 'p');

  // ============================================================================
  // BOOLEAN CHECK METHODS
  // ============================================================================

  bool isUncensoredNote() {
    bool isUncensoredNote = false;

    for (final tag in lTags) {
      final tagLength = tag.length;

      if (tagLength >= 2 && tag[0] == 'l' && tag[1] == 'UNCENSORED NOTE') {
        isUncensoredNote = true;
      }
    }

    return isUncensoredNote;
  }

  bool isUnRate() {
    bool hasEncryption = false;

    for (final tag in other) {
      if (tag.first == 'yaki_flash_news' && tag.length > 1) {
        hasEncryption = true;
      }
    }

    return hasEncryption && kind == EventKind.REACTION;
  }

  bool isQuote() {
    if (kind == EventKind.TEXT_NOTE) {
      for (final tag in other) {
        if (tag.first == 'q' && tag.length >= 2) {
          return true;
        }
      }

      return false;
    } else {
      return false;
    }
  }

  bool isAuthor(EventSigner? signer) => pubkey == signer?.getPublicKey();

  // ============================================================================
  // SERIALIZATION METHODS
  // ============================================================================

  /// Serialize an event in JSON
  Map<String, dynamic> toJson() => {
        'id': id,
        'pubkey': pubkey,
        'created_at': createdAt,
        'kind': kind,
        'tags': tags,
        'content': content,
        'sig': sig
      };

  Map<String, dynamic> toDetailedJson() => {
        'id': id,
        'pubkey': pubkey,
        'created_at': createdAt,
        'kind': kind,
        'tags': tags,
        'content': content,
        'sig': sig,
        'currentUser': currentUser,
        'lastUpdated': lastUpdated,
        'seenOn': seenOn,
        'subscriptionId': subscriptionId,
      };

  String toJsonString() => jsonEncode(
        {
          'id': id,
          'pubkey': pubkey,
          'created_at': createdAt,
          'kind': kind,
          'tags': tags,
          'content': content,
          'sig': sig
        },
      );

  /// Serialize to nostr event message
  /// - ["EVENT", event JSON as defined above]
  /// - ["EVENT", subscription_id, event JSON as defined above]
  String serialize() {
    if (subscriptionId != null) {
      return jsonEncode(['EVENT', subscriptionId, toJson()]);
    } else {
      return jsonEncode(['EVENT', toJson()]);
    }
  }

  String serializeAuth() {
    if (subscriptionId != null) {
      return jsonEncode(['AUTH', subscriptionId, toJson()]);
    } else {
      return jsonEncode(['AUTH', toJson()]);
    }
  }

  // ============================================================================
  // STATIC METHODS
  // ============================================================================

  static Event? fromString(String content) {
    try {
      return Event.fromJson(jsonDecode(content));
    } catch (_) {
      return null;
    }
  }

  static List<String> getTags(List<List<String>> list, String tag) {
    List<String> tags = [];

    for (var e in list) {
      if (e.length > 1) {
        var key = e[0];
        var value = e[1];

        if (key == tag) {
          tags.add(value.toString());
        }
      }
    }

    return tags;
  }

  static String? getRelationId(List<String> list, String tag) {
    String? id;

    if (list.length > 3 && list[3] == tag) {
      id = list[1];
    }

    return id;
  }

  static List<String> getEtags(List<List<String>> list, String tag) {
    List<String> tags = [];

    for (var e in list) {
      if (e.length > 3 && e[3] == tag) {
        tags = e;
      }
    }
    return tags;
  }

  // Support for [getEventId]
  static String _processEventId(
    String pubkey,
    int createdAt,
    int kind,
    List<List<String>> tags,
    String content,
  ) {
    List data = [0, pubkey.toLowerCase(), createdAt, kind, tags, content];
    String serializedEvent = json.encode(data);
    Uint8List hash = SHA256Digest()
        .process(Uint8List.fromList(utf8.encode(serializedEvent)));
    return hex.encode(hash);
  }

  static Future<Event?> genEvent({
    int createdAt = 0,
    required int kind,
    required List<List<String>> tags,
    required String content,
    required EventSigner? signer,
    String? subscriptionId,
    bool verify = false,
  }) async {
    try {
      if (signer == null || signer.isGuest()) {
        return null;
      }

      if (createdAt == 0) createdAt = currentUnixTimestampSeconds();

      final id = _processEventId(
        signer.getPublicKey(),
        createdAt,
        kind,
        tags,
        content,
      );

      final ev = Event.partial(
        id: id,
        pubkey: signer.getPublicKey(),
        createdAt: createdAt,
        kind: kind,
        tags: tags,
        content: content,
        subscriptionId: subscriptionId,
        currentUser: signer.getPublicKey(),
        verify: verify,
      );

      await signer.sign(ev);

      if (ev.sig.isNotEmpty) {
        return ev;
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}
