import 'dart:async';
import 'dart:convert';

import 'package:nostr_core_enhanced/cashu/business/nostr/cashu_nostr_functions.dart';
import 'package:nostr_core_enhanced/cashu/business/proof/proof_store.dart';
import 'package:nostr_core_enhanced/cashu/business/wallet/nutzap_helper.dart';
import 'package:nostr_core_enhanced/cashu/core/dhke_helper.dart';
import 'package:nostr_core_enhanced/cashu/core/mint_actions.dart';
import 'package:nostr_core_enhanced/cashu/core/nuts/define.dart';
import 'package:nostr_core_enhanced/cashu/core/nuts/nut_00.dart';
import 'package:nostr_core_enhanced/cashu/core/nuts/v1/nut_05.dart';
import 'package:nostr_core_enhanced/cashu/core/nuts/v1/nut_17.dart';
import 'package:nostr_core_enhanced/cashu/models/cashu_wallet.dart';
import 'package:nostr_core_enhanced/cashu/models/invoice_listener.dart';
import 'package:nostr_core_enhanced/cashu/models/lightning_invoice.dart';
import 'package:nostr_core_enhanced/cashu/models/mint_model.dart';
import 'package:nostr_core_enhanced/cashu/models/proof.dart';
import 'package:nostr_core_enhanced/cashu/models/token_model.dart';
import 'package:nostr_core_enhanced/cashu/models/unblinding_data.dart';
import 'package:nostr_core_enhanced/cashu/utils/crypto_utils.dart';
import 'package:nostr_core_enhanced/cashu/utils/network/cashu_mint_websocket.dart';
import 'package:nostr_core_enhanced/cashu/utils/network/response.dart';
import 'package:nostr_core_enhanced/cashu/utils/tools.dart';
import 'package:nostr_core_enhanced/core/nostr_core_repository.dart';
import 'package:nostr_core_enhanced/db/nostr_cache_manager.dart';
import 'package:nostr_core_enhanced/nostr/event.dart';
import 'package:nostr_core_enhanced/nostr/event_signer/bip340_event_signer.dart';
import 'package:nostr_core_enhanced/nostr/event_signer/keychain.dart';
import 'package:nostr_core_enhanced/utils/utils.dart';

import '../../core/nuts/dhke.dart';
import '../../core/nuts/v1/nut_02.dart';
import '../../core/nuts/v1/nut_08.dart';
import '../../core/nuts/v1/nut_09.dart';
import '../../core/nuts/v1/nut_10.dart';
import '../../core/nuts/v1/nut_11.dart';
import '../../core/nuts/v1/nut_13.dart';
import '../../core/nuts/v1/nut_18.dart';
import '../../core/nuts/v1/nut_26.dart';
import '../../models/cashu_token_data.dart';
import '../mint/mint_helper.dart';
import '../proof/keyset_helper.dart';
import '../proof/proof_helper.dart';
import '../proof/witness_helper.dart';
import '../transaction/transaction_helper.dart';
import 'invoice_handler.dart';
import 'proof_blinding_manager.dart';

typedef SignWithKeyFunction = Future<String> Function(
  String pubkey,
  String message,
);

const defaultMints = [
  'https://mint.cubabitcoin.org',
  'https://mint.minibits.cash/Bitcoin',
];

class CashuManager {
  static PaymentRequest? parsePaymentRequest(String input) {
    try {
      final normalized = input.trim();
      if (normalized.toLowerCase().startsWith('creqa')) {
        return PaymentRequest.decode(normalized);
      } else if (normalized.toLowerCase().startsWith('creqb')) {
        return Nut26.decode(normalized);
      } else if (normalized.startsWith('{')) {
        return PaymentRequest.fromJson(jsonDecode(normalized));
      }
    } catch (_) {}
    return null;
  }

  static final CashuManager shared = CashuManager._internal();

  CashuManager._internal();

  late NostrCore nostrCore;
  late String pubkey;
  CashuWallet? wallet;

  final Map<String, IMint> mints = {};
  final Set<String> mintURLQueue = {};
  final Map<String, CashuMintWebSocket> _wsConnections = {};
  final List<CashuListener> _listeners = [];

  InvoiceHandler invoiceHandler = InvoiceHandler();
  Completer setupFinish = Completer();
  String Function()? defaultSignPubkey;
  SignWithKeyFunction? signFn;

  NostrDB get db => nostrCore.db;

  Future<void> init(
    NostrCore nostrCore,
    String pubkey, {
    bool clearData = false,
  }) async {
    try {
      this.nostrCore = nostrCore;
      this.pubkey = pubkey;
      await clean(clearData: clearData);

      NostrCashuFunctions.shared.setup(nostrCore, pubkey);

      // ** load wallet data (Mints, tokens & spending history)
      final initSuccess = await initAll();

      if (initSuccess) {
        await setupMints();
        await setupBalance();
      }

      // await ProofHelper.tryParseProofsToNewestVersion();
      // await invoiceHandler.initialize();
      // await ProofBlindingManager.shared.initialize();
      // await IsolateWorker.cashuWorker.init();
      // invoiceHandler.invoiceOnPaidCallback = notifyListenerForPaidSuccess;

      _initDefaultSigning();

      setupFinish.complete();
      logger.i(() => '[Cashu - setup] Finished');
    } catch (e, stack) {
      logger.e(() => '[Cashu - setup] $e');
      logger.e(() => '[Cashu - setup] stack: $stack');
    }
  }

  Future<bool> initAll({bool forceRefresh = false}) async {
    wallet = await NostrCashuFunctions.shared.initializeWallet();
    logger.i(() => '[Cashu - initAll] wallet: $wallet');
    if (wallet != null) {
      await NostrCashuFunctions.shared.initializeData();
      _initDefaultSigning();
    }

    return wallet != null;
  }

  void _initDefaultSigning() {
    if (wallet == null) return;

    defaultSignPubkey ??= () => Keychain.getPublicKey(wallet!.signSecret);
    signFn ??= (pubkey, message) async {
      final signer = Bip340EventSigner(
        wallet!.signSecret,
        Keychain.getPublicKey(wallet!.signSecret),
      );

      if (pubkey == signer.publicKey) {
        String msgToSign = message;
        if (!message.isHexString() || message.length != 64) {
          msgToSign = CryptoUtils.sha256Hash(message);
        }
        return signer.signMessage(msgToSign);
      }
      return '';
    };
  }

  Future<bool> createWallet({List<String>? mints}) async {
    wallet = await NostrCashuFunctions.shared.createWallet(mints: mints);

    if (wallet != null) {
      _initDefaultSigning();
    }

    if (wallet != null && wallet!.mints.isNotEmpty) {
      final mints = <IMint>[];

      for (final mint in wallet!.mints) {
        final maxNutsVersion = await MintHelper.getMaxNutsVersion(mint);
        final info = await MintHelper.getMintInfo(mint);

        mints.add(IMint(
          pubkey: pubkey,
          mintURL: mint,
          maxNutsVersion: maxNutsVersion,
          name: info?.name ?? '',
        ));
      }

      await db.saveMints(mints);
      await db.saveCashuWallet(wallet!);

      await NostrCashuFunctions.shared.initializeData();

      await setupMints();
      await setupBalance();

      return true;
    }

    return false;
  }

