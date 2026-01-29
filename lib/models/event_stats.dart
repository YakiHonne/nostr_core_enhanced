import 'dart:convert';

import 'package:bolt11_decoder/bolt11_decoder.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:nostr_core_enhanced/db/drift_database.dart';
import 'package:nostr_core_enhanced/nostr/nostr.dart';
import 'package:nostr_core_enhanced/utils/utils.dart';

class EventStats extends Equatable {
  const EventStats({
    required this.eventId,
    required this.reactions,
    required this.replies,
    required this.quotes,
    required this.reposts,
    required this.zaps,
    required this.newestCreatedAt,
  });

  final String eventId;
  final Map<String, String> reactions;
  final Map<String, String> replies;
  final Map<String, String> quotes;
  final Map<String, String> reposts;
  final Map<String, Map<String, int>> zaps;
  final int newestCreatedAt;

  EventStatsTableCompanion toCompanion() {
    return EventStatsTableCompanion.insert(
      id: eventId,
      reactions: Value(reactions),
      replies: Value(replies),
      quotes: Value(quotes),
      reposts: Value(reposts),
      zaps: Value(zaps),
      newestCreatedAt: Value(newestCreatedAt),
    );
  }

  factory EventStats.fromEventStatsTableData(EventStatsTableData data) {
    return EventStats(
      eventId: data.id,
      reactions: data.reactions,
      replies: data.replies,
      quotes: data.quotes,
      reposts: data.reposts,
      zaps: data.zaps,
      newestCreatedAt: data.newestCreatedAt ?? 0,
    );
  }

  factory EventStats.empty(String id) {
    return EventStats(
      eventId: id,
      reactions: const {},
      replies: const {},
      quotes: const {},
      reposts: const {},
      zaps: const {},
      newestCreatedAt: 0,
    );
  }

  Map<String, dynamic> getZapsData(List<String> mutes) {
    int total = 0;
    int highestZap = 0;
    String highestZapId = '';
    String highestZapPubkey = '';
    List<Map<String, dynamic>> topZaps = [];

    zaps.forEach(
      (user, groupedZaps) {
        groupedZaps.forEach(
          (zap, value) {
            total += value;

            if (value > highestZap) {
              highestZap = value;
              highestZapId = zap;
              highestZapPubkey = user;
            }

            topZaps.add({
              'value': value,
              'pubkey': user,
            });

            topZaps.sort((a, b) => b['value'].compareTo(a['value']));

            if (topZaps.length > 4) {
              topZaps.removeLast();
            }
          },
        );
      },
    );

    List<String> nextBestPubkeys = [];
    for (int i = 1; i < topZaps.length && i < 4; i++) {
      nextBestPubkeys.add(topZaps[i]['pubkey']);
    }

    return {
      'total': total,
      'highestZap': highestZap,
      'highestZapId': highestZapId,
      'highestZapPubkey': highestZapPubkey,
      'nextBestPubkeys': nextBestPubkeys,
    };
  }

  static Map<String, dynamic> emptyZapData() {
    return {
      'total': 0,
      'highestZap': 0,
      'highestZapId': '',
      'highestZapPubkey': '',
      'nextBestPubkeys': [],
    };
  }

  Map<String, MapEntry<String, int>> getZappersList(List<String> mutes) {
    Map<String, MapEntry<String, int>> zappers = {};

    zaps.forEach(
      (user, groupedZaps) {
        if (!mutes.contains(user) && groupedZaps.isNotEmpty) {
          zappers[user] = MapEntry(
            groupedZaps.keys.first,
            groupedZaps.values.reduce((a, b) => a + b),
          );
        }
      },
    );

    return zappers;
  }

  String? isSelfReaction(String pubkey) {
    final key = reactions.keys.firstWhere(
      (key) => reactions[key] == pubkey,
      orElse: () => '',
    );

    return key.isNotEmpty ? key : null;
  }

  bool isSelfReply(String pubkey) => replies.values.contains(pubkey);
  bool isSelfQuote(String pubkey) => quotes.values.contains(pubkey);
  bool isSelfRepost(String pubkey) => reposts.values.contains(pubkey);
  bool isSelfZap(String pubkey) => zaps.keys.contains(pubkey);

  Map<String, String> filteredReactions(List<String> mutes) {
    if (mutes.isNotEmpty) {
      final map = Map<String, String>.from(reactions)
        ..removeWhere(
          (key, value) => mutes.contains(value),
        );

      return map;
    } else {
      return reactions;
    }
  }

