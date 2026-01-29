import 'dart:async';

import 'package:nostr_core_enhanced/cashu/business/proof/token_helper.dart';
import 'package:nostr_core_enhanced/cashu/models/cashu_spending_data.dart';
import 'package:nostr_core_enhanced/cashu/models/lightning_invoice.dart';
import 'package:nostr_core_enhanced/cashu/models/mint_info.dart';
import 'package:nostr_core_enhanced/cashu/models/mint_model.dart';
import 'package:nostr_core_enhanced/cashu/models/token_model.dart';
import 'package:nostr_core_enhanced/cashu/utils/network/response.dart';
import 'package:nostr_core_enhanced/nostr/event.dart';
import 'package:nostr_core_enhanced/utils/enums.dart';

import '../business/mint/mint_helper.dart';
import '../business/transaction/hitstory_store.dart';
import '../business/wallet/cashu_manager.dart';
import '../core/nuts/define.dart';
import '../core/nuts/nut_00.dart';
import 'general_client.dart';

class CashuAPI {
  /**************************** Financial ****************************/

  /// Calculate the total balance across all mints.
  int totalBalance() {
    final cm = CashuManager.shared;
    final mints = [
      ...cm.mints.values
          .where((e) => cm.wallet?.mints.contains(e.mintURL) ?? false)
    ];
    return mints.fold(0, (pre, mint) => pre + mint.balance);
  }

  Future<List<CashuSpendingData>> getHistory() async {
    await CashuManager.shared.setupFinish.future;
    return await HistoryStore.getHistory();
  }

  /**************************** Wallet ****************************/

  /// Creates a new wallet with the given mints.
  Future<bool> createWallet(List<String> mints) async {
    await CashuManager.shared.setupFinish.future;
    return await CashuManager.shared.createWallet(mints: mints);
  }

  /// Retrieves mint information from the specified mint.
  Future<bool> updateWalletMints(String mint) async {
    await CashuManager.shared.setupFinish.future;
    return await CashuManager.shared.updateWalletMint(mint);
  }

  /// Restore proofs for a given mint using a mnemonic seed (only 'sat' unit).
  Future<int> restoreProofs(String mintURL, String mnemonic) async {
    await CashuManager.shared.setupFinish.future;
    return await CashuManager.shared
        .restoreProofs(mintURL, mnemonic, unit: 'sat');
  }

  /// Swap funds from one mint to another.
  Future<CashuResponse<void>> swapMintFunds({
    required String fromMintURL,
    required String toMintURL,
    required int amount,
    String unit = 'sat',
    void Function(CashuActionsStatus status)? onStatusUpdate,
  }) async {
    await CashuManager.shared.setupFinish.future;
    return await CashuManager.shared.swapMintFunds(
      fromMintURL: fromMintURL,
      toMintURL: toMintURL,
      amount: amount,
      unit: unit,
      onStatusUpdate: onStatusUpdate,
    );
  }

  /**************************** Invoice & Deposit ****************************/

  /// Create an invoice to deposit funds into a mint.
  Future<CashuResponse<Receipt>> createDepositInvoice({
    required String mintURL,
    required int amount,
    void Function(CashuActionsStatus status)? onStatusUpdate,
  }) async {
    await CashuManager.shared.setupFinish.future;
    return await CashuManager.shared.createDepositInvoice(
      mintURL: mintURL,
      amount: amount,
      onStatusUpdate: onStatusUpdate,
    );
  }

  /// Complete a deposit after the invoice has been paid.
  Future<CashuResponse<void>> completeDeposit({
    required String mintURL,
    required String quoteID,
    required int amount,
    String unit = 'sat',
    void Function(CashuActionsStatus status)? onStatusUpdate,
  }) async {
    await CashuManager.shared.setupFinish.future;
    return await CashuManager.shared.completeDeposit(
      mintURL: mintURL,
      quoteID: quoteID,
      amount: amount,
      unit: unit,
      onStatusUpdate: onStatusUpdate,
    );
  }

