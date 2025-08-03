// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:nostr_core_enhanced/nostr/nostr.dart';
import 'package:nostr_core_enhanced/utils/utils.dart';

class DvmModel {
  final String id;
  final String pubkey;
  final DvmType dvmType;
  final bool enabled;

  DvmModel({
    required this.id,
    required this.pubkey,
    required this.dvmType,
    required this.enabled,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'pubkey': pubkey,
      'dvmType': dvmType.name,
      'enabled': enabled,
    };
  }

  factory DvmModel.fromMap(Map<String, dynamic> map) {
    return DvmModel(
      id: map['id'] as String,
      pubkey: map['pubkey'] as String,
      enabled: map['enabled'] as bool,
      dvmType: DvmType.values.firstWhere(
        (element) => element.name == map['dvmType'],
        orElse: () => DvmType.notesContent,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory DvmModel.fromJson(String source) =>
      DvmModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class DvmMetadata {
  final String pubkey;
  final String title;
  final String description;
  final String thumbnail;
  final int kind;
  final List<String> relays;
  final String alt;

  DvmMetadata({
    required this.pubkey,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.kind,
    required this.relays,
    required this.alt,
  });

  factory DvmMetadata.fromEvent(Event event) {
    String title = '';
    String description = '';
    String thumbnail = '';
    String alt = '';
    String pubkey = event.pubkey;
    int kind = event.kind;
    List<String> relays = [];

    if (event.content.isNotEmpty) {
      final content = jsonDecode(event.content);

      title = content['name'] ?? '';
      description = content['about'] ?? '';
      thumbnail = content['picture'] ?? '';
    }

    for (final tag in event.tags) {
      if (tag.isNotEmpty) {
        if (tag[0] == 'relays' && tag.length >= 2) {
          relays.addAll(tag.sublist(1));
        } else if (tag[0] == 'alt' && tag.length >= 2) {
          alt = tag[1];
        }
      }
    }

    return DvmMetadata(
      pubkey: pubkey,
      title: title.isEmpty ? alt : title,
      description: description,
      thumbnail: thumbnail,
      kind: kind,
      alt: alt,
      relays: relays,
    );
  }

  factory DvmMetadata.empty(String pubkey) {
    return DvmMetadata(
      description: '',
      kind: EventKind.DVM_CONTENT_FEED,
      pubkey: pubkey,
      thumbnail: '',
      title: '',
      relays: [],
      alt: '',
    );
  }
}