  Map<String, String> filteredReplies(
    List<String> mutes,
    List<String> mutesEvents,
  ) {
    if (mutes.isNotEmpty || mutesEvents.isNotEmpty) {
      final map = Map<String, String>.from(replies)
        ..removeWhere(
          (key, value) => mutes.contains(value) || mutesEvents.contains(key),
        );

      return map;
    } else {
      return replies;
    }
  }

  Map<String, String> filteredReposts(List<String> mutes) {
    if (mutes.isNotEmpty) {
      final map = Map<String, String>.from(reposts)
        ..removeWhere(
          (key, value) => mutes.contains(value),
        );

      return map;
    } else {
      return reposts;
    }
  }

  Map<String, String> filteredQuotes(List<String> mutes) {
    if (mutes.isNotEmpty) {
      final map = Map<String, String>.from(quotes)
        ..removeWhere(
          (key, value) => mutes.contains(value),
        );

      return map;
    } else {
      return quotes;
    }
  }

  Map<String, Map<String, int>> filteredZap(List<String> mutes) {
    if (mutes.isNotEmpty) {
      final map = Map<String, Map<String, int>>.from(zaps)
        ..removeWhere(
          (key, value) => mutes.contains(key),
        );

      return map;
    } else {
      return zaps;
    }
  }

  bool hasZapId(String id) {
    return zaps.values.any((element) => element[id] != null);
  }

  EventStats addEvent(Event ev) {
    if (ev.kind == EventKind.REACTION && !reactions.containsKey(ev.id)) {
      return copyWith(
        reactions: Map<String, String>.from(reactions)
          ..addAll({ev.id: ev.pubkey}),
      );
    } else if (ev.kind == EventKind.TEXT_NOTE) {
      if (ev.isQuote() && !quotes.containsKey(ev.id)) {
        return copyWith(
          quotes: Map<String, String>.from(quotes)..addAll({ev.id: ev.pubkey}),
        );
      } else {
        for (final tags in ev.tags) {
          if (canAddNote(tags, eventId)) {
            return copyWith(
              replies: Map<String, String>.from(replies)
                ..addAll({ev.id: ev.pubkey}),
            );
          }
        }
      }
    } else if (ev.kind == EventKind.REPOST && !reposts.containsKey(ev.id)) {
      return copyWith(
        reposts: Map<String, String>.from(reposts)..addAll({ev.id: ev.pubkey}),
      );
    } else if (ev.kind == EventKind.ZAP && !hasZapId(ev.id)) {
      final p = getZapPubkey(ev.tags).first;
      final zp = p.isNotEmpty ? p : ev.pubkey;
      final newZaps = Map<String, Map<String, int>>.from(zaps);
      newZaps[zp] = {...zaps[zp] ?? {}, ev.id: getZapEvent(ev).toInt()};

      return copyWith(
        zaps: newZaps,
      );
    }

    return this;
  }

  EventStats addOptimisticZap({
    required String zapId,
    required String zapperPubkey,
    required int amount,
  }) {
    final newZaps = Map<String, Map<String, int>>.from(zaps);
    newZaps[zapperPubkey] = {
      ...zaps[zapperPubkey] ?? {},
      zapId: amount,
    };

    return copyWith(
      zaps: newZaps,
    );
  }

// Helper method to check if a zap ID is temporary
  bool isOptimisticZap(String zapId) => zapId.startsWith('temp_');

// Method to replace optimistic zap with real one
  EventStats replaceOptimisticZap({
    required String tempZapId,
    required Event realZapEvent,
  }) {
    final newZaps = Map<String, Map<String, int>>.from(zaps);

    for (final entry in newZaps.entries) {
      if (entry.value.containsKey(tempZapId)) {
        entry.value.remove(tempZapId);
        break;
      }
    }

    // Add the real zap using existing logic
    final realZapperPubkey = getZapPubkey(realZapEvent.tags).first.isNotEmpty
        ? getZapPubkey(realZapEvent.tags).first
        : realZapEvent.pubkey;

    newZaps[realZapperPubkey] = {
      ...newZaps[realZapperPubkey] ?? {},
      realZapEvent.id: getZapEvent(realZapEvent).toInt(),
    };

    return copyWith(
      zaps: newZaps,
    );
  }

