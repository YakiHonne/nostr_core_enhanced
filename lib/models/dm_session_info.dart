// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:nostr_core_enhanced/db/drift_database.dart';

class DMSessionInfo {
  final String id;
  final String peerPubkey;
  final String ownPubkey;
  final int readTime;

  factory DMSessionInfo.fromDmSessionInfosTableData(
    DmSessionInfosTableData data,
  ) {
    return DMSessionInfo(
      id: data.dmSessionId,
      peerPubkey: data.peer,
      ownPubkey: data.pubkey,
      readTime: data.readMessageTime ?? 0,
    );
  }

  DMSessionInfo({
    required this.id,
    required this.peerPubkey,
    required this.ownPubkey,
    required this.readTime,
  });

  DMSessionInfo copyWith({
    String? id,
    String? peerPubkey,
    String? ownPubkey,
    int? readTime,
  }) {
    return DMSessionInfo(
      id: id ?? this.id,
      peerPubkey: peerPubkey ?? this.peerPubkey,
      ownPubkey: ownPubkey ?? this.ownPubkey,
      readTime: readTime ?? this.readTime,
    );
  }
}