  Future<void> clean({bool clearData = false}) async {
    setupFinish = Completer();

    if (clearData) {
      await db.removeAllCashuTokens();
      await db.removeAllCashuSpendings();
      await db.removeAllMintInfos();
      await db.removeAllMints();
    }

    mints.clear();
    for (var ws in _wsConnections.values) {
      ws.disconnect();
    }
    _wsConnections.clear();
    // invoiceHandler.dispose();
    // ProofBlindingManager.shared.dispose();
  }

  Future<void> setupMints() async {
    try {
      final walletMints = wallet!.mints;

      List<IMint> dbMints = await db.loadMintsByPubkey(pubkey);
      final dbMintsUrls = dbMints.map((e) => e.mintURL).toList();

      final newMintsUrls =
          walletMints.where((mint) => !dbMintsUrls.contains(mint)).toList();

      if (newMintsUrls.isNotEmpty) {
        final newMints = <IMint>[];

        for (final mintURL in newMintsUrls) {
          final maxNutsVersion = await MintHelper.getMaxNutsVersion(mintURL);

          final mint = IMint(
            pubkey: pubkey,
            mintURL: mintURL,
            maxNutsVersion: maxNutsVersion,
          );

          await db.saveMints([mint]);
          newMints.add(mint);
        }

        dbMints.addAll(newMints);
      }

      if (dbMints.isNotEmpty) {
        await _initializeMints(dbMints);
      }
    } catch (e, stack) {
      logger.e(() => '[E][Cashu - setupMint] $e');
      logger.e(() => '[E][Cashu - setupMint] stack: $stack');
    }
  }

  Future<void> _initializeMints(List<IMint> dbMints) async {
    for (IMint mint in dbMints) {
      await _setupMintInfo(mint);
      await _setupMintKeyset(mint);
      mints[mint.mintURL] = mint;
    }
  }

  Future<void> _setupMintInfo(IMint mint) async {
    final info = await db.loadMintInfo(mint.mintURL);
    if (info != null) {
      mint.info = info;
    } else {
      await MintHelper.updateMintInfoFromRemote(mint);
    }
  }

  Future<void> _setupMintKeyset(IMint mint) async {
    await MintHelper.updateMintKeysetFromLocal(mint);
  }

  Future<void> setupBalance() async {
    for (final mint in mints.values) {
      await updateMintBalance(mint);
    }
  }

  Future<IMint?> getMint(String mintURL) async {
    final url = MintHelper.getMintURL(mintURL);
    final mint = mints[url];
    if (mint != null) {
      return mint;
    }
    try {
      return addMint(mintURL);
    } catch (_) {
      return null;
    }
  }

  Future<bool> updateWalletMint(String mintURL) async {
    final url = MintHelper.getMintURL(mintURL);
    bool isAdding = false;
    final walletMints = List<String>.from(wallet!.mints);

    if (walletMints.contains(url)) {
      walletMints.remove(url);
      isAdding = false;
    } else {
      walletMints.add(url);
      isAdding = true;
    }

    final cashuWallet = await NostrCashuFunctions.shared.updateWallet(
      mints: walletMints,
      privkey: wallet!.signSecret,
    );

    if (cashuWallet != null) {
      if (isAdding) {
        await addMint(mintURL);
      }

      wallet = cashuWallet;
      await db.saveCashuWallet(wallet!);
      return true;
    }

    return false;
  }

  Future<List<IMint>> addMints(List<String> mintURLs) async {
    final result = <IMint>[];

    for (final mintURL in mintURLs) {
      final url = MintHelper.getMintURL(mintURL);

      if (mints.containsKey(url)) {
        result.add(mints[url]!);
      }

      if (!mintURLQueue.add(url)) continue;

      final maxNutsVersion = await MintHelper.getMaxNutsVersion(url);

      final mint = IMint(
        pubkey: pubkey,
        mintURL: url,
        maxNutsVersion: maxNutsVersion,
      );

      final fetchSuccess = await MintHelper.updateMintInfoFromRemote(mint);
      if (!fetchSuccess) {
        mintURLQueue.remove(url);
        continue;
      }
      mint.name = mint.info?.name ?? mint.info?.mintURL ?? '';

      mints[url] = mint;
      mintURLQueue.remove(url);
      MintHelper.updateMintKeysetFromRemote(mint);
      notifyListenerForMintListChanged();
      result.add(mint);
    }

    return result;
  }

  Future<IMint?> addMint(String mintURL) async {
    final url = MintHelper.getMintURL(mintURL);

    if (mints.containsKey(url)) {
      return null;
    }

    if (!mintURLQueue.add(url)) return null;

    final maxNutsVersion = await MintHelper.getMaxNutsVersion(url);

    final mint = IMint(
      pubkey: pubkey,
      mintURL: url,
      maxNutsVersion: maxNutsVersion,
    );

    final fetchSuccess = await MintHelper.updateMintInfoFromRemote(mint);
    if (!fetchSuccess) {
      mintURLQueue.remove(url);
      return null;
    }
    mint.name = mint.info?.name ?? mint.info?.mintURL ?? '';

    mints[url] = mint;
    mintURLQueue.remove(url);
    MintHelper.updateMintKeysetFromRemote(mint);
    notifyListenerForMintListChanged();
    return mint;
  }

  Future<bool> updateMintName(IMint mint) async {
    final url = MintHelper.getMintURL(mint.mintURL);
    if (!mints.containsKey(url)) {
      return false;
    }
    mints[url]?.name = mint.name;
    await db.saveMint(mint);

    return true;
  }

  Future updateMintBalance([IMint? mint]) async {
    final mints = this
        .mints
        .values
        .where((element) => mint == null || element.mintURL == mint.mintURL);

    if (mints.isEmpty) {
      return false;
    }

    for (var mint in mints) {
      var total = 0;
      final proofs = await ProofHelper.getProofs(mint.mintURL);

      for (final proof in proofs) {
        total += proof.amountNum;
      }
      if (mint.balance != total) {
        mint.balance = total;
        notifyListenerForBalanceChanged(mint);
      }
    }
  }

  Future<bool> deleteMint(String mintURL) async {
    try {
      final target = mints[mintURL];

      if (target != null) {
        mints.remove(target.mintURL);
        await db.removeMint(target.mintURL, pubkey);
      }

      return true;
    } catch (_) {
      return false;
    }
  }

