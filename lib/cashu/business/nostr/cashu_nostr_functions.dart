import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nostr_core_enhanced/cashu/business/wallet/cashu_manager.dart';
import 'package:nostr_core_enhanced/cashu/models/cashu_spending_data.dart';
import 'package:nostr_core_enhanced/cashu/models/cashu_token_data.dart';
import 'package:nostr_core_enhanced/cashu/models/cashu_wallet.dart';
import 'package:nostr_core_enhanced/cashu/models/proof.dart';
import 'package:nostr_core_enhanced/core/nostr_core_repository.dart';
import 'package:nostr_core_enhanced/nostr/event.dart';
import 'package:nostr_core_enhanced/nostr/event_signer/amber_event_signer.dart';
import 'package:nostr_core_enhanced/nostr/event_signer/bip340_event_signer.dart';
import 'package:nostr_core_enhanced/nostr/event_signer/event_signer.dart';
import 'package:nostr_core_enhanced/nostr/event_signer/keychain.dart';
import 'package:nostr_core_enhanced/utils/utils.dart';

import '../../../nostr/filter.dart';
import '../../models/nutzap_information_event.dart';

class NostrCashuFunctions {
  static final NostrCashuFunctions shared = NostrCashuFunctions._internal();
  NostrCashuFunctions._internal();

  late NostrCore nc;
  late String pubkey;

  void setup(NostrCore nc, String pubkey) {
    this.nc = nc;
    this.pubkey = pubkey;
  }

  Future<void> initializeData() async {
    final tokens = await nc.db.getCashuTokensByFilter(pubkey: pubkey);
    final spendings = await nc.db.getCashuSpendingsByPubkey(pubkey);

    final tokensMap = <String, Event>{};
    final spendingsMap = <String, Event>{};

    await nc.doQuery(
      [
        Filter(
          kinds: [
            EventKind.CASHU_TOKEN,
          ],
          authors: [pubkey],
          since: tokens.isNotEmpty ? tokens.last.createdAt + 1 : null,
        ),
        Filter(
          kinds: [
            EventKind.CASHU_SPENDING,
          ],
          authors: [pubkey],
          since: spendings.isNotEmpty ? spendings.last.createdAt + 1 : null,
        ),
        Filter(
          kinds: [
            EventKind.CASHU_NUTZAP_INFORMATION,
          ],
          authors: [pubkey],
        ),
      ],
      [],
      eventCallBack: (e, r) {
        if (e.kind == EventKind.CASHU_TOKEN) {
          tokensMap[e.id] = e;
        }

        if (e.kind == EventKind.CASHU_SPENDING) {
          spendingsMap[e.id] = e;
        }
      },
    );

    // broadcastDeletion(tokensMap.values.map((e) => e.id).toList());

    await handleEvents(
      tokensMap: tokensMap,
      savedTokens: tokens,
      spendingsMap: spendingsMap,
    );
  }

  Future<void> syncMintTokens(String mintURL) async {
    final currentTokens =
        await nc.db.getCashuTokensByFilter(mintURL: mintURL, pubkey: pubkey);
    final latestTokenTime = currentTokens.isNotEmpty
        ? currentTokens.map((e) => e.createdAt).reduce((a, b) => a > b ? a : b)
        : null;

    final currentSpendings = await nc.db.getCashuSpendingsByPubkey(pubkey);
    final latestSpendingTime = currentSpendings.isNotEmpty
        ? currentSpendings
            .map((e) => e.createdAt)
            .reduce((a, b) => a > b ? a : b)
        : null;

    final tokensMap = <String, Event>{};
    final spendingsMap = <String, Event>{};

    await nc.doQuery(
      [
        Filter(
          kinds: [EventKind.CASHU_TOKEN],
          authors: [pubkey],
          since: latestTokenTime != null ? latestTokenTime + 1 : null,
        ),
        Filter(
          kinds: [EventKind.CASHU_SPENDING],
          authors: [pubkey],
          since: latestSpendingTime != null ? latestSpendingTime + 1 : null,
        ),
      ],
      [],
      eventCallBack: (e, r) {
        if (e.kind == EventKind.CASHU_TOKEN) {
          tokensMap[e.id] = e;
        } else if (e.kind == EventKind.CASHU_SPENDING) {
          spendingsMap[e.id] = e;
        }
      },
      timeOut: 5,
    );

    await handleEvents(
      tokensMap: tokensMap,
      savedTokens: currentTokens, // Use filtered current tokens
      spendingsMap: spendingsMap,
    );
  }

