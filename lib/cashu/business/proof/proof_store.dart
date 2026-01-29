import 'package:nostr_core_enhanced/cashu/business/wallet/cashu_manager.dart';
import 'package:nostr_core_enhanced/cashu/models/proof.dart';

class ProofStore {
  static Future<List<Proof>> getProofs({
    required String mintURL,
    List<String> ids = const [],
    String c = '',
  }) async {
    final cm = CashuManager.shared;
    final pubkey = cm.pubkey;
    final db = cm.db;

    final tokens = await db.getCashuTokensByFilter(
      mintURL: mintURL,
      pubkey: pubkey,
    );

    if (tokens.isEmpty) return [];

    final proofs =
        tokens.map((e) => e.proofs).toList().expand((e) => e).toList();

    if (ids.isNotEmpty) {
      return proofs.where((p) => ids.contains(p.keysetId)).toList();
    }

    return proofs;
  }

  static Future<bool> deleteTokensWithProofs(List<Proof> proofs) async {
    final cm = CashuManager.shared;
    final db = cm.db;
    final pubkey = cm.pubkey;

    if (proofs.isEmpty) return true;

    // Get all secrets to identify tokens
    final secrets = proofs.map((e) => e.secret).toSet();

    // Find tokens containing these proofs
    final allTokens = await db.getCashuTokensByFilter(pubkey: pubkey);
    final tokensToDelete = <String>{};

    for (var token in allTokens) {
      if (token.proofs.any((p) => secrets.contains(p.secret))) {
        tokensToDelete.add(token.id);
      }
    }

    if (tokensToDelete.isEmpty) return true;

    // Delete tokens from DB
    await db.removeCashuTokens(tokensToDelete.toList());

    // Also remove the corresponding events
    await db.removeEvents(tokensToDelete.toList());

    return true;
  }

  static Future<bool> addProofs(List<Proof> proofs) async {
    // This is a placeholder/helper. Ideally, proofs are added via Nostr events.
    // If we need to save them locally without an event (e.g. temporary), we'd need a way to wrap them.
    // However, given the architecture, we should probably NOT adjust this manually unless necessary.
    // For now, if this is called, it might be better to log a warning or no-op if we enforce Event-first architecture.
    // But existing code might rely on it.
    // Since proofs must belong to a token data, and token data corresponds to an event,
    // we cannot simply "add proofs" without an event ID.
    return false;
  }
}