  /// Deposit funds into a target mint using an e-cash token.
  /// This handles both same-mint redemption and cross-mint deposit (swap).
  Future<CashuResponse<void>> depositWithToken({
    required String ecashString,
    required String targetMintURL,
    String unit = 'sat',
    void Function(CashuActionsStatus status)? onStatusUpdate,
  }) async {
    await CashuManager.shared.setupFinish.future;
    return await CashuManager.shared.depositWithToken(
      ecashString: ecashString,
      targetMintURL: targetMintURL,
      unit: unit,
      onStatusUpdate: onStatusUpdate,
    );
  }

  /// Pay a Lightning invoice using Cashu tokens from a specific mint.
  Future<CashuResponse<void>> payInvoice({
    required String mintURL,
    required String invoice,
    String unit = 'sat',
    void Function(CashuActionsStatus status)? onStatusUpdate,
  }) async {
    await CashuManager.shared.setupFinish.future;
    return await CashuManager.shared.payInvoice(
      mintURL: mintURL,
      invoice: invoice,
      unit: unit,
      onStatusUpdate: onStatusUpdate,
    );
  }

  /**************************** Token Operations ****************************/

  /// Create a shareable Cashu token string for a specific amount.
  Future<CashuResponse<String>> createCashuToken({
    required String mintURL,
    required int amount,
    String memo = '',
    String unit = 'sat',
    void Function(CashuActionsStatus status)? onStatusUpdate,
  }) async {
    await CashuManager.shared.setupFinish.future;
    return await CashuManager.shared.createCashuToken(
      mintURL: mintURL,
      amount: amount,
      memo: memo,
      unit: unit,
      onStatusUpdate: onStatusUpdate,
    );
  }

  /// Send a NutZap (NIP-61) to a specific Nostr pubkey.
  Future<CashuResponse<String>> sendNutzap({
    required String pubkey,
    required int amount,
    required String mintURL,
    String unit = 'sat',
    String memo = '',
    void Function(CashuActionsStatus status)? onStatusUpdate,
  }) async {
    await CashuManager.shared.setupFinish.future;
    return await CashuManager.shared.sendNutzap(
      pubkey: pubkey,
      amount: amount,
      mintUrl: mintURL,
      unit: unit,
      memo: memo,
      onStatusUpdate: onStatusUpdate,
    );
  }

  /// Redeems a NutZap (NIP-61) event.
  Future<CashuResponse<void>> redeemNutzap({
    required Event nutzapEvent,
    void Function(CashuActionsStatus status)? onStatusUpdate,
  }) async {
    await CashuManager.shared.setupFinish.future;
    return await CashuManager.shared.redeemNutzap(
      nutzapEvent: nutzapEvent,
      onStatusUpdate: onStatusUpdate,
    );
  }

  /// Decodes a Cashu token string into a Token object.
  Token? decodeCashuToken(String ecashToken) {
    return Nut0.decodedToken(ecashToken);
  }

  /**************************** Mint ****************************/

  /// Deletes the specified mint.
  /// Returns true if the deletion is successful.
  Future<bool> deleteMint(String mintURL) async {
    await CashuManager.shared.setupFinish.future;
    return CashuManager.shared.deleteMint(mintURL);
  }

  /// Edits the name of the specified mint.
  Future editMintName(IMint mint, String name) async {
    await CashuManager.shared.setupFinish.future;
    if (mint.name == name) return;
    mint.name = name;
    CashuManager.shared.updateMintName(mint);
  }

  /// Retrieves mint information from the specified mint.
  Future<bool> fetchMintInfo(IMint mint) async {
    return MintHelper.updateMintInfoFromRemote(mint);
  }

  /// Retrieves mint information from the specified mint.
  Future<bool> isMintInfoAvailable(String mintURL) async {
    final mintInfo = await MintHelper.getMintInfo(mintURL);
    return mintInfo != null;
  }

  Future<MintInfo?> getRawMintInfo(String mintURL) async {
    return await MintHelper.getMintInfo(mintURL);
  }

  /// Subscribe to real-time updates for a specific mint quote (NUT-17).
  Future<Stream<QuoteState>> subscribeToMintQuote({
    required String mintURL,
    required String quoteID,
  }) async {
    await CashuManager.shared.setupFinish.future;
    return CashuManager.shared.subscribeToMintQuote(
      mintURL: mintURL,
      quoteID: quoteID,
    );
  }