  Future<int> restoreProofs(
    String mintURL,
    String mnemonic, {
    String? unit = 'sat',
  }) async {
    final seed = Nut13.mnemonicToSeed(mnemonic);
    final mint = await getMint(mintURL);
    if (mint == null) return 0;

    // Get all keysets for this mint
    final keysetsResponse = await Nut2.requestKeysetsState(mintURL: mintURL);
    if (!keysetsResponse.isSuccess) return 0;

    final Map<String, List<Proof>> recoveredByUnit = {};

    for (final keyset in keysetsResponse.data) {
      if (unit != null && keyset.unit != unit) continue;

      int counter = 0;
      int emptyBatches = 0;
      const batchSize = 50;
      const maxEmptyBatches = 3;

      // Ensure we have keys for this keyset to unblind
      final keysetInfo =
          await KeysetHelper.tryGetMintKeysetInfo(mint, keyset.unit, keyset.id);
      if (keysetInfo == null || keysetInfo.keyset.isEmpty) continue;

      while (emptyBatches < maxEmptyBatches) {
        final blindedData = DhkeHelper.createDeterministicBlindedMessages(
          seed: seed,
          keysetId: keyset.id,
          counter: counter,
          batchSize: batchSize,
        );

        final response = await Nut9.requestRestoreSignatures(
          mintURL: mintURL,
          blindedMessages: blindedData.$1,
        );

        if (response.isSuccess && response.data.isNotEmpty) {
          emptyBatches = 0;
          final List<Proof> recoveredProofs = [];

          for (final payload in response.data) {
            final blindedMessage = payload.$1;
            final signature = payload.$2;

            // Find the original r and secret for this B_
            final index =
                blindedData.$1.indexWhere((m) => m.B_ == blindedMessage.B_);
            if (index == -1) continue;

            final r = blindedData.$3[index];
            final secret = blindedData.$2[index];

            final K = keysetInfo.keyset[signature.amount];
            if (K == null) continue;

            final C = Dhke.unblindingSignature(signature.C_, r, K);
            if (C == null) continue;

            recoveredProofs.add(Proof(
              id: '$secret+${keyset.id}',
              keysetId: keyset.id,
              amount: signature.amount,
              secret: secret,
              C: C.ecPointToHex(),
            ));
          }

          if (recoveredProofs.isNotEmpty) {
            recoveredByUnit
                .putIfAbsent(keyset.unit, () => [])
                .addAll(recoveredProofs);
          }
        } else {
          emptyBatches++;
        }
        counter += batchSize;
      }
    }

    return _processRecoveredProofs(mintURL, recoveredByUnit);
  }

  Future<int> _processRecoveredProofs(
      String mintURL, Map<String, List<Proof>> recoveredByUnit) async {
    if (recoveredByUnit.isEmpty) return 0;

    // Get existing proofs to avoid duplicates
    final existingProofs = await ProofStore.getProofs(mintURL: mintURL);
    final existingSecrets = existingProofs.map((p) => p.secret).toSet();

    int totalAmount = 0;

    for (final entry in recoveredByUnit.entries) {
      final unit = entry.key;
      final proofs = entry.value;

      // Filter out proofs that already exist
      final newProofs =
          proofs.where((p) => !existingSecrets.contains(p.secret)).toList();

      if (newProofs.isNotEmpty) {
        final eventId = await NostrCashuFunctions.shared.sendTokenEvent(
          mintUrl: mintURL,
          unit: unit,
          proofs: newProofs,
        );

        if (eventId != null) {
          totalAmount += newProofs.fold(0, (sum, p) => sum + p.amountNum);
        }
      }
    }

    if (totalAmount > 0) {
      final mint = await CashuManager.shared.getMint(mintURL);
      if (mint != null) {
        await CashuManager.shared.updateMintBalance(mint);
      }
    }

    return totalAmount;
  }

  Future<CashuResponse<void>> swapMintFunds({
    required String fromMintURL,
    required String toMintURL,
    required int amount,
    String unit = 'sat',
    void Function(CashuActionsStatus status)? onStatusUpdate,
  }) async {
    final fromMint = await getMint(fromMintURL);
    final toMint = await getMint(toMintURL);

    if (fromMint == null || toMint == null) {
      return CashuResponse.fromErrorMsg('Mint not found');
    }

    // 1. Create invoice at destination mint
    onStatusUpdate?.call(CashuActionsStatus.requestingMintQuote);
    final invoiceReceipt = await TransactionHelper.requestCreateInvoice(
      mint: toMint,
      amount: amount,
    );
    if (invoiceReceipt == null) {
      return CashuResponse.fromErrorMsg(
          'Failed to create invoice at destination mint');
    }

    // 2. Get melt quote at source mint to know fee
    onStatusUpdate?.call(CashuActionsStatus.requestingMeltQuote);
    final quoteResponse = await Nut5.requestMeltQuote(
      mintURL: fromMintURL,
      request: invoiceReceipt.request,
      unit: unit,
    );
    if (!quoteResponse.isSuccess) return quoteResponse.cast<void>();

    final fee = int.tryParse(quoteResponse.data.fee) ?? 0;
    final totalNeeded = amount + fee;

    // 3. Pick tokens and proofs to cover the cost
    onStatusUpdate?.call(CashuActionsStatus.selectingTokens);
    final savedTokens = await db.getCashuTokensByFilter(
      mintURL: fromMintURL,
      pubkey: pubkey,
    );

    int gathered = 0;
    final tokensToSpend = <CashuTokenData>[];
    final proofsToSpend = <Proof>[];
    final unusedProofsAtSource = <Proof>[];

    for (var token in savedTokens) {
      if (token.unit != unit) continue;
      tokensToSpend.add(token);

      for (var proof in token.proofs) {
        if (gathered < totalNeeded) {
          proofsToSpend.add(proof);
          gathered += proof.amountNum;
        } else {
          unusedProofsAtSource.add(proof);
        }
      }

      if (gathered >= totalNeeded) break;
    }

    if (gathered < totalNeeded) {
      return CashuResponse.fromErrorMsg('Insufficient balance');
    }

    // 4. Perform the melt at source mint
    onStatusUpdate?.call(CashuActionsStatus.melting);
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

    if (!meltResult.isSuccess) return meltResult.cast<void>();

    final (_, changeProofs) = meltResult.data;
    // 5. Broadcast consolidated event for source mint (Spent + Change/Unused)
    onStatusUpdate?.call(CashuActionsStatus.broadcastingSpent);
    final totalOutputsAtSource = [...changeProofs, ...unusedProofsAtSource];
    final spentTokenEventIds = tokensToSpend.map((e) => e.id).toList();

    final eventIdSource = await NostrCashuFunctions.shared.sendTokenEvent(
      mintUrl: fromMintURL,
      unit: unit,
      proofs: totalOutputsAtSource,
      deletedTokenIds: spentTokenEventIds,
      deleteTokens: true,
    );

    if (eventIdSource != null) {
      final tokenStates = <String, CashuTokenStatus>{};
      for (final id in spentTokenEventIds) {
        tokenStates[id] = CashuTokenStatus.destroyed;
      }
      tokenStates[eventIdSource] = CashuTokenStatus.created;

      await NostrCashuFunctions.shared.sendSpendingEvent(
        amount: amount + fee,
        unit: unit,
        tokenStates: tokenStates,
        direction: CashuSpendingDirection.outgoing,
      );
    }

    // Hard delete source token events from relays
    await NostrCashuFunctions.shared.broadcastDeletion(
      spentTokenEventIds.where((id) => id.isNotEmpty).toList(),
    );

    // 7. Mint tokens at destination mint
    onStatusUpdate?.call(CashuActionsStatus.minting);

    final mintResponse = await TransactionHelper.requestTokensFromMint(
      mint: toMint,
      quoteID: invoiceReceipt.redemptionKey,
      amount: amount,
      unit: unit,
      invoice: invoiceReceipt.request,
    );

    if (!mintResponse.isSuccess) {
      return mintResponse.cast<void>();
    }

    // 8. Broadcast the new tokens at destination
    onStatusUpdate?.call(CashuActionsStatus.broadcastingNew);
    final eventIdDest = await NostrCashuFunctions.shared.sendTokenEvent(
      mintUrl: toMintURL,
      unit: unit,
      proofs: mintResponse.data,
    );

    if (eventIdDest != null) {
      await NostrCashuFunctions.shared.sendSpendingEvent(
        amount: amount,
        unit: unit,
        tokenStates: {eventIdDest: CashuTokenStatus.created},
        direction: CashuSpendingDirection.incoming,
      );
    }

    // 9. Update balances locally
    onStatusUpdate?.call(CashuActionsStatus.finalizing);
    await updateMintBalance(fromMint);
    await updateMintBalance(toMint);

    await updateMintBalance(toMint);

    return CashuResponse.fromSuccessData(null);
  }

