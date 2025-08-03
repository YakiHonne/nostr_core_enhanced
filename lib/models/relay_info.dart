// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class RelayInfo {
  final String name;

  final String description;

  /// Nostr public key of the relay admin
  final String pubKey;

  /// Alternative contact of the relay admin
  final String contact;

  /// Supported NIPS
  final List<dynamic> nips;

  /// Software description
  final String software;

  /// Relay icon
  final String icon;

  /// Relay software version identifier
  final String version;

  final String url;

  RelayInfo({
    required this.name,
    required this.description,
    required this.pubKey,
    required this.contact,
    required this.nips,
    required this.software,
    required this.icon,
    required this.version,
    required this.url,
  });

  RelayInfo._(
    this.url,
    this.name,
    this.description,
    this.pubKey,
    this.contact,
    this.nips,
    this.software,
    this.version,
    this.icon,
  );

  factory RelayInfo.fromJson(
      Map<dynamic, dynamic> json, String uri, String url) {
    final String name = json["name"] ?? '';
    final String description = json["description"] ?? "";
    final String pubKey = json["pubkey"] ?? "";
    final String contact = json["contact"] ?? "";
    String icon;
    if (json["icon"] != null) {
      icon = json["icon"];
    } else {
      icon = "$uri${uri.endsWith("/") ? "" : "/"}favicon.ico";
    }
    final List<dynamic> nips = json["supported_nips"] ?? [];
    final String software = json["software"] ?? "";
    final String version = json["version"] ?? "";
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
    );
  }

  static Future<RelayInfo?> get(String url) async {
    Uri uri = Uri.parse(url).replace(scheme: 'https');

    try {
      final response = await http.get(
        uri,
        headers: {'Accept': 'application/nostr+json'},
      );

      final decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map;

      return RelayInfo.fromJson(decodedResponse, uri.toString(), url);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'pubKey': pubKey,
      'contact': contact,
      'nips': nips,
      'software': software,
      'icon': icon,
      'version': version,
      'url': url,
    };
  }

  factory RelayInfo.fromMap(Map<String, dynamic> map) {
    return RelayInfo(
      name: map['name'] as String,
      description: map['description'] as String,
      pubKey: map['pubKey'] as String,
      contact: map['contact'] as String,
      nips: List<dynamic>.from((map['nips'] as List<dynamic>)),
      software: map['software'] as String,
      icon: map['icon'] as String,
      version: map['version'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());
}