  EventStats addEvents(List<Event> events) {
    final updatedReactions = Map<String, String>.from(reactions);
    final updatedReplies = Map<String, String>.from(replies);
    final updatedReposts = Map<String, String>.from(reposts);
    final updatedQuotes = Map<String, String>.from(quotes);
    final updatedZaps = Map<String, Map<String, int>>.from(zaps);
    int createdAt = newestCreatedAt;

    for (final ev in events) {
      if (ev.kind == EventKind.REACTION && !reactions.containsKey(ev.id)) {
        updatedReactions[ev.id] = ev.pubkey;
        createdAt = getNewestCreatedAt(ev.createdAt);
      } else if (ev.kind == EventKind.TEXT_NOTE) {
        if (ev.isQuote() && !quotes.containsKey(ev.id)) {
          updatedQuotes[ev.id] = ev.pubkey;
          createdAt = getNewestCreatedAt(ev.createdAt);
        } else {
          for (final tags in ev.tags) {
            if (canAddNote(tags, eventId)) {
              updatedReplies[ev.id] = ev.pubkey;
              createdAt = getNewestCreatedAt(ev.createdAt);
            }
          }
        }
      } else if (ev.kind == EventKind.REPOST && !reposts.containsKey(ev.id)) {
        updatedReposts[ev.id] = ev.pubkey;
        createdAt = getNewestCreatedAt(ev.createdAt);
      } else if (ev.kind == EventKind.ZAP && !hasZapId(ev.id)) {
        final p = getZapPubkey(ev.tags).first;
        final zp = p.isNotEmpty ? p : ev.pubkey;
        final amount = getZapEvent(ev).toInt();

        updatedZaps[zp] = {...updatedZaps[zp] ?? {}, ev.id: amount};
        createdAt = getNewestCreatedAt(ev.createdAt);
      }
    }

    return copyWith(
      reactions: updatedReactions,
      newestCreatedAt: createdAt,
      quotes: updatedQuotes,
      replies: updatedReplies,
      zaps: updatedZaps,
      reposts: updatedReposts,
    );
  }

  EventStats removeReaction(String eventId) {
    final updatedReactions = Map<String, String>.from(reactions)
      ..remove(eventId);

    return copyWith(
      reactions: updatedReactions,
    );
  }

  EventStats removeRepost(String eventId) {
    final updatedReposts = Map<String, String>.from(reposts)..remove(eventId);

    return copyWith(
      reposts: updatedReposts,
    );
  }

  EventStats removeReply(String eventId) {
    final updatedReplies = Map<String, String>.from(replies)..remove(eventId);

    return copyWith(
      replies: updatedReplies,
    );
  }

  double getZapEvent(Event event) {
    try {
      final ZapReceipt receipt = Nip57.getZapReceipt(event);
      final Bolt11PaymentRequest req = Bolt11PaymentRequest(receipt.bolt11);

      return (req.amount.toDouble() * 100000000).round().toDouble();
    } catch (_) {
      return 0;
    }
  }

  int getNewestCreatedAt(int createdAt) {
    if (createdAt > newestCreatedAt) {
      return createdAt;
    } else {
      return newestCreatedAt;
    }
  }

  List<String> getZapPubkey(List<List<String>> tags) {
    String? zapRequestEventStr;
    String senderPubkey = '';
    String content = '';

    for (final tag in tags) {
      if (tag.length > 1 && tag[0] == 'description') {
        zapRequestEventStr = tag[1];
      }
    }

    if (zapRequestEventStr != null && zapRequestEventStr.isNotEmpty) {
      try {
        final eventJson = jsonDecode(zapRequestEventStr);
        final zapRequestEvent = Event.fromJson(eventJson);
        senderPubkey = zapRequestEvent.pubkey;
        content = zapRequestEvent.content;
      } catch (e) {
        senderPubkey =
            SpiderUtil.subUntil(zapRequestEventStr, 'pubkey":"', '"');
      }
    }

    return [senderPubkey, content];
  }

  bool canAddNote(List<String> tag, String noteId) {
    return (tag.first == 'e' || tag.first == 'a') &&
        tag.length > 3 &&
        (tag[3] == 'root' || tag[3] == 'reply') &&
        tag[3] != 'mention' &&
        tag[1] == noteId;
  }

  EventStats copyWith({
    String? eventId,
    Map<String, String>? reactions,
    Map<String, String>? replies,
    Map<String, String>? quotes,
    Map<String, String>? reposts,
    Map<String, Map<String, int>>? zaps,
    int? newestCreatedAt,
  }) {
    return EventStats(
      eventId: eventId ?? this.eventId,
      reactions:
          reactions != null ? Map.from(reactions) : Map.from(this.reactions),
      replies: replies != null ? Map.from(replies) : Map.from(this.replies),
      quotes: quotes != null ? Map.from(quotes) : Map.from(this.quotes),
      reposts: reposts != null ? Map.from(reposts) : Map.from(this.reposts),
      zaps: zaps != null ? Map.from(zaps) : Map.from(this.zaps),
      newestCreatedAt: newestCreatedAt ?? this.newestCreatedAt,
    );
  }

  @override
  List<Object?> get props => [
        eventId,
        reactions,
        replies,
        quotes,
        reposts,
        zaps,
        newestCreatedAt,
      ];
}
