// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:nostr_core_enhanced/db/drift_database.dart';
import 'package:nostr_core_enhanced/nostr/nostr.dart';
import 'package:nostr_core_enhanced/utils/utils.dart';
import 'package:string_validator/string_validator.dart';

class Metadata extends Equatable {
  final String pubkey;
  final String name;
  final String displayName;
  final String picture;
  final String banner;
  final String website;
  final String about;
  final String nip05;
  final String lud16;
  final String lud06;
  final int createdAt;
  final bool isDeleted;
  final int? refreshedTimestamp;

  const Metadata({
    required this.pubkey,
    required this.name,
    required this.displayName,
    required this.picture,
    required this.banner,
    required this.website,
    required this.about,
    required this.nip05,
    required this.lud16,
    required this.lud06,
    required this.createdAt,
    required this.isDeleted,
    this.refreshedTimestamp,
  });

  factory Metadata.fromMetadataTableData(MetadataTableData data) {
    return Metadata(
      pubkey: data.pubkey,
      name: data.name,
      displayName: data.displayName,
      picture: data.picture,
      banner: data.banner,
      website: data.website,
      about: data.about,
      nip05: data.nip05,
      lud16: data.lud16,
      lud06: data.lud06,
      createdAt: data.createdAt,
      isDeleted: data.isDeleted,
      refreshedTimestamp: data.refreshedTimestamp,
    );
  }

  factory Metadata.fromMap(
    Map<String, dynamic> map, {
    String? pubkey,
    List<List<String>>? tags,
    int? createdAt,
  }) {
    final name = map['name'] as String? ?? '';
    final displayName = map['display_name'] as String? ?? '';

    return Metadata(
      pubkey: pubkey ?? '',
      name: name.isEmpty ? displayName : name,
      displayName: displayName,
      about: map['about'] as String? ?? '',
      picture: map['picture'] as String? ?? '',
      banner: map['banner'] as String? ?? '',
      website: map['website'] as String? ?? '',
      nip05: map['nip05'] is String? ? map['nip05'] as String? ?? '' : '',
      lud16: map['lud16'] as String? ?? '',
      lud06: map['lud06'] as String? ?? '',
      createdAt: createdAt ?? DateTime.now().toSecondsSinceEpoch(),
      isDeleted: map['deleted'] is String?
          ? (map['deleted'] as String?) == 'true'
              ? true
              : false
          : map['deleted'] as bool? ?? false,
    );
  }

  String? get cleanNip05 {
    if (nip05.trim().isEmpty) {
      return null;
    }

    if (nip05.startsWith("_@")) {
      return nip05.trim().toLowerCase().replaceAll("_@", "@");
    }

    return nip05.trim().toLowerCase();
  }

  Map<String, dynamic> toFullJson() {
    var data = toMap();
    data['pub_key'] = pubkey;

    return data;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['display_name'] = displayName;
    data['picture'] = picture;
    data['banner'] = banner;
    data['website'] = website;
    data['about'] = about;
    data['nip05'] = nip05;
    data['lud16'] = lud16;
    data['lud06'] = lud06;
    data['is_deleted'] = isDeleted;

    return data;
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory Metadata.empty() {
    return const Metadata(
      picture: '',
      name: '',
      about: '',
      pubkey: '',
      banner: '',
      displayName: '',
      lud16: '',
      nip05: '',
      lud06: '',
      website: '',
      isDeleted: false,
      createdAt: 968739627,
    );
  }

  static Metadata? fromEvent(Event event) {
    try {
      return Metadata.fromMap(
        jsonDecode(event.content),
        createdAt: event.createdAt,
        pubkey: event.pubkey,
        tags: event.tags,
      );
    } catch (_) {
      return null;
    }
  }

  Future<Event?> toEvent(EventSigner signer) async {
    return await Event.genEvent(
      signer: signer,
      content: jsonEncode(toJson()),
      kind: EventKind.METADATA,
      tags: [],
    );
  }

  String getName() {
    if (Helpers.isNotBlank(name)) {
      return name;
    }

    if (Helpers.isNotBlank(displayName)) {
      return displayName;
    }

    final pub = Nip19.encodePubkey(pubkey);

    final p = pub.length <= 7
        ? pub
        : '${pub.substring(1, 7)}...${pub.substring(pub.length - 7, pub.length)}';

    return p;
  }

  String getDisplayName() {
    if (Helpers.isNotBlank(displayName)) {
      return displayName;
    }

    if (Helpers.isNotBlank(name)) {
      return name;
    }

    final pub = Nip19.encodePubkey(pubkey);

    final p = pub.length <= 7
        ? pub
        : '${pub.substring(1, 7)}...${pub.substring(pub.length - 7, pub.length)}';

    return p;
  }

  String? getLightningAddress() {
    String? lightingAddress;

    if (lud16.isNotEmpty) {
      if (isEmail(lud16)) {
        lightingAddress = lud16;
      } else if (lud06.toLowerCase().startsWith('lnurl')) {
        lightingAddress = Zap.getLud16FromLud06(lud16);
      }
    }

    if (lud06.isNotEmpty && lightingAddress == null) {
      if (isEmail(lud06)) {
        lightingAddress = lud06;
      } else if (lud06.toLowerCase().startsWith('lnurl')) {
        lightingAddress = Zap.getLud16FromLud06(lud06);
      }
    }

    return lightingAddress;
  }

  bool isMetadataDeleted() {
    return isDeleted;
  }

  bool matchesSearch(String str) {
    str = str.trim().toLowerCase();
    String d = displayName.toLowerCase();
    String n = name.toLowerCase();
    String str2 = " $str";
    return d.startsWith(str) ||
        d.contains(str2) ||
        n.startsWith(str) ||
        n.contains(str2);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Metadata &&
          runtimeType == other.runtimeType &&
          pubkey == other.pubkey;

  @override
  int get hashCode => pubkey.hashCode;

  Metadata copyWith({
    String? pubkey,
    String? name,
    String? displayName,
    String? picture,
    String? banner,
    String? website,
    String? about,
    String? nip05,
    String? lud16,
    String? lud06,
    int? createdAt,
    bool? isDeleted,
    int? refreshedTimestamp,
  }) {
    return Metadata(
      pubkey: pubkey ?? this.pubkey,
      name: name ?? this.name,
      displayName: displayName ?? this.displayName,
      picture: picture ?? this.picture,
      banner: banner ?? this.banner,
      website: website ?? this.website,
      about: about ?? this.about,
      nip05: nip05 ?? this.nip05,
      lud16: lud16 ?? this.lud16,
      lud06: lud06 ?? this.lud06,
      createdAt: createdAt ?? this.createdAt,
      isDeleted: isDeleted ?? this.isDeleted,
      refreshedTimestamp: refreshedTimestamp,
    );
  }

  @override
  List<dynamic> get props => [
        pubkey,
        name,
        displayName,
        picture,
        banner,
        website,
        about,
        nip05,
        lud16,
        lud06,
        createdAt,
        isDeleted,
      ];
}