  Future<CashuWallet?> initializeWallet() async {
    CashuWallet? wallet = await nc.db.getCashuWallet(pubkey);

    int? walletCreatedAt = wallet?.createdAt;
    Event? walletEvent;
    await nc.doQuery(
      [
        Filter(
          kinds: [EventKind.CASHU_WALLET],
          authors: [pubkey],
          since: walletCreatedAt != null ? walletCreatedAt + 1 : null,
        ),
      ],
      [],
      eventCallBack: (e, r) {
        if (e.kind == EventKind.CASHU_WALLET) {
          if (walletCreatedAt == null || walletCreatedAt! < e.createdAt) {
            walletCreatedAt = e.createdAt;
            walletEvent = e;
          }
        }
      },
    );

    if (walletEvent != null) {
      wallet = await CashuWallet.fromEvent(walletEvent!, nc);
    }

    return wallet;
  }

  Future<CashuWallet?> createWallet({List<String>? mints}) async {
    final privkey = Keychain.generate().private;

    final content = await nc.currentSigner!.encrypt44(
      jsonEncode([
        ['privkey', privkey],
        ...mints?.map((mint) => ['mint', mint]) ??
            defaultMints.map((mint) => ['mint', mint]),
      ]),
      pubkey,
    );

    if (content != null) {
      final ev = await Event.genEvent(
        kind: EventKind.CASHU_WALLET,
        tags: [],
        content: content,
        signer: nc.currentSigner,
      );

      if (ev != null) {
        final isSuccessful = await nc.sendEventAsync(
          event: ev,
          setProgress: false,
        );

        if (isSuccessful) {
          await nc.db.saveEvent(ev);

          final w = CashuWallet(
            id: ev.id,
            createdAt: ev.createdAt,
            pubkey: pubkey,
            signSecret: privkey,
            mints: mints ?? defaultMints,
          );

          setNutzapInformationEvent(w);

          return w;
        }
      }
    }

    return null;
  }

  Future<CashuWallet?> updateWallet({
    required List<String> mints,
    required String privkey,
  }) async {
    final content = await nc.currentSigner!.encrypt44(
      jsonEncode([
        ['privkey', privkey],
        ...mints.map((mint) => ['mint', mint]),
      ]),
      pubkey,
    );

    if (content != null) {
      final ev = await Event.genEvent(
        kind: EventKind.CASHU_WALLET,
        tags: [],
        content: content,
        signer: nc.currentSigner,
      );

      if (ev != null) {
        final isSuccessful = await nc.sendEventAsync(
          event: ev,
          setProgress: false,
        );

        if (isSuccessful) {
          await nc.db.saveEvent(ev);

          final w = CashuWallet(
            id: ev.id,
            createdAt: ev.createdAt,
            pubkey: pubkey,
            signSecret: privkey,
            mints: mints,
          );

          setNutzapInformationEvent(w);

          return w;
        }
      }
    }

    return null;
  }

  Future<void> setNutzapInformationEvent(CashuWallet wallet) async {
    final mints = CashuManager.shared.mints;
    final relays = (await nc.getSingleUserRelayList(pubkey))?.urls ?? [];

    final relayList = relays.isNotEmpty ? relays : DEFAULT_BOOTSTRAP_RELAYS;

    final ev = await Event.genEvent(
      kind: EventKind.CASHU_NUTZAP_INFORMATION,
      tags: [
        ['pubkey', Keychain.getPublicKey(wallet.signSecret)],
        ...wallet.mints.map((mint) => [
              'mint',
              mint,
              if (mints.containsKey(mint) &&
                  mints[mint]!.info != null &&
                  mints[mint]!.info!.units.isNotEmpty)
                ...mints[mint]!.info!.units,
            ]),
        ...relayList.map((url) => ['relay', url]),
      ],
      content: '',
      signer: nc.currentSigner,
    );

    if (ev != null) {
      final isSuccessful = await nc.sendEventAsync(
        event: ev,
        setProgress: false,
      );

      if (isSuccessful) {
        await nc.db.saveEvent(ev);
      }
    }
  }

