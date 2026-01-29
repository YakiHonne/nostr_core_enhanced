// ignore_for_file: non_constant_identifier_names

import 'package:nostr_core_enhanced/nostr/event.dart';
import 'package:nostr_core_enhanced/utils/spider_util.dart';

class NutzapInformationEvent {
  final String id;
  final String pubkey;
  final Map<String, List<String>> mints;
  final List<String> relays;
  final String? P2PkPubkey;

  NutzapInformationEvent({
    required this.id,
    required this.pubkey,
    required this.mints,
    required this.relays,
    this.P2PkPubkey,
  });

  factory NutzapInformationEvent.fromEvent(Event event) {
    logger.i(event.toJson());
    final mints = <String, List<String>>{};
    final relays = <String>[];
    String? p2pkPubkey;

    for (final tag in event.tags) {
      if (tag.isEmpty) continue;

      final key = tag[0];
      if (key == 'mint' && tag.length > 1) {
        final url = tag[1];
        final units = tag.length > 2 ? tag.sublist(2) : <String>[];
        mints[url] = units;
      } else if (key == 'relay' && tag.length > 1) {
        relays.add(tag[1]);
      } else if (key == 'pubkey' && tag.length > 1) {
        p2pkPubkey = tag[1];
      }
    }

    return NutzapInformationEvent(
      id: event.id,
      pubkey: event.pubkey,
      mints: mints,
      relays: relays,
      P2PkPubkey: p2pkPubkey,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pubkey': pubkey,
      'mints': mints,
      'relays': relays,
      'p2pkPubkey': P2PkPubkey,
    };
  }
}
