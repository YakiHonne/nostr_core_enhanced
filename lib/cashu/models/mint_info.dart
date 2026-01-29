import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:nostr_core_enhanced/db/drift_database.dart';

import '../business/mint/mint_helper.dart';
import '../utils/tools.dart';

class NutsSupportInfo {
  NutsSupportInfo({
    required this.nutNum,
    this.methods = const [],
    this.supported = true,
    this.disabled = false,
  });

  static Set<int> get mandatoryNut => {0, 1, 2, 3, 4, 5, 6};

  final int nutNum;
  final List<Map<String, dynamic>> methods;
  final bool supported;
  final bool disabled;

  factory NutsSupportInfo.fromServerJson(String nutNum, Map json) {
    final methods = <Map<String, dynamic>>[];
    final methodsRaw = json['methods'];
    if (methodsRaw is List) {
      final methodList = [...methodsRaw];
      for (var method in methodList) {
        if (method is Map) {
          methods.add(Map<String, dynamic>.from(method));
        }
      }
    }

    final supported = Tools.getValueAs(json, 'supported', true);
    final disabled = Tools.getValueAs(json, 'disabled', false);

    return NutsSupportInfo(
      nutNum: int.tryParse(nutNum) ?? 0,
      methods: methods,
      supported: supported,
      disabled: disabled,
    );
  }

  @override
  String toString() {
    return '${super.toString()}, nutNum: $nutNum, methods: $methods, supported: $supported, disabled: $disabled';
  }
}

class MintInfo {
  MintInfo({
    required String mintURL,
    required this.name,
    required this.iconUrl,
    required this.pubkey,
    required this.version,
    required this.description,
    required this.descriptionLong,
    required this.contact,
    required this.motd,
    Map nutsRaw = const {},
  }) : mintURL = MintHelper.getMintURL(mintURL) {
    // Nuts
    nutsRaw.forEach((key, value) {
      if (value is Map) {
        nuts[key.toString()] = value;
      }
    });
    nuts.forEach((key, value) {
      nutsInfo.add(NutsSupportInfo.fromServerJson(key, value));
    });
    nutsInfo.sort((a, b) => a.nutNum - b.nutNum);
  }

  final String mintURL;
  final String iconUrl;
  final String name;
  final String pubkey;
  final String version;
  final String description;
  final String descriptionLong;
  final List<Map<String, String>> contact;

  final String motd;

  Map<String, Map> nuts = {};
  List<NutsSupportInfo> nutsInfo = [];

  List<String> get units {
    List<String> units = [];
    final nut04 = nutsInfo.where((e) => e.nutNum == 4).toList();
    if (nut04.isNotEmpty) {
      final methods = nut04.first.methods;
      for (final m in methods) {
        if (m['unit'] is String) {
          units.add(m['unit']);
        }
      }
    }
    return units;
  }

  factory MintInfo.fromServerMap(Map json, String mintURL) {
    var nuts = <String, dynamic>{};
    final nutsRaw = json['nuts'];

    if (nutsRaw is Map) {
      nuts = Map<String, dynamic>.from(nutsRaw);
    } else if (nutsRaw is List) {
      nuts = nutsRaw.fold(<String, Map<String, dynamic>>{}, (pre, e) {
        pre[e] = {};
        return pre;
      });
    }

    return MintInfo(
      mintURL: mintURL,
      iconUrl: Tools.getValueAs(json, 'icon_url', ''),
      name: Tools.getValueAs(json, 'name', ''),
      pubkey: Tools.getValueAs(json, 'pubkey', ''),
      version: Tools.getValueAs(json, 'version', ''),
      description: Tools.getValueAs(json, 'description', ''),
      descriptionLong: Tools.getValueAs(json, 'description_long', ''),
      contact: (json['contact'] as List? ?? [])
          .map((e) => Map<String, String>.from(e))
          .toList(),
      motd: Tools.getValueAs(json, 'motd', ''),
      nutsRaw: nuts,
    );
  }

  @override
  String toString() {
    return '${super.toString()}, name: $name, pubkey: $pubkey, version: $version';
  }

  Map<String, Object?> toMap() => {
        'mintURL': mintURL,
        'iconUrl': iconUrl,
        'name': name,
        'pubkey': pubkey,
        'version': version,
        'description': description,
        'descriptionLong': descriptionLong,
        'contact': contact,
        'motd': motd,
        'nutsJson': json.encode(nuts),
      };

  static MintInfo fromMap(Map<String, Object?> map) {
    var nutsRaw = {};

    try {
      nutsRaw = json.decode(Tools.getValueAs(map, 'nutsJson', ''));
    } catch (_) {}

    return MintInfo(
      mintURL: Tools.getValueAs(map, 'mintURL', ''),
      iconUrl: Tools.getValueAs(map, 'iconUrl', ''),
      name: Tools.getValueAs(map, 'name', ''),
      pubkey: Tools.getValueAs(map, 'pubkey', ''),
      version: Tools.getValueAs(map, 'version', ''),
      description: Tools.getValueAs(map, 'description', ''),
      descriptionLong: Tools.getValueAs(map, 'descriptionLong', ''),
      contact: Tools.getValueAs(map, 'contact', []),
      motd: Tools.getValueAs(map, 'motd', ''),
      nutsRaw: nutsRaw,
    );
  }

  static String? tableName() {
    return "MintInfo";
  }

  static List<String?> primaryKey() {
    return ['mintURL'];
  }

  static List<String?> ignoreKey() {
    return ['contact, nuts'];
  }
}

extension MintInfoDriftExtension on MintInfo {
  /// Convert MintInfo model to Drift table companion for inserting/updating
  CashuMintInfoTableCompanion toCompanion() {
    return CashuMintInfoTableCompanion.insert(
      mintURL: mintURL,
      iconUrl: Value(iconUrl),
      name: Value(name),
      pubkey: Value(pubkey),
      version: Value(version),
      description: Value(description),
      descriptionLong: Value(descriptionLong),
      contact: contact,
      motd: Value(motd),
      nutsJson: Value(json.encode(nuts)),
    );
  }

  /// Create MintInfo model from Drift table data
  static MintInfo fromTableData(CashuMintInfoTableData data) {
    return MintInfo.fromMap({
      'mintURL': data.mintURL,
      'iconUrl': data.iconUrl,
      'name': data.name,
      'pubkey': data.pubkey,
      'version': data.version,
      'description': data.description,
      'descriptionLong': data.descriptionLong,
      'contact': data.contact,
      'motd': data.motd,
      'nutsJson': data.nutsJson,
    });
  }
}