  Future<CashuMintWebSocket> _getStartWebSocket(String mintURL) async {
    final url = MintHelper.getMintURL(mintURL);
    if (_wsConnections.containsKey(url)) {
      final ws = _wsConnections[url]!;
      if (!ws.isConnected) ws.connect();
      return ws;
    }
    final ws = CashuMintWebSocket(url);
    ws.connect();
    _wsConnections[url] = ws;
    return ws;
  }

  Future<Stream<QuoteState>> subscribeToMintQuote({
    required String mintURL,
    required String quoteID,
  }) async {
    final ws = await _getStartWebSocket(mintURL);
    logger.d('[CashuManager] Subscribing to mint quote: $quoteID at $mintURL');
    final rawStream = await ws.subscribe(Nut17.kindBolt11MintQuote, [quoteID]);

    return rawStream.map((event) {
      logger.i(event);
      // Parse event to QuoteState
      // Expecting payload to contain invoice details
      final quote = event['quote'] as String? ?? quoteID;
      final request = event['request'] as String? ?? '';
      final paid = event['state'] == 'PAID';
      final expiry = event['expiry'] as int? ?? 0;

      return (quote, request, paid, expiry);
    });
  }

  Future<CashuResponse<Receipt>> createDepositInvoice({
    required String mintURL,
    required int amount,
    void Function(CashuActionsStatus status)? onStatusUpdate,
  }) async {
    final mint = await getMint(mintURL);
    onStatusUpdate?.call(CashuActionsStatus.mintInfo);
    if (mint == null) return CashuResponse.fromErrorMsg('Mint not found');

    onStatusUpdate?.call(CashuActionsStatus.generatingInvoice);
    final receipt = await TransactionHelper.requestCreateInvoice(
      mint: mint,
      amount: amount,
    );

    if (receipt == null) {
      return CashuResponse.fromErrorMsg('Failed to create invoice');
    }
    return CashuResponse.fromSuccessData(receipt);
  }

  Future<CashuResponse<void>> completeDeposit({
    required String mintURL,
    required String quoteID,
    required int amount,
    String unit = 'sat',
    void Function(CashuActionsStatus status)? onStatusUpdate,
  }) async {
    final mint = await getMint(mintURL);
    if (mint == null) return CashuResponse.fromErrorMsg('Mint not found');

    onStatusUpdate?.call(CashuActionsStatus.minting);
    final mintResponse = await TransactionHelper.requestTokensFromMint(
      mint: mint,
      quoteID: quoteID,
      amount: amount,
      unit: unit,
    );

    if (!mintResponse.isSuccess) return mintResponse.cast<void>();

    onStatusUpdate?.call(CashuActionsStatus.broadcastingNew);
    final eventId = await NostrCashuFunctions.shared.sendTokenEvent(
      mintUrl: mintURL,
      unit: unit,
      proofs: mintResponse.data,
    );

    if (eventId != null) {
      await NostrCashuFunctions.shared.sendSpendingEvent(
        amount: amount,
        unit: unit,
        tokenStates: {eventId: CashuTokenStatus.created},
        direction: CashuSpendingDirection.incoming,
      );
    }

    onStatusUpdate?.call(CashuActionsStatus.finalizing);
    await updateMintBalance(mint);
    return CashuResponse.fromSuccessData(null);
  }

  Future<CashuResponse<void>> depositWithToken({
    required String ecashString,
    required String targetMintURL,
    String unit = 'sat',
    void Function(CashuActionsStatus status)? onStatusUpdate,
  }) async {
    final token = Nut0.decodedToken(ecashString);
    if (token == null) return CashuResponse.fromErrorMsg('Invalid token');
    if (token.entries.isEmpty) {
      return CashuResponse.fromErrorMsg('Token is empty');
    }

    final targetMint = await getMint(targetMintURL);
    if (targetMint == null) {
      return CashuResponse.fromErrorMsg('Target mint not found');
    }

    final entry = token.entries.first;
    final sourceMintURL = entry.mint;
    final proofs = entry.proofs;
    final totalAmount = proofs.totalAmount;

    if (sourceMintURL == targetMintURL) {
      onStatusUpdate?.call(CashuActionsStatus.melting);
      final response = await ProofHelper.swapProofs(
        mint: targetMint,
        proofs: proofs,
        unit: unit,
      );
      if (!response.isSuccess) return response.cast<void>();

      onStatusUpdate?.call(CashuActionsStatus.broadcastingNew);
      final eventId = await NostrCashuFunctions.shared.sendTokenEvent(
        mintUrl: targetMintURL,
        unit: unit,
        proofs: response.data,
      );

      if (eventId != null) {
        await NostrCashuFunctions.shared.sendSpendingEvent(
          amount: totalAmount,
          unit: unit,
          tokenStates: {eventId: CashuTokenStatus.created},
          direction: CashuSpendingDirection.incoming,
        );
      }

      onStatusUpdate?.call(CashuActionsStatus.finalizing);

      await updateMintBalance(targetMint);

      return CashuResponse.fromSuccessData(null);
    } else {
      // For cross-mint deposits, we need to account for the melt fee
      // First, create a temporary invoice to estimate the fee
      onStatusUpdate?.call(CashuActionsStatus.requestingMintQuote);
      final tempInvoice = await TransactionHelper.requestCreateInvoice(
        mint: targetMint,
        amount: totalAmount,
      );
      if (tempInvoice == null) {
        return CashuResponse.fromErrorMsg(
            'Failed to create destination invoice');
      }

      final sourceMint = await getMint(sourceMintURL);
      if (sourceMint == null) {
        return CashuResponse.fromErrorMsg('Source mint not found');
      }

      // Get the melt quote to know the fee
      onStatusUpdate?.call(CashuActionsStatus.requestingMeltQuote);
      final tempQuoteResponse = await Nut5.requestMeltQuote(
        mintURL: sourceMintURL,
        request: tempInvoice.request,
        unit: unit,
      );
      if (!tempQuoteResponse.isSuccess) return tempQuoteResponse.cast<void>();

      final estimatedFee = int.tryParse(tempQuoteResponse.data.fee) ?? 0;

      // Check if we have enough to cover any amount after fees
      if (totalAmount <= estimatedFee) {
        return CashuResponse.fromErrorMsg(
            'Token amount ($totalAmount sats) too small to cover melt fee ($estimatedFee sats)');
      }

      // Calculate the actual amount we can send to destination after fees
      final destinationAmount = totalAmount - estimatedFee;

      // Create the actual invoice for the reduced amount
      final invoiceReceipt = await TransactionHelper.requestCreateInvoice(
        mint: targetMint,
        amount: destinationAmount,
      );
      if (invoiceReceipt == null) {
        return CashuResponse.fromErrorMsg(
            'Failed to create destination invoice');
      }

      // Get the actual melt quote for the real invoice
      final quoteResponse = await Nut5.requestMeltQuote(
        mintURL: sourceMintURL,
        request: invoiceReceipt.request,
        unit: unit,
      );
      if (!quoteResponse.isSuccess) return quoteResponse.cast<void>();

      final fee = int.tryParse(quoteResponse.data.fee) ?? 0;
      final invoiceAmount = int.tryParse(quoteResponse.data.amount) ?? 0;

      // Verify we have enough to cover the invoice + fee
      if (totalAmount < invoiceAmount + fee) {
        return CashuResponse.fromErrorMsg(
            'Insufficient funds: need ${invoiceAmount + fee} sats ($invoiceAmount + $fee fee), have $totalAmount sats');
      }

      onStatusUpdate?.call(CashuActionsStatus.melting);
      final meltResult = await TransactionHelper.payingTheQuote(
        mint: sourceMint,
        paymentId: quoteResponse.data.quote,
        amount: invoiceAmount,
        fee: fee,
        proofs: proofs,
        historyValue: invoiceReceipt.request,
        unit: unit,
        meltAction: Nut8.payingTheQuote,
      );

      if (!meltResult.isSuccess) return meltResult.cast<void>();

      final (_, changeProofs) = meltResult.data;

      if (changeProofs.isNotEmpty) {
        final changeEventId = await NostrCashuFunctions.shared.sendTokenEvent(
          mintUrl: sourceMintURL,
          unit: unit,
          proofs: changeProofs,
        );

        if (changeEventId != null) {
          await NostrCashuFunctions.shared.sendSpendingEvent(
            amount: totalAmount,
            unit: unit,
            tokenStates: {changeEventId: CashuTokenStatus.created},
            direction: CashuSpendingDirection.incoming,
          );
        }
      }

      onStatusUpdate?.call(CashuActionsStatus.minting);

      final mintResponse = await TransactionHelper.requestTokensFromMint(
        mint: targetMint,
        quoteID: invoiceReceipt.redemptionKey,
        amount: totalAmount - fee,
        unit: unit,
        invoice: invoiceReceipt.request,
      );

      if (!mintResponse.isSuccess) return mintResponse.cast<void>();

      onStatusUpdate?.call(CashuActionsStatus.broadcastingNew);
      final eventIdDest = await NostrCashuFunctions.shared.sendTokenEvent(
        mintUrl: targetMintURL,
        unit: unit,
        proofs: mintResponse.data,
      );

      onStatusUpdate?.call(CashuActionsStatus.broadcastingSpent);
      if (eventIdDest != null) {
        await NostrCashuFunctions.shared.sendSpendingEvent(
          amount: totalAmount - fee,
          unit: unit,
          tokenStates: {eventIdDest: CashuTokenStatus.created},
          direction: CashuSpendingDirection.incoming,
        );
      }

      onStatusUpdate?.call(CashuActionsStatus.finalizing);
      await updateMintBalance(targetMint);
      return CashuResponse.fromSuccessData(null);
    }
  }