  Future<bool?> isEcashTokenSpendableFromToken(String token) async {
    if (!decodeCashuToken(token).runtimeType.toString().contains('Token')) {
      return null;
    }

    final spendable = await TokenHelper.isTokenSpendable(token);
    if (spendable == null) return null;

    return spendable;
  }

  /// Resyncs the mint by fetching all tokens from Nostr, verifying their state,
  /// deleting spent proofs, and re-issuing new token events for the valid proofs.
  /// This ensures that all proofs for the specified mint are local, verified, and spendable.
  Future<CashuResponse<void>> resyncMint(
    String mintURL, {
    void Function(CashuActionsStatus status)? onStatusUpdate,
  }) async {
    await CashuManager.shared.setupFinish.future;
    return await CashuManager.shared.resyncMint(
      mintURL: mintURL,
      onStatusUpdate: onStatusUpdate,
    );
  }

  /**************************** Tools ****************************/

  /// Converts the amount in a Lightning Network payment request to satoshis.
  int? amountOfLightningInvoice(String pr) =>
      CashuAPIGeneralClient.amountOfLightningInvoice(pr);

  /**************************** Deprecated or Commented Out ****************************/

  // Future<List<CashuSpendingData>> getHistoryList({
  //   int size = 10,
  //   String? lastHistoryId,
  // }) async {
  //   await CashuManager.shared.setupFinish.future;
  //   final allHistory = await HistoryStore.getHistory();
  //
  //   var startIndex = 0;
  //   if (lastHistoryId != null) {
  //     final index =
  //         allHistory.indexWhere((element) => element.id == lastHistoryId);
  //     if (index >= 0) {
  //       startIndex = index + 1;
  //     }
  //   }
  //
  //   final end = min(allHistory.length, startIndex + size);
  //   return allHistory.sublist(startIndex, end);
  // }

  // Future<List<Proof>> getAllUseProofs(IMint mint) {
  //   return ProofHelper.getProofs(mint.mintURL);
  // }

  // Future<bool?> isEcashTokenSpendableFromHistory(IHistoryEntry entry) async {
  //   if (entry.type != IHistoryType.eCash) return null;
  //
  //   final spendable = await isEcashTokenSpendableFromToken(entry.value);
  //   if (spendable == null) return null;
  //
  //   entry.isSpent = !spendable;
  //   if (entry.isSpent == true) {
  //     await HistoryStore.updateHistoryEntry(entry);
  //   }
  //   return spendable;
  // }

  // Future<int?> checkProofsAvailable(IMint mint) async {
  //   await CashuManager.shared.setupFinish.future;

  //   final proofs = await ProofHelper.getProofs(mint.mintURL);
  //   final response =
  //       await mint.tokenCheckAction(mintURL: mint.mintURL, proofs: proofs);
  //   if (!response.isSuccess) return null;
  //   if (response.data.length != proofs.length) {
  //     throw Exception('[E][Cashu - checkProofsAvailable] '
  //         'The length of states(${response.data.length}) and proofs(${proofs.length}) is not consistent');
  //   }

  //   var burnedAmount = 0;
  //   final burnedProofs = <Proof>[];
  //   final liveOrPendingProofs = <Proof>[];
  //   final nowMs = DateTime.now().millisecondsSinceEpoch;

  //   for (int i = 0; i < response.data.length; i++) {
  //     final proof = proofs[i].copyWith(
  //       stateRaw: response.data[i].index,
  //       lastCheckedMs: nowMs,
  //     );
  //     switch (proof.state) {
  //       case TokenState.live:
  //         liveOrPendingProofs.add(proof);
  //         break;
  //       case TokenState.burned:
  //         burnedAmount += proof.amountNum;
  //         burnedProofs.add(proof);
  //         break;
  //       case TokenState.inFlight:
  //         liveOrPendingProofs.add(proof);
  //         break;
  //     }
  //   }

