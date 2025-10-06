// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nostr_core_enhanced/db/drift_database.dart';

class RelayInfo extends Equatable {
  final String name;

  final String description;

  /// Nostr public key of the relay admin
  final String pubkey;

  /// Alternative contact of the relay admin
  final String contact;

  /// Supported NIPS
  final List<String> nips;

  /// Software description
  final String software;

  /// Relay icon
  final String icon;

  /// Relay software version identifier
  final String version;

  final String url;

  final String location;

  final String latency;

  final bool isPaid;

  final bool isAuth;

  final int lastUpdated;

  factory RelayInfo.fromRelayInfoListTableData(RelayInfoListTableData data) {
    return RelayInfo(
      name: data.name,
      description: data.description,
      pubkey: data.pubkey,
      contact: data.contact,
      nips: data.nips,
      software: data.software,
      icon: data.icon,
      version: data.version,
      url: data.url,
      location: data.location,
      latency: data.latency,
      isPaid: data.isPaid,
      isAuth: data.isAuth,
      lastUpdated: data.lastUpdated,
    );
  }

  RelayInfoListTableCompanion toCompanion() {
    return RelayInfoListTableCompanion.insert(
      pubkey: pubkey,
      name: name,
      contact: contact,
      description: description,
      icon: icon,
      isAuth: isAuth,
      isPaid: isPaid,
      lastUpdated: lastUpdated,
      location: location,
      nips: Value(nips),
      software: software,
      latency: latency,
      url: url,
      version: version,
    );
  }

  const RelayInfo({
    required this.name,
    required this.description,
    required this.pubkey,
    required this.contact,
    required this.nips,
    required this.software,
    required this.icon,
    required this.version,
    required this.url,
    required this.location,
    required this.latency,
    required this.isPaid,
    required this.isAuth,
    required this.lastUpdated,
  });

  const RelayInfo._(
    this.url,
    this.name,
    this.description,
    this.pubkey,
    this.contact,
    this.nips,
    this.software,
    this.version,
    this.icon,
    this.isAuth,
    this.isPaid,
    this.lastUpdated,
    this.location,
    this.latency,
  );

  factory RelayInfo.fromJson(
    Map<dynamic, dynamic> json,
    String uri,
    String url,
  ) {
    final String name = json["name"] ?? '';
    final String description = json["description"] ?? "";
    final String pubKey = json["pubkey"] ?? "";
    final String contact = json["contact"] ?? "";
    String icon;
    final uriParsed = Uri.parse(uri);
    final usedUri = uriParsed.origin;

    if (json["icon"] != null) {
      icon = json["icon"];
    } else {
      icon = "$usedUri${usedUri.endsWith("/") ? "" : "/"}favicon.ico";
    }

    final isList = json["supported_nips"] is List;

    final List<String> nips = !isList
        ? <String>[]
        : (json["supported_nips"] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [];
    final software = json["software"] ?? "";
    final version = json["version"] ?? "";
    final isAuth = json["limitation"]?["auth_required"] ?? false;
    final isPaid = json["limitation"]?["payment_required"] ?? false;

    return RelayInfo._(
      url,
      name,
      description,
      pubKey,
      contact,
      nips,
      software,
      version,
      icon,
      isAuth,
      isPaid,
      0,
      '',
      '',
    );
  }

  bool hasStats() {
    return location.isNotEmpty || latency.isNotEmpty || isPaid || isAuth;
  }

  bool hasInfos() {
    return description.isNotEmpty || pubkey.isNotEmpty || version.isNotEmpty;
  }

  static Future<RelayInfo?> get(String url) async {
    Uri uri = Uri.parse(url).replace(scheme: 'https');

    try {
      final response = await http.get(
        uri,
        headers: {'Accept': 'application/nostr+json'},
      ).timeout(
        const Duration(seconds: 2),
        onTimeout: () {
          // You can throw or just return a dummy response.
          throw TimeoutException('RelayInfo.get timed out for $url');
        },
      );

      final decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map;

      return RelayInfo.fromJson(decodedResponse, uri.toString(), url);
    } catch (e) {
      if (kDebugMode) {
        print('RelayInfo.get error ($url): $e');
      }
      return null;
    }
  }

  String getPubkey() {
    if (pubkey.length == 64) {
      return pubkey;
    }

    if (contact.length == 64) {
      return contact;
    }

    return '';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'pubKey': pubkey,
      'contact': contact,
      'nips': nips,
      'software': software,
      'icon': icon,
      'version': version,
      'url': url,
      'location': location,
      'latency': latency,
      'isPaid': isPaid,
      'isAuth': isAuth,
      'lastUpdated': lastUpdated,
    };
  }

  factory RelayInfo.fromMap(Map<String, dynamic> map) {
    return RelayInfo(
      name: map['name'] as String,
      description: map['description'] as String,
      pubkey: map['pubKey'] as String,
      contact: map['contact'] as String,
      nips: List<String>.from((map['nips'] as List)),
      software: map['software'] as String,
      icon: map['icon'] as String,
      version: map['version'] as String,
      url: map['url'] as String,
      location: map['location'] as String? ?? '',
      latency: map['latency'] as String? ?? '',
      isPaid: map['isPaid'] as bool? ?? false,
      isAuth: map['isAuth'] as bool? ?? false,
      lastUpdated: map['lastUpdated'] as int? ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  RelayInfo copyWith({
    String? name,
    String? description,
    String? pubkey,
    String? contact,
    List<String>? nips,
    String? software,
    String? icon,
    String? version,
    String? url,
    String? location,
    String? latency,
    bool? isPaid,
    bool? isAuth,
    int? lastUpdated,
  }) {
    return RelayInfo(
      name: name ?? this.name,
      description: description ?? this.description,
      pubkey: pubkey ?? this.pubkey,
      contact: contact ?? this.contact,
      nips: nips ?? this.nips,
      software: software ?? this.software,
      icon: icon ?? this.icon,
      version: version ?? this.version,
      url: url ?? this.url,
      location: location ?? this.location,
      latency: latency ?? this.latency,
      isPaid: isPaid ?? this.isPaid,
      isAuth: isAuth ?? this.isAuth,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  @override
  List<Object?> get props => [
        name,
        description,
        pubkey,
        contact,
        nips,
        software,
        icon,
        version,
        url,
        location,
        latency,
        isPaid,
        isAuth,
        lastUpdated,
      ];
}