  Future<CashuResponse<void>> payInvoice({
    required String mintURL,
    required String invoice,
    String unit = 'sat',
    void Function(CashuActionsStatus status)? onStatusUpdate,
  }) async {
    final mint = await getMint(mintURL);
    if (mint == null) return CashuResponse.fromErrorMsg('Mint not found');

    // 1. Get melt quote
    onStatusUpdate?.call(CashuActionsStatus.requestingMeltQuote);
    final quoteResponse = await Nut5.requestMeltQuote(
      mintURL: mintURL,
      request: invoice,
      unit: unit,
    );
    if (!quoteResponse.isSuccess) return quoteResponse.cast<void>();

    final fee = int.tryParse(quoteResponse.data.fee) ?? 0;
    final amount = int.tryParse(quoteResponse.data.amount) ?? 0;
    final totalNeeded = amount + fee;

    // 2. Pick tokens
    onStatusUpdate?.call(CashuActionsStatus.selectingTokens);
    final savedTokens = await db.getCashuTokensByFilter(
      mintURL: mintURL,
      pubkey: pubkey,
    );

    int gathered = 0;
    final tokensToSpend = <CashuTokenData>[];
    final proofsToSpend = <Proof>[];
    final unusedProofs = <Proof>[];

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
      return CashuResponse.fromErrorMsg('Insufficient balance');
    }

    // 3. Perform melt
    onStatusUpdate?.call(CashuActionsStatus.melting);
    final meltResult = await TransactionHelper.payingTheQuote(
      mint: mint,
      paymentId: quoteResponse.data.quote,
      amount: amount,
      fee: fee,
      proofs: proofsToSpend,
      historyValue: invoice,
      unit: unit,
      meltAction: Nut8.payingTheQuote,
    );

    if (!meltResult.isSuccess) return meltResult.cast<void>();

    final (_, changeProofs) = meltResult.data;

    // 4. Broadcast to Nostr
    onStatusUpdate?.call(CashuActionsStatus.broadcastingSpent);
    final totalOutputs = [...changeProofs, ...unusedProofs];
    final spentTokenEventIds = tokensToSpend.map((e) => e.id).toList();

    final eventId = await NostrCashuFunctions.shared.sendTokenEvent(
      mintUrl: mintURL,
      unit: unit,
      proofs: totalOutputs,
      deletedTokenIds: spentTokenEventIds,
      deleteTokens: true,
    );

    if (eventId != null) {
      final tokenStates = <String, CashuTokenStatus>{};
      for (final id in spentTokenEventIds) {
        tokenStates[id] = CashuTokenStatus.destroyed;
      }
      tokenStates[eventId] = CashuTokenStatus.created;

      await NostrCashuFunctions.shared.sendSpendingEvent(
        amount: amount + fee,
        unit: unit,
        tokenStates: tokenStates,
        direction: CashuSpendingDirection.outgoing,
      );
    }

    onStatusUpdate?.call(CashuActionsStatus.finalizing);
    await updateMintBalance(mint);