  //   // Delete the proofs before updating the assets; otherwise, the updated asset data will be inaccurate.
  //   await ProofHelper.deleteProofs(proofs: burnedProofs);
  //   if (liveOrPendingProofs.isNotEmpty) {
  //     await ProofHelper.saveProofStates(liveOrPendingProofs);
  //   }
  //   await CashuManager.shared.updateMintBalance(mint);

  //   return burnedAmount;
  // }

  // Future<String?> tryCreateSpendableEcashToken(String token) =>
  //     CashuAPIGeneralClient.tryCreateSpendableEcashToken(token);

  // Future<CashuResponse<Receipt>> checkReceiptCompleted(Receipt receipt) async {
  //   var isRedeemed = await HistoryStore.hasReceiptRedeemHistory(receipt);
  //   if (isRedeemed) return CashuResponse.fromSuccessData(receipt);
  //
  //   final success =
  //       await CashuManager.shared.invoiceHandler.checkInvoice(receipt, true);
  //   if (success) return CashuResponse.fromSuccessData(receipt);
  //
  //   // Fetch again
  //   isRedeemed = await HistoryStore.hasReceiptRedeemHistory(receipt);
  //   if (isRedeemed) return CashuResponse.fromSuccessData(receipt);
  //
  //   return CashuResponse.generalError();
  // }

  // Future<List<IMint>> mintList() async {
  //   await CashuManager.shared.setupFinish.future;
  //   return CashuManager.shared.mints.values.toList();
  // }

  // Future<IMint?> addMint(String mintURL) async {
  //   await CashuManager.shared.setupFinish.future;
  //   return await CashuManager.shared.addMint(mintURL);
  // }

  // Future<CashuResponse<String>> sendEcash({
  //   required IMint mint,
  //   required int amount,
  //   String memo = '',
  //   String unit = 'sat',
  //   List<Proof>? proofs,
  // }) =>
  //     CashuAPIGeneralClient.sendEcash(
  //       mint: mint,
  //       amount: amount,
  //       memo: memo,
  //       unit: unit,
  //       proofs: proofs,
  //     );

  // Future<CashuResponse<List<String>>> sendEcashList({
  //   required IMint mint,
  //   required List<int> amountList,
  //   List<String> publicKeys = const [],
  //   List<String>? refundPubKeys,
  //   DateTime? locktime,
  //   int? signNumRequired,
  //   String memo = '',
  //   String unit = 'sat',
  // }) =>
  //     CashuAPIGeneralClient.sendEcashList(
  //       mint: mint,
  //       amountList: amountList,
  //       customSecret: P2PKSecret.fromOptions(
  //         receivePubKeys: publicKeys,
  //         refundPubKeys: refundPubKeys,
  //         lockTime: locktime,
  //         signNumRequired: signNumRequired,
  //       ),
  //       memo: memo,
  //       unit: unit,
  //     );

  // Future<CashuResponse<String>> sendEcashToPublicKeys({
  //   required IMint mint,
  //   required int amount,
  //   required List<String> publicKeys,
  //   List<String>? refundPubKeys,
  //   DateTime? locktime,
  //   int? signNumRequired,
  //   P2PKSecretSigFlag? sigFlag,
  //   String memo = '',
  //   String unit = 'sat',
  //   List<Proof>? proofs,
  // }) =>
  //     CashuAPIGeneralClient.sendEcashToPublicKeys(
  //       mint: mint,
  //       amount: amount,
  //       publicKeys: publicKeys,
  //       refundPubKeys: refundPubKeys,
  //       locktime: locktime,
  //       signNumRequired: signNumRequired,
  //       sigFlag: sigFlag,
  //       memo: memo,
  //       unit: unit,
  //       proofs: proofs,
  //     );

  // Future<CashuResponse<String>> createEcashWithHTLC({
  //   required IMint mint,
  //   required int amount,
  //   required String hash,
  //   List<String>? receivePubKeys,
  //   List<String>? refundPubKeys,
  //   String memo = '',
  //   String unit = 'sat',
  //   List<Proof>? proofs,
  // }) =>
  //     CashuAPIGeneralClient.createEcashWithHTLC(
  //       mint: mint,
  //       amount: amount,
  //       hash: hash,
  //       receivePubKeys: receivePubKeys,
  //       refundPubKeys: refundPubKeys,
  //       memo: memo,
  //       unit: unit,
  //       proofs: proofs,
  //     );