  Future<NutzapInformationEvent?> fetchNutzapInformation(String pubkey) async {
    Event? nutzapEvent;
    await nc.doQuery(
      [
        Filter(
          kinds: [EventKind.CASHU_NUTZAP_INFORMATION],
          authors: [pubkey],
          limit: 1,
        ),
      ],
      [],
      eventCallBack: (e, r) {
        if (e.kind == EventKind.CASHU_NUTZAP_INFORMATION) {
          if (nutzapEvent == null || e.createdAt > nutzapEvent!.createdAt) {
            nutzapEvent = e;
          }
        }
      },
    );

    if (nutzapEvent != null) {
      return NutzapInformationEvent.fromEvent(nutzapEvent!);
    }
    return null;
  }

  Future<String?> sendTokenEvent({
    required String mintUrl,
    required String unit,
    required List<Proof> proofs,
    List<String> deletedTokenIds = const [],
    bool deleteTokens = false,
  }) async {
    final contentMap = {
      'mint': mintUrl,
      'unit': unit,
      'proofs': proofs.map((p) => p.toEventMapRaw()).toList(),
      if (deletedTokenIds.isNotEmpty) 'del': deletedTokenIds,
    };

    final content = await nc.currentSigner!.encrypt44(
      jsonEncode(contentMap),
      pubkey,
    );

    if (content != null) {
      final ev = await Event.genEvent(
        kind: EventKind.CASHU_TOKEN,
        tags: [],
        content: content,
        signer: nc.currentSigner,
      );

      if (ev != null) {
        final isSuccessful = await nc.sendEventAsync(
          event: ev,
          setProgress: false,
        );

        if (isSuccessful) {
          await nc.db.saveEvent(ev);

          await handleEvents(
            tokensMap: {ev.id: ev},
            savedTokens: await nc.db.getCashuTokensByFilter(pubkey: pubkey),
            spendingsMap: {},
          );

          if (deleteTokens && deletedTokenIds.isNotEmpty) {
            await broadcastDeletion(deletedTokenIds);
          }

          return ev.id;
        }
      }
    }
    return null;
  }

  Future<String?> sendTokenToPubkey({
    required String recipientPubkey,
    required String mintUrl,
    required String unit,
    required List<Proof> proofs,
  }) async {
    final contentMap = {
      'mint': mintUrl,
      'unit': unit,
      'proofs': proofs.map((p) => p.toEventMapRaw()).toList(),
    };

    final content = await nc.currentSigner!.encrypt44(
      jsonEncode(contentMap),
      recipientPubkey,
    );

    if (content != null) {
      final ev = await Event.genEvent(
        kind: EventKind.CASHU_TOKEN,
        tags: [
          ['p', recipientPubkey]
        ],
        content: content,
        signer: nc.currentSigner,
      );

      if (ev != null) {
        final isSuccessful = await nc.sendEventAsync(
          event: ev,
          setProgress: false,
        );

        if (isSuccessful) {
          // We don't save it to our own local token DB as it's for someone else,
          // but we might want to track it in history (handled by CashuManager)
          return ev.id;
        }
      }
    }
    return null;
  }

  Future<String?> sendNutzapEvent({
    required String recipientPubkey,
    required String mintUrl,
    required String unit,
    required List<Proof> proofs,
    required String content,
  }) async {
    final proofTags =
        proofs.map((p) => ['proof', jsonEncode(p.toEventMapRaw())]).toList();

    final tags = [
      ...proofTags,
      ['unit', unit],
      ['u', mintUrl],
      ['p', recipientPubkey],
    ];

    final ev = await Event.genEvent(
      kind: 9321,
      tags: tags,
      content: content,
      signer: nc.currentSigner,
    );

    if (ev != null) {
      final isSuccessful = await nc.sendEventAsync(
        event: ev,
        setProgress: false,
      );

      if (isSuccessful) {
        return ev.id;
      }
    }
    return null;
  }

