import 'dart:convert';

import 'package:nostr_core_enhanced/cashu/business/nostr/cashu_nostr_functions.dart';
import 'package:nostr_core_enhanced/cashu/core/dhke_helper.dart';
import 'package:nostr_core_enhanced/cashu/core/mint_actions.dart';
import 'package:nostr_core_enhanced/cashu/core/nuts/nut_00.dart';
import 'package:nostr_core_enhanced/cashu/core/nuts/v1/nut_05.dart';
import 'package:nostr_core_enhanced/cashu/core/nuts/v1/nut_08.dart';
import 'package:nostr_core_enhanced/cashu/core/nuts/v1/nut_11.dart';
import 'package:nostr_core_enhanced/cashu/models/cashu_token_data.dart';
import 'package:nostr_core_enhanced/cashu/models/proof.dart';
import 'package:nostr_core_enhanced/cashu/models/unblinding_data.dart';
import 'package:nostr_core_enhanced/cashu/utils/network/response.dart';
import 'package:nostr_core_enhanced/nostr/event.dart';
import 'package:nostr_core_enhanced/utils/utils.dart';

import '../proof/keyset_helper.dart';
import '../transaction/transaction_helper.dart';
import 'cashu_manager.dart';
import 'proof_blinding_manager.dart';

class NutzapHelper {
  static Future<CashuResponse<String>> sendNutzapSameMint({
    required String pubkey,
    required int amount,
    required String mintUrl,
    required String p2pkPubkey,
    required String unit,
    required String memo,
    void Function(CashuActionsStatus status)? onStatusUpdate,
  }) async {
    final manager = CashuManager.shared;
    final mint = await manager.getMint(mintUrl);
    if (mint == null) {
      return CashuResponse.fromErrorMsg(
          'Selected mint $mintUrl is not available locally');
    }

    onStatusUpdate?.call(CashuActionsStatus.selectingTokens);

    // Keyset info
    final keysetInfo = await KeysetHelper.tryGetMintKeysetInfo(mint, unit);
    if (keysetInfo == null) {
      return CashuResponse.fromErrorMsg('Keyset not found for unit $unit');
    }

    // Select Inputs
    final savedTokens = await manager.db.getCashuTokensByFilter(
      mintURL: mintUrl,
      pubkey: manager.pubkey,
    );

    final tokensToSpend = <CashuTokenData>[];
    final proofsToSpend = <Proof>[];
    final unusedProofs = <Proof>[];
    int gathered = 0;
    int estimatedFee = 2; // Overestimate for selection

    for (var token in savedTokens) {
      if (token.mintUrl != mintUrl || token.unit != unit) continue;
      tokensToSpend.add(token);

      for (var proof in token.proofs) {
        if (gathered < amount + estimatedFee) {
          proofsToSpend.add(proof);
          gathered += proof.amountNum;
        } else {
          unusedProofs.add(proof);
        }
      }
      if (gathered >= amount + estimatedFee) break;
    }

    final inputFee =
        (proofsToSpend.length * keysetInfo.inputFeePPK + 999) ~/ 1000;
    final totalNeeded = amount + inputFee;

    if (gathered < totalNeeded) {
      return CashuResponse.fromErrorMsg(
          'Insufficient balance (Need $totalNeeded, Have $gathered)');
    }

    final changeAmount = gathered - totalNeeded;

    // Prepare Outputs
    final blindedMessages = <BlindedMessage>[];
    final secrets = <String>[];
    final rs = <BigInt>[];
    final unblindingOptions = <UnblindingOption>[];

    // Target Outputs (P2PK)
    final targetPubkey = p2pkPubkey.length == 64 ? '02$p2pkPubkey' : p2pkPubkey;

    String p2pkCreator(int a) {
      final s = P2PKSecret.fromOptions(
        receivePubKeys: [targetPubkey],
        sigFlag: P2PKSecretSigFlag.inputs,
      );
      s?.refreshNonce();
      return s?.toSecretString() ?? '';
    }

    final ($1, $2, $3, _) = DhkeHelper.createBlindedMessages(
      keysetId: keysetInfo.id,
      amount: amount,
      secretCreator: p2pkCreator,
    );

    blindedMessages.addAll($1);
    secrets.addAll($2);
    rs.addAll($3);
    // Target outputs are NOT saved to local wallet (sent away)
    unblindingOptions.addAll(List.generate(
        $1.length, (_) => const UnblindingOption(isSaveToLocal: false)));

    final targetCount = $1.length;

    // Change Outputs (Regular - Random)
    if (changeAmount > 0) {
      final (c1, c2, c3, _) = DhkeHelper.createBlindedMessages(
        keysetId: keysetInfo.id,
        amount: changeAmount,
      );
      blindedMessages.addAll(c1);
      secrets.addAll(c2);
      rs.addAll(c3);
      unblindingOptions.addAll(List.generate(
          c1.length, (_) => const UnblindingOption(isSaveToLocal: true)));
    }

    // 4. Perform Swap
    onStatusUpdate?.call(CashuActionsStatus.minting);
    final swapResponse = await mint.swapAction(
      mintURL: mint.mintURL,
      proofs: proofsToSpend,
      outputs: blindedMessages,
    );

    if (!swapResponse.isSuccess) return swapResponse.cast();

    // 5. Unblind & Store Change
    final unblindingResponse =
        await ProofBlindingManager.shared.unblindingBlindedSignature((
      mint,
      unit,
      swapResponse.data,
      secrets,
      rs,
      unblindingOptions,
      ProofBlindingAction.multiMintSwap,
      '',
    ));

    if (!unblindingResponse.isSuccess) return unblindingResponse.cast();

    final allNewProofs = unblindingResponse.data;
    final targetProofs = allNewProofs.sublist(0, targetCount);
    // Change proofs are automatically saved by ProofBlindingManager if option isSaveToLocal=true.
    final changeProofs = allNewProofs.sublist(targetCount);

    // 6. Delete Input Proofs & Broadcast Change
    final spentTokenEventIds = tokensToSpend.map((t) => t.id).toList();
    final tokenStates = <String, CashuTokenStatus>{};
    for (var id in spentTokenEventIds) {
      tokenStates[id] = CashuTokenStatus.destroyed;
    }

    String? changeEventId;
    final totalChangeProofs = [...changeProofs, ...unusedProofs];
    if (totalChangeProofs.isNotEmpty) {
      changeEventId = await NostrCashuFunctions.shared.sendTokenEvent(
        mintUrl: mintUrl,
        unit: unit,
        proofs: totalChangeProofs,
        deletedTokenIds: spentTokenEventIds,
        deleteTokens: true,
      );
      if (changeEventId != null) {
        tokenStates[changeEventId] = CashuTokenStatus.created;
      }
    } else {
      await NostrCashuFunctions.shared.broadcastDeletion(spentTokenEventIds);
    }

    // 7. Send Target Token (Nutzap)
    onStatusUpdate?.call(CashuActionsStatus.broadcastingNew);
    final eventId = await NostrCashuFunctions.shared.sendNutzapEvent(
      recipientPubkey: pubkey,
      mintUrl: mintUrl,
      unit: unit,
      proofs: targetProofs,
      content: memo,
    );

    if (eventId != null) {
      tokenStates[eventId] = CashuTokenStatus.created;
    }

    if (eventId == null) {
      return CashuResponse.fromErrorMsg(
          'Failed to broadcast token. Token created.');
    }

    onStatusUpdate?.call(CashuActionsStatus.finalizing);

    // Record spending history
    await NostrCashuFunctions.shared.sendSpendingEvent(
      amount: amount,
      unit: unit,
      tokenStates: tokenStates,
      direction: CashuSpendingDirection.outgoing,
    );

    // Update balance
    await manager.updateMintBalance(mint);

    return CashuResponse.fromSuccessData(eventId);
  }