  // Future<CashuResponse<(String memo, int amount)>> redeemEcash({
  //   required String ecashString,
  // }) =>
  //     CashuAPIGeneralClient.redeemEcash(
  //       ecashString: ecashString,
  //     );

  // Future<bool> redeemEcashFromInvoice({
  //   required IMint mint,
  //   required String pr,
  // }) =>
  //     CashuAPIGeneralClient.redeemEcashFromInvoice(mint: mint, pr: pr);

  // Future<CashuResponse<String?>> payPaymentRequest({
  //   required PaymentRequest request,
  //   void Function(CashuActionsStatus status)? onStatusUpdate,
  // }) async {
  //   await CashuManager.shared.setupFinish.future;
  //   return CashuManager.shared.payPaymentRequest(
  //     request: request,
  //     onStatusUpdate: onStatusUpdate,
  //   );
  // }

  // Future<CashuResponse> payingLightningInvoice({
  //   required IMint mint,
  //   required String pr,
  //   String paymentKey = '',
  //   CashuProgressCallback? processCallback,
  // }) {
  //   if (mint.maxNutsVersion >= 1) {
  //     return CashuAPIV1Client.payingLightningInvoice(
  //       mint: mint,
  //       pr: pr,
  //       paymentKey: paymentKey,
  //       processCallback: processCallback,
  //     );
  //   }
  //   return CashuAPIV0Client.payingLightningInvoice(
  //     mint: mint,
  //     pr: pr,
  //     paymentKey: paymentKey,
  //   );
  // }

  // Future<Receipt?> createLightningInvoice({
  //   required IMint mint,
  //   required int amount,
  // }) {
  //   return TransactionHelper.requestCreateInvoice(
  //     mint: mint,
  //     amount: amount,
  //   );
  // }

  // Future<bool> deleteLightningInvoice(Receipt receipt) =>
  //     CashuManager.shared.invoiceHandler.deleteInvoice(receipt);

  // void addInvoiceListener(CashuListener listener) {
  //   CashuManager.shared.addListener(listener);
  // }

  // void removeInvoiceListener(CashuListener listener) {
  //   CashuManager.shared.removeListener(listener);
  // }

  // Future<CashuResponse<String>> getBackUpToken(List<IMint> mints) =>
  //     CashuAPIGeneralClient.getBackUpToken(mints);

  // Future<CashuResponse> importCashuToken(String token) =>
  //     CashuAPIGeneralClient.redeemEcash(
  //       ecashString: token,
  //       isUseSwap: false,
  //     );

  // String createHTLCHash(String preimage) {
  //   final (_, String hashString) = HTLC.createHashData(preimage);
  //   return hashString;
  // }

  // CashuTokenInfo? infoOfToken(String ecashToken) =>
  //     CashuAPIGeneralClient.infoOfToken(ecashToken);

  // bool isCashuToken(String str) {
  //   return Nut0.isCashuToken(str);
  // }

  // PaymentRequest? parsePaymentRequest(String input) {
  //   return CashuManager.parsePaymentRequest(input);
  // }

  // bool isLnInvoice(String str) => CashuAPIGeneralClient.isLnInvoice(str);

  // Future<String?> addP2PKSignatureToToken({
  //   required String ecashString,
  //   required List<String> pukeyList,
  // }) =>
  //     CashuAPIGeneralClient.addP2PKSignatureToToken(
  //       ecashString: ecashString,
  //       pubkeyList: pukeyList,
  //     );

  // void startHighFrequencyDetection() async {
  //   await CashuManager.shared.setupFinish.future;
  //   CashuManager.shared.invoiceHandler.startHighFrequencyDetection();
  // }

  // void stopHighFrequencyDetection() async {
  //   await CashuManager.shared.setupFinish.future;
  //   CashuManager.shared.invoiceHandler.stopHighFrequencyDetection();
  // }
}