  Future<bool> sendSpendingEvent({
    required int amount,
    required String unit,
    required Map<String, CashuTokenStatus> tokenStates,
    required CashuSpendingDirection direction,
    String? senderPubkey,
  }) async {
    final content = [
      ['amount', amount.toString()],
      ['unit', unit],
      [
        'direction',
        direction == CashuSpendingDirection.incoming ? 'in' : 'out'
      ],
    ];

    final tags = <List<String>>[];

    for (final entry in tokenStates.entries) {
      final t = ['e', entry.key, '', entry.value.name];

      if (entry.value == CashuTokenStatus.redeemed) {
        tags.add(t);
      } else {
        content.add(t);
      }
    }

    if (senderPubkey != null) {
      tags.add(['p', senderPubkey]);
    }

    final contentJson = await nc.currentSigner!.encrypt44(
      jsonEncode(content),
      pubkey,
    );

    if (contentJson != null) {
      final ev = await Event.genEvent(
        kind: EventKind.CASHU_SPENDING,
        tags: tags,
        content: contentJson,
        signer: nc.currentSigner,
      );

      if (ev != null) {
        final isSuccessful = await nc.sendEventAsync(
          event: ev,
          setProgress: false,
        );

        if (isSuccessful) {
          await nc.db.saveEvent(ev);

          await handleEvents(
            tokensMap: {},
            savedTokens: await nc.db.getCashuTokensByFilter(pubkey: pubkey),
            spendingsMap: {ev.id: ev},
          );

          return true;
        }
      }
    }
    return false;
  }

  Future<bool> broadcastDeletion(List<String> eventIds) async {
    if (eventIds.isEmpty) return true;

    final ev = await Event.genEvent(
      kind: EventKind.EVENT_DELETION,
      tags: eventIds.map((id) => ['e', id]).toList(),
      content: 'Consuming Cashu tokens',
      signer: nc.currentSigner,
    );

    if (ev != null) {
      final isSuccessful = await nc.sendEventAsync(
        event: ev,
        setProgress: false,
      );

      if (isSuccessful) {
        await nc.db.removeEvents(eventIds);
        await nc.db.removeCashuTokens(eventIds);
        return true;
      }
    }

    return false;
  }

  // Future<void> handleEvents({
  //   required Map<String, Event> tokensMap,
  //   required List<CashuTokenData> savedTokens,
  //   required Map<String, Event> spendingsMap,
  // }) async {
  //   final tokensData = await computeData(tokensMap.values.toList());

  //   if (tokensData.isNotEmpty) {
  //     final tokens = <CashuTokenData>[];

  //     for (final t in tokensData.entries) {
  //       final e = tokensMap[t.key]!;
  //       tokens.add(CashuTokenData.fromEventMap({
  //         ...jsonDecode(t.value),
  //         'id': e.id,
  //         'pubkey': e.pubkey,
  //         'created_at': e.createdAt,
  //       }));
  //     }

  //     final deletedTokens = [
  //       ...savedTokens.map(
  //         (e) => e.deletedTokensIds,
  //       ),
  //       ...tokens.map(
  //         (e) => e.deletedTokensIds,
  //       ),
  //     ]
  //         .expand(
  //           (element) => element,
  //         )
  //         .toSet()
  //         .toList();

  //     if (deletedTokens.isNotEmpty) {
  //       await nc.db.removeCashuTokens(deletedTokens);
  //     }

  //     // Filter out tokens that should be deleted
  //     final tokensToSave =
  //         tokens.where((t) => !deletedTokens.contains(t.id)).toList();

  //     if (tokensToSave.isNotEmpty) {
  //       await nc.db.saveCashuTokens(tokensToSave);
  //     }
  //   }

  //   final spendingsData = await computeData(spendingsMap.values.toList());

  //   if (spendingsData.isNotEmpty) {
  //     await nc.db.saveCashuSpendingList(
  //       spendingsData.entries
  //           .map(
  //             (e) => CashuSpendingData.fromEventMap(
  //               content: jsonDecode(e.value),
  //               event: spendingsMap[e.key]!,
  //               tags: spendingsMap[e.key]!.tags,
  //             ),
  //           )
  //           .toList(),
  //     );
  //   }
  // }