  static Future<CashuResponse<String>> sendNutzapCrossMint({
    required String pubkey,
    required int amount,
    required String sourceMintUrl,
    required String targetMintUrl,
    required String p2pkPubkey,
    required String unit,
    required String memo,
    void Function(CashuActionsStatus status)? onStatusUpdate,
  }) async {
    final manager = CashuManager.shared;
    final fromMint = await manager.getMint(sourceMintUrl);

    if (fromMint == null) {
      return CashuResponse.fromErrorMsg(
          'Source Mint $sourceMintUrl not found locally');
    }

    // Attempt to get target mint (locally or ad-hoc if possible - currently relying on local presence for safety)
    var toMint = await manager.getMint(targetMintUrl);
    if (toMint == null) {
      // Since we don't have ad-hoc mint support easily, verify if we can proceed.
      return CashuResponse.fromErrorMsg(
          'Target Mint $targetMintUrl is not in your wallet. Please add it to perform cross-mint zaps.');
    }

    // 1. Create Invoice on Target
    onStatusUpdate?.call(CashuActionsStatus.requestingMintQuote);
    final invoiceReceipt = await TransactionHelper.requestCreateInvoice(
      mint: toMint,
      amount: amount,
    );
    if (invoiceReceipt == null) {
      return CashuResponse.fromErrorMsg(
          'Failed to create invoice at target mint');
    }

    // 2. Melting on Source
    onStatusUpdate?.call(CashuActionsStatus.requestingMeltQuote);
    final quoteResponse = await Nut5.requestMeltQuote(
      mintURL: sourceMintUrl,
      request: invoiceReceipt.request,
      unit: unit,
    );
    if (!quoteResponse.isSuccess) return quoteResponse.cast();

    final fee = int.tryParse(quoteResponse.data.fee) ?? 0;
    final totalNeeded = amount + fee;

    // Select tokens
    onStatusUpdate?.call(CashuActionsStatus.selectingTokens);
    final savedTokens = await manager.db.getCashuTokensByFilter(
      mintURL: sourceMintUrl,
      pubkey: manager.pubkey,
    );

    final tokensToSpend = <CashuTokenData>[];
    final proofsToSpend = <Proof>[];
    final unusedProofs = <Proof>[];
    int gathered = 0;

    for (var token in savedTokens) {
      if (token.unit != unit) continue;
      tokensToSpend.add(token);

      for (var proof in token.proofs) {
        if (gathered < totalNeeded) {
          proofsToSpend.add(proof);
          gathered += proof.amountNum;
        } else {
          unusedProofs.add(proof);
        }
      }
      if (gathered >= totalNeeded) break;
    }

    if (gathered < totalNeeded) {
      return CashuResponse.fromErrorMsg(
          'Insufficient balance (Need $totalNeeded, Have $gathered)');
    }

    // Pay Melt
    onStatusUpdate?.call(CashuActionsStatus.melting);
    // Note: TransactionHelper.payingTheQuote handles History entry for LN Invoice
    final meltResult = await TransactionHelper.payingTheQuote(
      mint: fromMint,
      paymentId: quoteResponse.data.quote,
      amount: amount,
      fee: fee,
      proofs: proofsToSpend,
      historyValue: invoiceReceipt.request,
      unit: unit,
      meltAction: Nut8.payingTheQuote,
    );

    if (!meltResult.isSuccess) return meltResult.cast();

    final (_, changeProofs) = meltResult.data;

    // Broadcast Spent/Change for Source
    onStatusUpdate?.call(CashuActionsStatus.broadcastingSpent);

    final spentTokenEventIds = tokensToSpend.map((e) => e.id).toList();
    final tokenStates = <String, CashuTokenStatus>{};
    for (var id in spentTokenEventIds) {
      tokenStates[id] = CashuTokenStatus.destroyed;
    }

    final totalChangeProofs = [...changeProofs, ...unusedProofs];
    if (totalChangeProofs.isNotEmpty) {
      final changeEventId = await NostrCashuFunctions.shared.sendTokenEvent(
        mintUrl: sourceMintUrl,
        unit: unit,
        proofs: totalChangeProofs,
        deletedTokenIds: spentTokenEventIds,
        deleteTokens: true,
      );

      if (changeEventId != null) {
        tokenStates[changeEventId] = CashuTokenStatus.created;
      }
    } else {
      await NostrCashuFunctions.shared.broadcastDeletion(spentTokenEventIds);
    }

    // Record spending (Melt)
    await NostrCashuFunctions.shared.sendSpendingEvent(
      amount: amount + fee,
      unit: unit,
      tokenStates: tokenStates,
      direction: CashuSpendingDirection.outgoing,
    );

    // 3. Mint on Target (P2PK)
    final targetPubkey = p2pkPubkey.length == 64 ? '02$p2pkPubkey' : p2pkPubkey;

    onStatusUpdate?.call(CashuActionsStatus.minting);

    final keysetInfo = await KeysetHelper.tryGetMintKeysetInfo(toMint, unit);
    if (keysetInfo == null) {
      return CashuResponse.fromErrorMsg('Target keyset not found');
    }

    // Create P2PK blinded messages
    String p2pkCreator(int a) {
      final s = P2PKSecret.fromOptions(
        receivePubKeys: [targetPubkey],
        sigFlag: P2PKSecretSigFlag.inputs,
      );
      s?.refreshNonce();
      return s?.toSecretString() ?? '';
    }

    final (blindedMessages, secrets, rs, _) = DhkeHelper.createBlindedMessages(
      keysetId: keysetInfo.id,
      amount: amount,
      secretCreator: p2pkCreator,
    );

    final mintResponse = await toMint.requestTokensAction(
      mintURL: targetMintUrl,
      quote: invoiceReceipt.redemptionKey,
      blindedMessages: blindedMessages,
    );

    if (!mintResponse.isSuccess) return mintResponse.cast();

    // Unblind (No Save)
    final unblindingResponse =
        await ProofBlindingManager.shared.unblindingBlindedSignature((
      toMint,
      unit,
      mintResponse.data,
      secrets,
      rs,
      List.generate(blindedMessages.length,
          (_) => const UnblindingOption(isSaveToLocal: false)),
      ProofBlindingAction.minting,
      invoiceReceipt.request,
    ));

    if (!unblindingResponse.isSuccess) return unblindingResponse.cast();

    final targetProofs = unblindingResponse.data;

    // 4. Send via Nostr (Nutzap)
    onStatusUpdate?.call(CashuActionsStatus.broadcastingNew);
    final eventId = await NostrCashuFunctions.shared.sendNutzapEvent(
      recipientPubkey: pubkey,
      mintUrl: targetMintUrl,
      unit: unit,
      proofs: targetProofs,
      content: memo,
    );

    if (eventId == null) {
      return CashuResponse.fromErrorMsg(
          'Token minted but failed to broadcast.');
    }

    onStatusUpdate?.call(CashuActionsStatus.finalizing);
    await manager.updateMintBalance(fromMint);
    // Don't update target mint balance necessarily as we sent the funds away, but good to sync state.

    return CashuResponse.fromSuccessData(eventId);
  }

  static (String? mintUrl, String? unit, List<Proof> proofs) parseNutzapEvent(
      Event event) {
    String? mintUrl;
    String? unit;
    final proofs = <Proof>[];
    for (final tag in event.tags) {
      if (tag.isEmpty) continue;
      final key = tag[0];
      if (key == 'u' && tag.length > 1) {
        mintUrl = tag[1];
      } else if (key == 'unit' && tag.length > 1) {
        unit = tag[1];
      } else if (key == 'proof' && tag.length > 1) {
        try {
          final proofMap = jsonDecode(tag[1]);
          proofs.add(Proof.fromServerJson(proofMap));
        } catch (e) {
          logger.e('Failed to parse nutzap proof: $e');
        }
      }
    }
    return (mintUrl, unit, proofs);
  }
}