    return CashuResponse.fromSuccessData(null);
  }

  Future<CashuResponse<String>> createCashuToken({
    required String mintURL,
    required int amount,
    String memo = '',
    String unit = 'sat',
    void Function(CashuActionsStatus status)? onStatusUpdate,
  }) async {
    final mint = await getMint(mintURL);
    if (mint == null) return CashuResponse.fromErrorMsg('Mint not found');
    onStatusUpdate?.call(CashuActionsStatus.selectingTokens);

    // 1. Get tokens from DB (CashuTokenData)
    final savedTokens = await db.getCashuTokensByFilter(
      mintURL: mintURL,
      pubkey: pubkey,
    );

    // 1.1 Filter out tokens that are already spent (not in ProofStore)
    final validProofs = await ProofHelper.getProofs(mintURL);
    final validSecrets = validProofs.map((p) => p.secret).toSet();

    // 2. Select proofs to cover amount + fee
    final keysetInfo = await KeysetHelper.tryGetMintKeysetInfo(mint, unit);
    if (keysetInfo == null) {
      return CashuResponse.fromErrorMsg('Keyset not found');
    }
    final inputFeePPK = keysetInfo.inputFeePPK;

    final proofsToSpend = <Proof>[];
    final selectedTokenEvents = <CashuTokenData>[];
    int gathered = 0;
    int fee = 0;

    final unusedProofs = <Proof>[];
    for (var token in savedTokens) {
      if (token.unit != unit) continue;
      // Check validation
      if (!token.proofs.every((p) => validSecrets.contains(p.secret))) continue;

      selectedTokenEvents.add(token);

      for (var proof in token.proofs) {
        if (gathered < amount + fee) {
          proofsToSpend.add(proof);
          gathered += proof.amountNum;
          fee = (proofsToSpend.length * inputFeePPK + 999) ~/ 1000;
        } else {
          unusedProofs.add(proof);
        }
      }

      if (gathered >= amount + fee) break;
    }

    if (gathered < amount + fee) {
      return CashuResponse.fromErrorMsg('Insufficient balance');
    }

    // 3. Swap (Melt -> Mint)
    onStatusUpdate?.call(CashuActionsStatus.melting);

    // Prepare Blinded Messages
    final (blindedTarget, secretsTarget, rsTarget, _) =
        DhkeHelper.createBlindedMessages(
      keysetId: keysetInfo.id,
      amount: amount,
    );

    List<BlindedMessage> blindedChange = [];
    List<String> secretsChange = [];
    List<BigInt> rsChange = [];

    // Recalculate Change
    final realChangeAmount = gathered - amount - fee;

    if (realChangeAmount > 0) {
      final res = DhkeHelper.createBlindedMessages(
        keysetId: keysetInfo.id,
        amount: realChangeAmount,
      );
      blindedChange = res.$1;
      secretsChange = res.$2;
      rsChange = res.$3;
    }

    final allBlinded = [...blindedTarget, ...blindedChange];
    final allSecrets = [...secretsTarget, ...secretsChange];
    final allRs = [...rsTarget, ...rsChange];

    final swapResponse = await mint.swapAction(
      mintURL: mint.mintURL,
      proofs: proofsToSpend,
      outputs: allBlinded,
    );

    if (!swapResponse.isSuccess) return swapResponse.cast<String>();

    // Unblind
    final unblindingResponse =
        await ProofBlindingManager.shared.unblindingBlindedSignature((
      mint,
      unit,
      swapResponse.data,
      allSecrets,
      allRs,
      [], // options
      ProofBlindingAction.multiMintSwap,
      '',
    ));

    if (!unblindingResponse.isSuccess) return unblindingResponse.cast<String>();

    final allNewProofs = unblindingResponse.data;

    // Split proofs
    final targetProofs = allNewProofs.sublist(0, blindedTarget.length);
    final changeProofs = allNewProofs.sublist(blindedTarget.length);

    // 4. Update Nostr
    onStatusUpdate?.call(CashuActionsStatus.broadcastingSpent);

    final deletedIds = selectedTokenEvents.map((e) => e.id).toList();
    final tokenStates = <String, CashuTokenStatus>{};

    // Mark inputs as destroyed
    for (final id in deletedIds) {
      tokenStates[id] = CashuTokenStatus.destroyed;
    }

    final totalChangeProofs = [...changeProofs, ...unusedProofs];
    if (totalChangeProofs.isNotEmpty) {
      // Send Change Token Event
      final eventId = await NostrCashuFunctions.shared.sendTokenEvent(
        mintUrl: mintURL,
        unit: unit,
        proofs: totalChangeProofs,
        deletedTokenIds: deletedIds,
        deleteTokens: true,
      );

      if (eventId != null) {
        tokenStates[eventId] = CashuTokenStatus.created;
      }
    } else {
      // No change, just delete inputs
      await NostrCashuFunctions.shared.broadcastDeletion(deletedIds);
    }

    await NostrCashuFunctions.shared.sendSpendingEvent(
      amount: amount + fee,
      unit: unit,
      tokenStates: tokenStates,
      direction: CashuSpendingDirection.outgoing,
    );

    onStatusUpdate?.call(CashuActionsStatus.finalizing);
    await updateMintBalance(mint);

    // Encode Target
    final encodedToken = Nut0.encodedToken(
      Token(
        entries: [TokenEntry(mint: mint.mintURL, proofs: targetProofs)],
        memo: memo,
        unit: unit,
      ),
    );

    return CashuResponse.fromSuccessData(encodedToken);
  }

  /// Syncs local tokens for a mint with Nostr by broadcasting a Kind 7375 event.
  /// This is a fallback/helper to ensure Nostr state matches local state after complex operations.
  Future<void> syncTokensWithNostr({
    required IMint mint,
    required String unit,
  }) async {
    final tokens = await db.getCashuTokensByFilter(
      mintURL: mint.mintURL,
      pubkey: pubkey,
    );

    final proofs = tokens.expand((e) => e.proofs).toList();

    // Soft delete all existing token events for this mint to "reset"
    final eventIds = tokens.map((e) => e.id).toList();

    await NostrCashuFunctions.shared.sendTokenEvent(
      mintUrl: mint.mintURL,
      unit: unit,
      proofs: proofs,
      deletedTokenIds: eventIds,
      deleteTokens: true,
    );
  }

  /// Resyncs the mint by fetching all tokens from Nostr, verifying their state,
  /// and ensuring no token contains spent proofs. If a token has spent proofs (dirty),
  /// it is replaced by a new token containing only the valid proofs.
  Future<CashuResponse<void>> resyncMint({
    required String mintURL,
    void Function(CashuActionsStatus status)? onStatusUpdate,
  }) async {
    final mint = await getMint(mintURL);
    if (mint == null) return CashuResponse.fromErrorMsg('Mint not found');

    onStatusUpdate?.call(CashuActionsStatus.mintInfo);

    // 1. Sync Nostr Events (Tokens & History)
    await NostrCashuFunctions.shared.syncMintTokens(mintURL);

    // 2. Get All Tokens for this Mint
    final tokens =
        await db.getCashuTokensByFilter(mintURL: mintURL, pubkey: pubkey);
    if (tokens.isEmpty) return CashuResponse.fromSuccessData(null);

    final allProofs = tokens.expand((t) => t.proofs).toList();
    if (allProofs.isEmpty) return CashuResponse.fromSuccessData(null);

    // 3. Check Proofs Status with Mint
    onStatusUpdate?.call(CashuActionsStatus.checkingProofs);

    // We trust the mint's response over any local state.
    final checkResponse =
        await mint.tokenCheckAction(mintURL: mintURL, proofs: allProofs);
    if (!checkResponse.isSuccess) {
      return checkResponse.cast();
    }

    if (checkResponse.data.length != allProofs.length) {
      return CashuResponse.fromErrorMsg('State check length mismatch');
    }

    // 4. Identify and Clean Dirty Tokens (SAT only)
    onStatusUpdate?.call(CashuActionsStatus.broadcastingNew);

    // Map usage for O(1) lookup: Proof Secret -> TokenState
    final proofStateMap = <String, TokenState>{};
    for (int i = 0; i < allProofs.length; i++) {
      proofStateMap[allProofs[i].secret] = checkResponse.data[i];
    }

    final dirtySatTokens = <CashuTokenData>[];
    for (var token in tokens) {
      if (token.unit == 'sat' &&
          token.proofs
              .any((p) => proofStateMap[p.secret] == TokenState.burned)) {
        dirtySatTokens.add(token);
      }
    }

    if (dirtySatTokens.isNotEmpty) {
      final unit = 'sat';
      final tokenIds = dirtySatTokens.map((e) => e.id).toList();

      // Calculate amounts for history
      int burnedAmount = 0;
      final validProofs = <Proof>[];

      for (var t in dirtySatTokens) {
        final burnedProofsInToken = t.proofs
            .where((p) => proofStateMap[p.secret] == TokenState.burned)
            .toList();
        for (var p in burnedProofsInToken) {
          burnedAmount += p.amountNum;
        }

        validProofs.addAll(t.proofs
            .where((p) => proofStateMap[p.secret] != TokenState.burned));
      }

      final tokenStates = <String, CashuTokenStatus>{};
      for (var id in tokenIds) {
        tokenStates[id] = CashuTokenStatus.destroyed;
      }

      String? newTokenId;
      if (validProofs.isNotEmpty) {
        // Create new token event covering these valid proofs, and deleting the old tokens
        newTokenId = await NostrCashuFunctions.shared.sendTokenEvent(
          mintUrl: mintURL,
          unit: unit,
          proofs: validProofs,
          deletedTokenIds: tokenIds,
          deleteTokens: true,
        );

        if (newTokenId != null) {
          tokenStates[newTokenId] = CashuTokenStatus.created;
        }
      } else {
        // Always broadcast deletion for dirty tokens
        await NostrCashuFunctions.shared.broadcastDeletion(tokenIds);
      }

      // Record spending history if there was a burn or change
      if (burnedAmount > 0 || newTokenId != null) {
        await NostrCashuFunctions.shared.sendSpendingEvent(
          amount: burnedAmount > 0 ? burnedAmount : 0,
          unit: unit,
          tokenStates: tokenStates,
          direction: CashuSpendingDirection.outgoing,
        );
      }
    }

    // Update balance
    onStatusUpdate?.call(CashuActionsStatus.finalizing);
    await updateMintBalance(mint);

    return CashuResponse.fromSuccessData(null);
  }

  /// Sends a NutZap (NIP-61) to the specified Npub/Pubkey.
  /// 1. Fetches NutZap info (Kind 10019).
  /// 2. Selects a common mint.
  /// 3. Creates a P2PK-locked token.
  /// 4. Sends the token via Nostr.
  Future<CashuResponse<String>> sendNutzap({
    required String pubkey,
    required int amount,
    required String mintUrl,
    String unit = 'sat',
    String memo = '',
    void Function(CashuActionsStatus status)? onStatusUpdate,
  }) async {
    // 1. Fetch NutZap Info
    onStatusUpdate?.call(CashuActionsStatus.mintInfo);
    final info =
        await NostrCashuFunctions.shared.fetchNutzapInformation(pubkey);

    if (info == null) {
      return CashuResponse.fromErrorMsg(
          'No wallet configuration can be found for this user');
    }

    if (info.P2PkPubkey == null) {
      return CashuResponse.fromErrorMsg(
          'Recipient has no P2PK pubkey configured');
    }

    // 2. Determine Target Mint strategy
    final sourceMintUrl = mintUrl;

    // Check if recipient accepts source Mint
    final recipientAcceptsSource = info.mints.containsKey(sourceMintUrl) &&
        info.mints[sourceMintUrl]!.contains(unit);

    String targetMintUrl;
    bool isCrossMint = false;

    if (recipientAcceptsSource) {
      targetMintUrl = sourceMintUrl;
    } else {
      // "Other than that we send to the first one"
      // Select the first mint from recipient's list that supports the unit
      // final compatibleDestMint = info.mints.entries
      //     .where((e) => e.value.contains(unit))
      //     .firstOrNull
      //     ?.key;

      // if (compatibleDestMint == null) {
      //   return CashuResponse.fromErrorMsg(
      //       'Recipient accepts no mints for unit $unit');
      // }

      targetMintUrl = info.mints.keys.first;
      isCrossMint = true;
    }
    // 3. Execution based on strategy
    if (!isCrossMint) {
      return NutzapHelper.sendNutzapSameMint(
        pubkey: pubkey,
        amount: amount,
        mintUrl: sourceMintUrl,
        p2pkPubkey: info.P2PkPubkey!,
        unit: unit,
        memo: memo,
        onStatusUpdate: onStatusUpdate,
      );
    } else {
      return NutzapHelper.sendNutzapCrossMint(
        pubkey: pubkey,
        amount: amount,
        sourceMintUrl: sourceMintUrl,
        targetMintUrl: targetMintUrl,
        p2pkPubkey: info.P2PkPubkey!,
        unit: unit,
        memo: memo,
        onStatusUpdate: onStatusUpdate,
      );
    }
  }

  /// Swaps P2PK-locked proofs into the local wallet.
  /// 1. Signs the P2PK proofs.
  /// 2. Performs a swap at the mint into fresh local proofs.
  /// 3. Unblinds and stores the new proofs locally.
  /// 4. Broadcasts a new Kind 7375 token event to Nostr.
  /// 5. Records the spending history (Incoming/Redeemed).
  Future<CashuResponse<List<Proof>>> redeemP2PKProofs({
    required IMint mint,
    required List<Proof> proofs,
    required String unit,
    required String originalEventId,
    void Function(CashuActionsStatus status)? onStatusUpdate,
  }) async {
    // 1. Prepare fresh outputs for swap
    final totalAmount = proofs.fold(0, (sum, p) => sum + p.amountNum);
    final keysetInfo = await KeysetHelper.tryGetMintKeysetInfo(mint, unit);
    if (keysetInfo == null) {
      return CashuResponse.fromErrorMsg('Keyset not found for unit $unit');
    }

    final (blindedMessages, secrets, rs, _) = DhkeHelper.createBlindedMessages(
      keysetId: keysetInfo.id,
      amount: totalAmount,
    );

    // 2. Signing for P2PK
    onStatusUpdate?.call(CashuActionsStatus.checkingProofs);

    for (var proof in proofs) {
      final nut10Data = Nut10Secret.dataFromSecretString(proof.secret);
      if (nut10Data != null && nut10Data.$1 == ConditionType.p2pk) {
        final p2pkSecret = P2PKSecret.fromNut10Data(nut10Data);

        await WitnessHelper.addP2PKWitnessToProof(
          proof: proof,
          secret: p2pkSecret,
          allInputs: proofs,
          allOutputs: blindedMessages,
        );
      }
    }

    // 3. Perform Swap
    onStatusUpdate?.call(CashuActionsStatus.minting);
    final swapResponse = await mint.swapAction(
      mintURL: mint.mintURL,
      proofs: proofs,
      outputs: blindedMessages,
    );

    if (!swapResponse.isSuccess) return swapResponse.cast();

    // 4. Unblind & Store locally
    final unblindingResponse =
        await ProofBlindingManager.shared.unblindingBlindedSignature((
      mint,
      unit,
      swapResponse.data,
      secrets,
      rs,
      List.generate(blindedMessages.length,
          (_) => const UnblindingOption(isSaveToLocal: true)),
      ProofBlindingAction.multiMintSwap,
      '',
    ));

    if (!unblindingResponse.isSuccess) return unblindingResponse.cast();

    final newProofs = unblindingResponse.data;

    // 5. Create Nostr Token Event (Sync local state with Nostr)
    onStatusUpdate?.call(CashuActionsStatus.broadcastingNew);
    final eventId = await NostrCashuFunctions.shared.sendTokenEvent(
      mintUrl: mint.mintURL,
      unit: unit,
      proofs: newProofs,
    );

    // 6. Record Spending History (Incoming)
    final tokenStates = <String, CashuTokenStatus>{};

    if (eventId != null) {
      tokenStates[eventId] = CashuTokenStatus.created;
    }
    if (originalEventId.isNotEmpty) {
      tokenStates[originalEventId] = CashuTokenStatus.redeemed;
    }

    await NostrCashuFunctions.shared.sendSpendingEvent(
      amount: totalAmount,
      unit: unit,
      tokenStates: tokenStates,
      direction: CashuSpendingDirection.incoming,
    );

    onStatusUpdate?.call(CashuActionsStatus.finalizing);
    await updateMintBalance(mint);

    return CashuResponse.fromSuccessData(newProofs);
  }

  /// Redeems a NutZap (NIP-61) event.
  /// 1. Parses the NutZap event tags.
  /// 2. Delegates the redemption to [redeemP2PKProofs].
  Future<CashuResponse<void>> redeemNutzap({
    required Event nutzapEvent,
    void Function(CashuActionsStatus status)? onStatusUpdate,
  }) async {
    // 1. Parsing tags (Nutzap Specific)
    final (mintUrl, unit, proofs) = NutzapHelper.parseNutzapEvent(nutzapEvent);

    if (proofs.isEmpty) {
      return CashuResponse.fromErrorMsg('No proofs found in nutzap event');
    }

    if (mintUrl == null) {
      return CashuResponse.fromErrorMsg('No mint URL found in nutzap event');
    }

    final unitVal = unit ?? 'sat';

    final mint = await getMint(mintUrl);
    if (mint == null) {
      return CashuResponse.fromErrorMsg('Mint $mintUrl not found locally');
    }

    // 2. Delegate redemption to CashuManager logic
    final res = await redeemP2PKProofs(
      mint: mint,
      proofs: proofs,
      unit: unitVal,
      originalEventId: nutzapEvent.id,
      onStatusUpdate: onStatusUpdate,
    );

    return res.cast<void>();
  }

  void addListener(CashuListener listener) {
    _listeners.add(listener);
  }

  void removeListener(CashuListener listener) {
    _listeners.remove(listener);
  }

  void notifyListenerForPaidSuccess(Receipt receipt) {
    for (var e in _listeners) {
      e.handleInvoicePaid(receipt);
    }
  }

  void notifyListenerForBalanceChanged(IMint mint) {
    for (var e in _listeners) {
      e.handleBalanceChanged(mint);
    }
  }

  void notifyListenerForMintListChanged() {
    for (var e in _listeners) {
      e.handleMintListChanged(mints.values.toList());
    }
  }

  void notifyListenerForPaymentCompleted(String paymentKey) {
    for (var e in _listeners) {
      e.handlePaymentCompleted(paymentKey);
    }
  }

  void notifyListenerForHistoryChanged() {
    for (var e in _listeners) {
      e.handleHistoryChanged();
    }
  }

  // Future<CashuResponse<void>> sendP2PKToken({
  //   required String recipientPubkey,
  //   required String mintURL,
  //   required int amount,
  //   String unit = 'sat',
  //   void Function(CashuActionsStatus status)? onStatusUpdate,
  // }) async {
  //   final mint = await getMint(mintURL);
  //   if (mint == null) return CashuResponse.fromErrorMsg('Mint not found');

  //   // 1. Swap tokens to lock them to recipient's P2PK
  //   onStatusUpdate?.call(CashuActionsStatus.selectingTokens);
  //   final response = await ProofHelper.getProofsForECash(
  //     mint: mint,
  //     proofRequest: ProofRequest.proofs(null, amount),
  //     unit: unit,
  //     customSecret: P2PKSecret.fromOptions(
  //       receivePubKeys: [recipientPubkey],
  //     ),
  //   );
  //   if (!response.isSuccess) return response.cast();

  //   final p2pkProofs = response.data;

  //   // 3. Broadcast to recipient via Nostr
  //   onStatusUpdate?.call(CashuActionsStatus.broadcastingNew);
  //   final eventId = await NostrCashuFunctions.shared.sendTokenToPubkey(
  //     recipientPubkey: recipientPubkey,
  //     mintUrl: mintURL,
  //     unit: unit,
  //     proofs: p2pkProofs,
  //   );

  //   // 4. Sync our own state
  //   await syncTokensWithNostr(mint: mint, unit: unit);

  //   if (eventId != null) {
  //     await NostrCashuFunctions.shared.sendSpendingEvent(
  //       amount: amount,
  //       unit: unit,
  //       tokenStates: {eventId: CashuTokenStatus.created},
  //       direction: CashuSpendingDirection.outgoing,
  //     );
  //   }

  //   onStatusUpdate?.call(CashuActionsStatus.finalizing);
  //   await updateMintBalance(mint);

  //   return CashuResponse.fromSuccessData(null);
  // }

  // Future<CashuResponse<String?>> payPaymentRequest({
  //   required PaymentRequest request,
  //   void Function(CashuActionsStatus status)? onStatusUpdate,
  // }) async {
  //   final amount = request.amount;
  //   if (amount == null) {
  //     return CashuResponse.fromErrorMsg('Amount is missing in payment request');
  //   }

  //   final unit = request.unit ?? 'sat';

  //   // 1. Select Mint
  //   IMint? selectedMint;

  //   // First try mints specified in the request
  //   if (request.mints != null && request.mints!.isNotEmpty) {
  //     for (final mintUrl in request.mints!) {
  //       final mint = await getMint(mintUrl);
  //       if (mint != null && mint.balance >= amount) {
  //         selectedMint = mint;
  //         break;
  //       }
  //     }
  //   }

  //   // If no specific mint found or insufficient balance, try any mint with balance
  //   if (selectedMint == null) {
  //     for (final mint in mints.values) {
  //       if (request.mints != null && !request.mints!.contains(mint.mintURL)) {
  //         continue;
  //       }

  //       final proofs = await ProofHelper.getProofs(mint.mintURL);
  //       final balance = proofs.fold(0, (sum, p) => sum + p.amountNum);
  //       if (balance >= amount) {
  //         selectedMint = mint;
  //         break;
  //       }
  //     }
  //   }

  //   // If still no mint, try to find any mint with balance (ignoring request mints preference if strict match failed)
  //   if (selectedMint == null) {
  //     for (final mint in mints.values) {
  //       final proofs = await ProofHelper.getProofs(mint.mintURL);
  //       final balance = proofs.fold(0, (sum, p) => sum + p.amountNum);
  //       if (balance >= amount) {
  //         selectedMint = mint;
  //         break;
  //       }
  //     }
  //   }

  //   if (selectedMint == null) {
  //     return CashuResponse.fromErrorMsg(
  //         'No suitable mint found with sufficient balance');
  //   }

  //   // 2. Create Token (Send Ecash)
  //   onStatusUpdate?.call(CashuActionsStatus.selectingTokens);
  //   final response = await CashuAPIGeneralClient.sendEcash(
  //     mint: selectedMint,
  //     amount: amount,
  //     memo: request.description ?? '',
  //     unit: unit,
  //   );

  //   if (!response.isSuccess) return response.cast<String?>();
  //   final tokenString = response.data;

  //   // 3. Transport
  //   if (request.transports != null && request.transports!.isNotEmpty) {
  //     for (final transport in request.transports!) {
  //       if (transport.type == 'nostr') {
  //         onStatusUpdate?.call(CashuActionsStatus.broadcastingNew);
  //         // TODO: Implement Nostr DM sending
  //         // await NostrCashuFunctions.shared.sendDM(transport.target, tokenString);
  //       }
  //     }
  //   }

  //   return CashuResponse.fromSuccessData(tokenString);
  // }

  // Future<List<IMint>> _addDefaultMint() async {
  //   final result = <IMint>[];

  //   for (final mintURL in defaultMints) {
  //     final maxNutsVersion = await MintHelper.getMaxNutsVersion(mintURL);
  //     final mint = IMint(
  //       pubkey: pubkey,
  //       mintURL: mintURL,
  //       maxNutsVersion: maxNutsVersion,
  //     );
  //     await db.saveMints([mint]);
  //     result.add(mint);
  //   }

  //   return result;
  // }
}