  Future<void> handleEvents({
    required Map<String, Event> tokensMap,
    required List<CashuTokenData> savedTokens,
    required Map<String, Event> spendingsMap,
  }) async {
    final tokensData = await computeData(tokensMap.values.toList());

    if (tokensData.isNotEmpty) {
      final tokens = <CashuTokenData>[];
      final mints = <String>{};

      for (final t in tokensData.entries) {
        final e = tokensMap[t.key]!;
        final token = CashuTokenData.fromEventMap({
          ...jsonDecode(t.value),
          'id': e.id,
          'pubkey': e.pubkey,
          'created_at': e.createdAt,
        });

        tokens.add(token);
        mints.add(token.mintUrl);
      }

      if (mints.isNotEmpty) {
        final mintsFromDb = (await nc.db.loadMintsByPubkey(pubkey))
            .map((e) => e.mintURL)
            .toList();

        final unavailableMints =
            mints.where((element) => !mintsFromDb.contains(element)).toList();

        if (unavailableMints.isNotEmpty) {
          final mintsList =
              await CashuManager.shared.addMints(unavailableMints);

          if (mintsList.isNotEmpty) {
            await nc.db.saveMintsWithoutUpdate(mintsList);
          }
        }
      }

      final deletedTokens = [
        ...savedTokens.map(
          (e) => e.deletedTokensIds,
        ),
        ...tokens.map(
          (e) => e.deletedTokensIds,
        ),
      ]
          .expand(
            (element) => element,
          )
          .toSet()
          .toList();

      if (deletedTokens.isNotEmpty) {
        await nc.db.removeCashuTokens(deletedTokens);
      }

      // Filter out tokens that should be deleted
      final tokensToSave =
          tokens.where((t) => !deletedTokens.contains(t.id)).toList();

      if (tokensToSave.isNotEmpty) {
        await nc.db.saveCashuTokens(tokensToSave);
      }
    }

    final spendingsData = await computeData(spendingsMap.values.toList());

    if (spendingsData.isNotEmpty) {
      await nc.db.saveCashuSpendingList(
        spendingsData.entries
            .map(
              (e) => CashuSpendingData.fromEventMap(
                content: jsonDecode(e.value),
                event: spendingsMap[e.key]!,
                tags: spendingsMap[e.key]!.tags,
              ),
            )
            .toList(),
      );
    }
  }

  static Future<Map<String, String>> _handleEventsDecryptionInIsolate(
    Map<String, dynamic> params,
  ) async {
    final events = params['events'] as List<dynamic>;
    final signerData = params['signerData'] as Map<String, dynamic>;

    // Reconstruct events
    final eventsJson = events.map((json) => Event.fromJson(json)).toList();

    // Reconstruct signer (you'll need to adapt this based on your signer types)
    final signer = _reconstructSigner(signerData);

    if (signer == null) {
      return {};
    }

    return _handleDecryption(eventsJson, signer);
  }

  static Future<Map<String, String>> _handleDecryption(
    List<Event> events,
    EventSigner signer,
  ) async {
    final processedEvents = <String, String>{};

    for (final event in events) {
      final decryptedEvent = await signer.decrypt44(
        event.content,
        event.pubkey,
      );

      if (decryptedEvent != null) {
        processedEvents[event.id] = decryptedEvent;
      }
    }

    return processedEvents;
  }

  Future<Map<String, String>> computeData(
    List<Event> toBeProcessedEvents,
  ) async {
    return await compute(
      _handleEventsDecryptionInIsolate,
      {
        'events': toBeProcessedEvents.map((e) => e.toJson()).toList(),
        'signerData': _getCurrentSignerData(),
      },
    );
  }

  Map<String, dynamic> _getCurrentSignerData() {
    final currentSigner = nc.currentSigner!;
    return {
      'signerType': currentSigner.runtimeType.toString(),
      'publicKey': currentSigner.getPublicKey(),
      'privateKey': currentSigner is AmberEventSigner
          ? ''
          : (currentSigner as Bip340EventSigner).privateKey,
    };
  }

  static EventSigner? _reconstructSigner(Map<String, dynamic> signerData) {
    // Based on signerType, reconstruct the appropriate signer
    switch (signerData['signerType']) {
      case 'Bip340EventSigner':
        return Bip340EventSigner(
          signerData['privateKey'],
          signerData['publicKey'],
        );
      case 'AmberEventSigner':
        return AmberEventSigner(signerData['publicKey']);
      // Add other signer types as needed
      default:
        return null;
    }
  }
}
