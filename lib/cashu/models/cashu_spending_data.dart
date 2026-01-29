import 'package:nostr_core_enhanced/db/drift_database.dart';
import 'package:nostr_core_enhanced/nostr/event.dart';
import 'package:nostr_core_enhanced/utils/enums.dart';

class CashuSpendingData {
  final String id;
  final String pubkey;
  final int createdAt;
  final int kind;
  final List<List<String>> tags;
  final List<List<String>> content;

  CashuSpendingData({
    required this.id,
    required this.pubkey,
    required this.createdAt,
    required this.kind,
    required this.tags,
    required this.content,
  });

  String get senderPubkey {
    for (final tag in tags) {
      if (tag[0] == 'p' && tag.length >= 2) {
        return tag[1];
      }
    }
    return '';
  }

  String get amount {
    for (final tag in content) {
      if (tag[0] == 'amount' && tag.length > 1) {
        return tag[1];
      }
    }
    return '';
  }

  String get unit {
    for (final tag in content) {
      if (tag[0] == 'unit' && tag.length > 1) {
        return tag[1];
      }
    }
    return '';
  }

  CashuSpendingDirection get direction {
    for (final tag in content) {
      if (tag[0] == 'direction' && tag.length > 1) {
        return tag[1] == 'in'
            ? CashuSpendingDirection.incoming
            : CashuSpendingDirection.outgoing;
      }
    }
    return CashuSpendingDirection.outgoing;
  }

  Map<String, CashuTokenStatus> get hiddenTokens {
    Map<String, CashuTokenStatus> hiddenTokens = {};
    for (final item in content) {
      if (item.length == 2 &&
          (item[1] == 'created' || item[1] == 'destroyed')) {
        try {
          hiddenTokens[item[0]] = CashuTokenStatus.values.firstWhere(
            (element) => element.name == item[1],
          );
        } catch (_) {}
      }
    }

    return hiddenTokens;
  }

  Map<String, CashuTokenStatus> get tagsTokens {
    Map<String, CashuTokenStatus> tagsTokens = {};
    for (final tag in tags) {
      if (tag[0] == 'e' && tag.length >= 4) {
        try {
          tagsTokens[tag[1]] = CashuTokenStatus.values.firstWhere(
            (element) => element.name == tag[3],
          );
        } catch (_) {}
      }
    }

    return tagsTokens;
  }

  Map<String, CashuTokenStatus> get tokenStates => {
        ...hiddenTokens,
        ...tagsTokens,
      };

  factory CashuSpendingData.fromEventMap({
    required Event event,
    required List<dynamic> content,
    required List<List<String>> tags,
  }) {
    return CashuSpendingData(
      id: event.id,
      tags: tags,
      kind: event.kind,
      content: content.map((e) => List<String>.from(e)).toList(),
      pubkey: event.pubkey,
      createdAt: event.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pubkey': pubkey,
      'createdAt': createdAt,
      'kind': kind,
      'content': content,
      'tags': tags,
    };
  }
}

extension CashuSpendingDataDriftHelper on CashuSpendingData {
  CashuSpendingTableCompanion toCompanion() {
    return CashuSpendingTableCompanion.insert(
      id: id,
      pubkey: pubkey,
      createdAt: createdAt,
      kind: kind,
      content: content,
      tags: tags,
    );
  }

  static CashuSpendingData fromTableData(CashuSpendingTableData data) {
    return CashuSpendingData(
      id: data.id,
      pubkey: data.pubkey,
      createdAt: data.createdAt,
      kind: data.kind,
      content: data.content,
      tags: data.tags,
    );
  }
}
