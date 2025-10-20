// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names, avoid_print
// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'dart:isolate';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nostr_core_enhanced/db/db_wrapper.dart';
import 'package:nostr_core_enhanced/db/nostr_cache_manager.dart';
import 'package:nostr_core_enhanced/models/models.dart';
import 'package:nostr_core_enhanced/nostr/event_signer/remote_event_signer.dart';
import 'package:nostr_core_enhanced/nostr/nostr.dart';
import 'package:nostr_core_enhanced/utils/utils.dart';
import 'package:uuid/uuid.dart';

import '../cache/remote_cache_service.dart';
import '../models/mute_list.dart';
import '../models/wot_models.dart';

const Duration REFRESH_CONTACT_LIST_DURATION = Duration(days: 1);

const int DEFAULT_STREAM_IDLE_TIMEOUT = 5;

const int DEFAULT_BEST_RELAYS_MIN_COUNT = 2;

const int TIMER_TICKS = 10;

const int BATCH_SIZE = 100;

const Duration REFRESH_USER_RELAY_DURATION = Duration(minutes: 10);

const List<String> DEFAULT_BOOTSTRAP_RELAYS = [
  "wss://relay.damus.io",
  "wss://relay.nostr.band",
  'wss://nostr-01.yakihonne.com',
];

const List<String> DEFAULT_DM_RELAYS = [
  "wss://relay.damus.io",
  'wss://nostr-01.yakihonne.com',
  'wss://relay.0xchat.com',
];

class NostrCore {
  late NostrDB db;
  late DbWrapper dbWrapper;

  late RemoteCacheService remoteCacheService;

  NostrCore({
    NostrDB? db,
    bool loadRemoteCache = true,
  }) {
    this.db = db ?? NostrDB();
    dbWrapper = DbWrapper(this.db);
    automaticFlush();

    if (loadRemoteCache) {
      initRemoteCache();
    }
  }

  EventSigner? currentSigner;

  Uuid uuid = const Uuid();

  NoticeCallBack? noticeCallBack;

  ConnectStatusCallBack? connectStatusCallBack;

  Map<String, WebSocket?> webSockets = {};

  Set<String> closedRelays = {};

  Map<String, int> connectStatus = {};

  Map<String, Requests> requestsMap = {};

  Map<String, Sends> sendsMap = {};

  Map<String, int> attempts = {};

  List<ConnectStatusCallBack> connectStatusListeners = [];

  // =====================================================================
  // MARK: Init remote cache
  // =====================================================================

  Future<void> initRemoteCache() async {
    await dotenv.load();
    final remoteCache = dotenv.env['REMOTE_CACHE']!;

    remoteCacheService = RemoteCacheService(
      cacheUrl: remoteCache,
    );
  }
  // =====================================================================
  // MARK: SIGNER
  // =====================================================================

  void setSigner(EventSigner? signer) {
    currentSigner = signer;
  }

  // =====================================================================
  // MARK: Relay connectivity
  // =====================================================================

  @pragma('vm:entry-point')
  void relaysAutoReconnect() {
    for (final webSocketKey in webSockets.keys) {
      if (webSockets[webSocketKey] == null &&
          (attempts[webSocketKey] == null || attempts[webSocketKey]! <= 3)) {
        connect(webSocketKey);
      }
    }
  }

  void automaticFlush() {
    Timer.periodic(Duration(seconds: 10), (_) {
      db.flushEventsSeenRelays(dbWrapper);
    });
  }

  Future<void> forceReconnect() async {
    remoteCacheService.reconnect();

    final nostrConnectRelays = List<String>.from(
      relays()
        ..remove(
          remoteSignerRelays.first,
        ),
    );

    await closeConnect(nostrConnectRelays);

    await Future.wait(
      nostrConnectRelays.map((e) => connect(e)).toList(),
    );
  }

  void _setConnectStatus(String relay, int status) {
    connectStatus[relay] = status;
    connectStatusCallBack?.call(relay, status);
    for (var callBack in connectStatusListeners) {
      callBack(relay, status);
    }
  }

  void addConnectStatusListener(ConnectStatusCallBack callBack) {
    if (!connectStatusListeners.contains(callBack)) {
      connectStatusListeners.add(callBack);
    }
  }

  void removeConnectStatusListener(ConnectStatusCallBack callBack) {
    if (connectStatusListeners.contains(callBack)) {
      connectStatusListeners.remove(callBack);
    }
  }

  bool isWebSocketOpen(String url) {
    WebSocket? webSocket = webSockets[url];
    return webSocket != null && webSocket.closeCode == null;
  }

  List<String> relays() {
    return webSockets.keys.toList();
  }

  List<String> activeRelays() {
    return webSockets.keys
        .where(
          (key) => webSockets[key] != null,
        )
        .toList();
  }

  List<String> currentUserActiveRelays(List<String> rs) {
    final keys = webSockets.keys
        .where(
          (key) => rs.contains(key) && webSockets[key] != null,
        )
        .toList();

    return keys.map((e) => Relay.clean(e)!).toList();
  }

  List<String> missingRelays(List<String> currentRelays) {
    return currentRelays
        .where(
          (element) => !relays().contains(element),
        )
        .toList();
  }

  Future<void> connect(
    String r, {
    bool? fromIdleState,
    bool? waitForAuth,
  }) async {
    try {
      WebSocket? socket;

      if (fromIdleState == null) {
        if ((connectStatus[r] == 0 && webSockets[r] != null) ||
            connectStatus[r] == 1 && webSockets[r] != null) {
          return;
        }

        if (webSockets.containsKey(r) && webSockets[r] != null) {
          socket = webSockets[r]!;
          _setConnectStatus(r, socket.readyState);
          printLog('status =  ${connectStatus[r]}');
          if (connectStatus[r] != 3) {
            return;
          }
        }
      }

      attempts[r] = (attempts[r] ?? 0) + 1;
      closedRelays.remove(r);
      webSockets[r] = null;
      socket = await _connectWs(r);

      if (socket != null) {
        socket.done.then((dynamic _) => _onDisconnected(r));
        _listenEvent(socket, r);
        webSockets[r] = socket;
        printLog('$r socket connection initialized');
        _setConnectStatus(r, 1);
        if (waitForAuth != null) {
          await Future.delayed(const Duration(seconds: 2));
        }
      } else {
        webSockets[r] = socket;
      }
    } catch (_) {}
  }

  Future<void> connectRelays(List<String> relays, {bool? fromIdleState}) async {
    final rs = relays.where((r) {
      final relay = Relay.clean(r);
      return relay != null && !this.relays().contains(relay);
    }).toList();

    await Future.wait(
      rs.map((e) => connect(e)).toList(),
    );
  }

  Future<void> connectNonConnectedRelays(Set<String> relays) async {
    final rs = relays.where((r) {
      final relay = Relay.clean(r);
      return relay != null &&
          !this.relays().contains(relay) &&
          (webSockets[relay] == null || connectStatus[relay] != 1);
    }).toList();

    await Future.wait(
      rs.map((e) => connect(e)).toList(),
    );
  }

  Future closeConnect(List<String> relays) async {
    for (final relay in relays) {
      if (webSockets.containsKey(relay)) {
        attempts.remove(relay);
        closedRelays.add(relay);
        final socket = webSockets.remove(relay);
        await socket?.close();
      }
    }
  }

  // =====================================================================
  // MARK: QUERIES AND SUBSCRIPTIONS
  // =====================================================================

  void setTimerAndApply({
    required Timer? timer,
    required int timeOut,
    required bool shouldClose,
    required Function() onClose,
  }) {
    if (timer != null) {
      timer.cancel();
    }

    if (shouldClose) {
      onClose.call();
    } else {
      timer = Timer(
        Duration(seconds: timeOut),
        onClose,
      );
    }
  }

  Future<String> doQuery(
    List<Filter> filters,
    List<String> relays, {
    int timeOut = 5,
    EventsSource source = EventsSource.cacheFirst,
    void Function()? onFinished,
    void Function(Event, String)? eventCallBack,
    void Function(String, OKEvent, String, List<String>)? eoseCallBack,
    int? startingTimeout,
  }) async {
    final completer = Completer<String>();
    Timer? timer = Timer(Duration(seconds: timeOut), () {});
    String id = '';

    if (source != EventsSource.relays) {
      final events = await dbWrapper.loadEvents(
        filters: filters,
        relays: relays,
        db: db,
      );

      if (source == EventsSource.cacheFirst) {
        final mostRecentEvent = events.isEmpty ? 0 : events.first.createdAt;

        if (mostRecentEvent != 0) {
          for (final filter in filters) {
            if ((filter.since ?? 0) < mostRecentEvent) {
              filter.since = mostRecentEvent + 1;
            }
          }
        }
      }

      for (final e in events) {
        eventCallBack?.call(e, '');
      }

      if (source == EventsSource.cache) {
        completer.complete('');
      }
    }

    if (source != EventsSource.cache) {
      id = addSubscription(
        filters,
        relays,
        onConnectionStatus: (status) {
          if (!status) {
            closeRequests(<String>[id]);
            completer.complete(id);
          }
        },
        eoseCallBack: (requestId, ok, relay, unCompletedRelays) {
          closeSubscription(requestId, relay);

          setTimerAndApply(
            timer: timer,
            timeOut: timeOut,
            shouldClose: unCompletedRelays.isEmpty,
            onClose: () {
              if (!completer.isCompleted) {
                closeRequests(<String>[id]);
                completer.complete(id);
                db.flushEventsSeenRelays(dbWrapper);
              }
            },
          );

          if (eoseCallBack != null) {
            eoseCallBack.call(requestId, ok, relay, unCompletedRelays);
          }
        },
        eventCallBack: (event, relay) {
          dbWrapper.markEvent(event, relay);
          eventCallBack?.call(event, relay);
        },
      );

      if (startingTimeout != null) {
        setTimerAndApply(
          timer: timer,
          timeOut: startingTimeout,
          shouldClose: false,
          onClose: () {
            if (!completer.isCompleted) {
              closeRequests(<String>[id]);
              completer.complete(id);
            }
          },
        );
      }
    }

    return completer.future;
  }

  Future<String> doSubscribe(
    List<Filter> filters,
    List<String> relays, {
    EventsSource source = EventsSource.cacheFirst,
    void Function(Event, String)? eventCallBack,
    void Function(String, OKEvent, String, List<String>)? eoseCallBack,
  }) async {
    Timer? timer = Timer(Duration(seconds: 5), () {});

    if (source != EventsSource.relays) {
      final events = await dbWrapper.loadEvents(
        filters: filters,
        relays: relays,
        db: db,
      );

      if (source == EventsSource.cacheFirst) {
        final mostRecentEvent = events.isEmpty ? 0 : events.first.createdAt;

        if (mostRecentEvent != 0) {
          for (final filter in filters) {
            if ((filter.since ?? 0) < mostRecentEvent) {
              filter.since = mostRecentEvent + 1;
            }
          }
        }
      }

      for (final e in events) {
        eventCallBack?.call(e, '');
      }

      if (source == EventsSource.cache) {
        return '';
      }
    }

    if (source != EventsSource.cache) {
      return addSubscription(
        filters,
        relays,
        eoseCallBack: (requestId, ok, relay, unCompletedRelays) {
          eoseCallBack?.call(requestId, ok, relay, unCompletedRelays);

          setTimerAndApply(
            timer: timer,
            timeOut: 5,
            shouldClose: unCompletedRelays.isEmpty,
            onClose: () {
              db.flushEventsSeenRelays(dbWrapper);
            },
          );
        },
        eventCallBack: (event, relay) {
          dbWrapper.markEvent(event, relay);
          eventCallBack?.call(event, relay);
        },
      );
    }

    return '';
  }

  String addSubscription(
    List<Filter> filters,
    List<String> relays, {
    EventCallBack? eventCallBack,
    EOSECallBack? eoseCallBack,
    Function(bool)? onConnectionStatus,
    bool removeRemoteSignerRelay = true,
  }) {
    Map<String, List<Filter>> result = {};

    final webSocketRelays = this.relays();

    for (var relay in webSocketRelays) {
      if (removeRemoteSignerRelay) {
        if (relay == remoteSignerRelays.first) {
          continue;
        }
      }

      if (relays.isNotEmpty && relays.contains(relay) || relays.isEmpty) {
        if (webSockets[relay] != null) {
          result[relay] = filters;
        }
      }
    }

    return addSubscriptions(
      result,
      eventCallBack: eventCallBack,
      eoseCallBack: eoseCallBack,
      onConnectionStatus: onConnectionStatus,
    );
  }

  String addSubscriptions(
    Map<String, List<Filter>> filters, {
    EventCallBack? eventCallBack,
    EOSECallBack? eoseCallBack,
    Function(bool)? onConnectionStatus,
  }) {
    String requestsId = generate64RandomHexChars();

    Requests requests = Requests(
      requestsId,
      filters.keys.toList(),
      DateTime.now().millisecondsSinceEpoch,
      {},
      eventCallBack,
      eoseCallBack,
    );

    bool status = false;

    for (String relay in filters.keys) {
      Request requestWithFilter = Request(
        generate64RandomHexChars(),
        filters[relay]!,
      );

      String subscriptionString = requestWithFilter.serialize();

      requests.subscriptions[relay] = requestWithFilter.subscriptionId;

      requestsMap[requestWithFilter.subscriptionId + relay] = requests;

      _send(subscriptionString, chosenRelays: [relay]);

      if (!status) {
        status = connectStatus[relay] == 1;
      }
    }

    onConnectionStatus?.call(status);
    return requestsId;
  }

  closeSubscriptions(String subscriptionId) {
    for (var relay in relays()) {
      if (subscriptionId.isNotEmpty) {
        _send(Close(subscriptionId).serialize(), chosenRelays: [relay]);
        requestsMap.remove(subscriptionId + relay);
        printLog('close $subscriptionId');
      }
    }
  }

  closeSubscription(String subscriptionId, String relay) {
    if (subscriptionId.isNotEmpty) {
      String close = Close(subscriptionId).serialize();
      _send(close, chosenRelays: [relay]);
      requestsMap.remove(subscriptionId + relay);
      printLog('close $subscriptionId');
    }
  }

  Future closeRequests(List<String> requestsIds) async {
    Iterable<String> requestsMapKeys = List<String>.from(requestsMap.keys);

    for (var key in requestsMapKeys) {
      var requests = requestsMap[key];

      if (requestsIds.contains(requests!.requestId)) {
        for (var relay in relays()) {
          if (requests.subscriptions[relay] != null) {
            closeSubscription(requests.subscriptions[relay]!, relay);
          }
        }

        return;
      }
    }
  }

  // =====================================================================
  // MARK: EVENT PUBLISH
  // =====================================================================

  Future<bool> publish(
    Event event,
    List<String> relays, {
    Function(List<String>, List<String>)? onProgress,
  }) {
    final completer = Completer<bool>();
    bool isSuccessful = false;

    sendEvent(
      event,
      relays,
      sendCallBack: (ok, relay, unCompletedRelays) {
        if (onProgress != null) {
          onProgress.call(relays, unCompletedRelays);
        }

        if (ok.status && !isSuccessful) {
          isSuccessful = true;
        }
      },
    );

    Timer.periodic(
      const Duration(milliseconds: 500),
      (timer) {
        if (isSuccessful || timer.tick > TIMER_TICKS) {
          completer.complete(isSuccessful);
          timer.cancel();
        }
      },
    );

    return completer.future;
  }

  Future<bool> sendEventAsync({
    required Event event,
    required bool setProgress,
    List<String>? relays,
    int? timeout,
  }) async {
    final completer = Completer<bool>();
    bool isSuccessful = false;

    sendEvent(
      event,
      relays ?? [],
      sendCallBack: (ok, relay, unCompletedRelays) {
        if (ok.status && !isSuccessful) {
          isSuccessful = true;
        }
      },
    );

    Timer.periodic(
      const Duration(milliseconds: 500),
      (timer) {
        if (isSuccessful || timer.tick > (timeout ?? TIMER_TICKS)) {
          completer.complete(isSuccessful);
          timer.cancel();
        }
      },
    );

    return completer.future;
  }

  void sendEvent(
    Event event,
    List<String> selectedRelays, {
    OKCallBack? sendCallBack,
    bool isAuth = false,
    bool removeRemoteSignerRelay = true,
  }) {
    List<String> toBeSentRelay = selectedRelays;

    if (removeRemoteSignerRelay &&
        selectedRelays.contains(remoteSignerRelays.first)) {
      toBeSentRelay = List<String>.from(selectedRelays)
        ..remove(remoteSignerRelays.first);

      if (selectedRelays.isEmpty) {
        toBeSentRelay = List.from(relays())..remove(remoteSignerRelays.first);
      }
    } else {
      toBeSentRelay = selectedRelays.isEmpty ? relays() : selectedRelays;
    }

    Sends sends = Sends(
      generate64RandomHexChars(),
      toBeSentRelay,
      DateTime.now().millisecondsSinceEpoch,
      event.id,
      sendCallBack,
    );

    sendsMap[event.id] = sends;

    _send(
      isAuth ? event.serializeAuth() : event.serialize(),
      chosenRelays: selectedRelays.isNotEmpty ? selectedRelays : null,
    );
  }

  void _send(String data, {List<String>? chosenRelays}) {
    try {
      if (chosenRelays != null) {
        for (final relay in chosenRelays) {
          if (webSockets.containsKey(relay)) {
            var socket = webSockets[relay];
            if (connectStatus[relay] == 1 && socket != null) {
              socket.add(data);
            }
          }
        }
      } else {
        webSockets.forEach(
          (url, socket) {
            if (connectStatus[url] == 1 && socket != null) {
              socket.add(data);
            }
          },
        );
      }
    } catch (_) {}
  }

  // =====================================================================
  // MARK: MESSAGES AND EVENTS HANDLING
  // =====================================================================

  Future<void> _authenticateRelay(String message, String relay) async {
    final completer = Completer<void>();

    if (currentSigner?.canSign() ?? false) {
      final dm = jsonDecode(message);

      if (dm is List && dm.length > 1) {
        final ev = await Event.genEvent(
          kind: EventKind.AUTHENTICATION,
          tags: [
            ['relay', Relay.clean(relay) ?? relay],
            ['challenge', dm[1]],
          ],
          content: '',
          signer: currentSigner,
        );

        if (ev != null) {
          sendEvent(
            ev,
            [relay],
            isAuth: true,
            sendCallBack: (ok, relay, unCompletedRelays) {
              completer.complete();
            },
          );
        }
      }
    } else {
      completer.complete();
    }

    return completer.future;
  }

  void _handleMessage(
    String message,
    String relay,
  ) {
    try {
      var m = Message.deserialize(message);

      switch (m.type) {
        case 'EVENT':
          _handleEvent(m.message, relay);
          break;
        case 'EOSE':
          _handleEOSE(m.message, relay);
          break;
        case 'NOTICE':
          _handleNotice(m.message, relay);
          break;
        case 'OK':
          _handleOk(message, relay);
          break;
        case 'AUTH':
          _authenticateRelay(message, relay);
          print(message);
          break;

        default:
          logger.i('$relay ${m.message}');
          printLog('Received message not supported: $message');
          break;
      }
    } catch (e) {
      printLog('Received message not supported: $message');
    }
  }

  void _handleEvent(Event event, String relay) {
    String? subscriptionId = event.subscriptionId;
    if (subscriptionId != null) {
      String requestsMapKey = subscriptionId + relay;

      if (subscriptionId.isNotEmpty &&
          requestsMap.containsKey(requestsMapKey)) {
        EventCallBack? callBack = requestsMap[requestsMapKey]?.eventCallBack;
        if (callBack != null) {
          callBack(event, relay);
        }
      }
    }
  }

  void _handleEOSE(String eose, String relay) {
    printLog('receive EOSE: $eose in $relay');
    String subscriptionId = jsonDecode(eose)[0];
    String requestsMapKey = subscriptionId + relay;
    if (subscriptionId.isNotEmpty && requestsMap.containsKey(requestsMapKey)) {
      var relays = requestsMap[requestsMapKey]!.relays;
      relays.remove(relay);
      EOSECallBack? callBack = requestsMap[requestsMapKey]!.eoseCallBack;
      OKEvent ok = OKEvent(subscriptionId, true, '');

      if (callBack != null) callBack(subscriptionId, ok, relay, relays);
    }
  }

  void _handleNotice(String notice, String relay) {
    printLog('receive notice <$relay>: $notice');
    String n = jsonDecode(notice)[0];
    noticeCallBack?.call(n, relay);
  }

  void _handleOk(String message, String relay) {
    OKEvent? ok = Nip20.getOk(message);
    if (ok != null && sendsMap.containsKey(ok.eventId)) {
      if (sendsMap[ok.eventId]!.okCallBack != null) {
        List<String> relays = List.from(sendsMap[ok.eventId]!.relays)
          ..remove(relay);

        sendsMap[ok.eventId]!.relays = relays;
        sendsMap[ok.eventId]!.okCallBack!(ok, relay, relays);
        if (relays.isEmpty) sendsMap.remove(ok.eventId);
        if (ok.message == "restricted: user unauthorized") {
          closeConnect([relay]);
        }
      }
    }
  }

  void _listenEvent(WebSocket socket, String relay) {
    try {
      socket.listen((message) {
        _handleMessage(message, relay);
      }, onDone: () {
        printLog('connect aborted');
        _setConnectStatus(relay, 3);
        if (!closedRelays.contains(relay)) {
          connect(relay);
        }
      }, onError: (e) {
        printLog('Server error: $e');
        _setConnectStatus(relay, 3);
        connect(relay);
      });
    } catch (_) {}
  }

  Future<WebSocket?> _connectWs(String relay) async {
    try {
      _setConnectStatus(relay, 0);

      final uri = Uri.parse(relay);
      final isOnionRelay = uri.host.endsWith('.onion');

      if (isOnionRelay) {
        // Configure HttpClient with proxy
        final httpClient = HttpClient();
        httpClient.findProxy = (uri) => 'PROXY 127.0.0.1:9050';
        httpClient.badCertificateCallback = (cert, host, port) => true;
        final httpUri = Uri(
          scheme: uri.scheme == 'wss' ? 'https' : 'http',
          host: uri.host,
          port: uri.port,
          path: uri.path.isEmpty ? '/' : uri.path,
        );
        // Connect to get the WebSocket directly
        final request = await httpClient.getUrl(httpUri);
        request.headers.add('Connection', 'Upgrade');
        request.headers.add('Upgrade', 'websocket');
        request.headers.add('Sec-WebSocket-Version', '13');
        request.headers.add('Sec-WebSocket-Key', _generateWebSocketKey());

        final response = await request.close();
        logger.i(response.statusCode);

        if (response.statusCode == 101) {
          final socket = await response.detachSocket();
          return WebSocket.fromUpgradedSocket(socket, serverSide: false);
        } else {
          return null;
        }
      } else {
        return await WebSocket.connect(relay).timeout(
          const Duration(seconds: 5),
        );
      }
    } catch (e) {
      _setConnectStatus(relay, 3);
      printLog('Error: $e');
      return null;
    }
  }

  String _generateWebSocketKey() {
    final random = math.Random.secure();
    final bytes = List<int>.generate(16, (_) => random.nextInt(256));
    return base64.encode(bytes);
  }

  Future<bool> checkRelayConnectivity(String relay) async {
    try {
      final socket = await WebSocket.connect(relay).timeout(
        const Duration(seconds: 1),
      );

      // Send a ping
      socket.add("ping");

      // Wait for first response (or close)
      final response = await socket.first.timeout(
        const Duration(seconds: 1),
        onTimeout: () => "timeout",
      );

      await socket.close();

      return response != "timeout";
    } catch (_) {
      return false;
    }
  }

  Future<void> _onDisconnected(String relay) async {
    printLog('_onDisconnected');
    _setConnectStatus(relay, 3);
    if (!closedRelays.contains(relay)) {
      await Future.delayed(const Duration(milliseconds: 1000));
      connect(relay);
    }
  }

  void printLog(String log) {
    if (kDebugMode) {
      print(log);
    }
  }

  // =====================================================================
  // MARK: CONTACT LISTS
  // =====================================================================

  Future<ContactList> ensureUpToDateContactListOrEmpty(
    EventSigner signer,
  ) async {
    ContactList? contactList = await db.loadContactList(
      signer.getPublicKey(),
    );

    int sometimeAgo = DateTime.now()
            .subtract(REFRESH_CONTACT_LIST_DURATION)
            .millisecondsSinceEpoch ~/
        1000;

    bool refresh = contactList == null ||
        contactList.loadedTimestamp == null ||
        contactList.loadedTimestamp! < sometimeAgo;

    if (refresh) {
      contactList =
          await loadContactList(signer.getPublicKey(), forceRefresh: true);
    }

    contactList ??= ContactList(pubkey: signer.getPublicKey(), contacts: []);

    return contactList;
  }

  Future<ContactList?> loadContactList(
    String pubkey, {
    bool forceRefresh = false,
    int idleTimeout = DEFAULT_STREAM_IDLE_TIMEOUT,
  }) async {
    final completer = Completer<ContactList?>();

    ContactList? contactList = await db.loadContactList(pubkey);

    if (contactList == null || forceRefresh) {
      ContactList? loadedContactList;

      final id = await doQuery(
        [
          Filter(
            kinds: [EventKind.CONTACT_LIST],
            authors: [pubkey],
            limit: 1,
          ),
        ],
        [],
        timeOut: 2,
        eventCallBack: (event, relay) {
          if (loadedContactList == null ||
              loadedContactList!.createdAt < event.createdAt) {
            loadedContactList = ContactList.fromEvent(event);
          }
        },
        eoseCallBack: (requestId, ok, relay, unCompletedRelays) {},
      );

      closeRequests([id]);

      if (loadedContactList != null &&
          (contactList == null ||
              contactList.createdAt < loadedContactList!.createdAt)) {
        loadedContactList!.loadedTimestamp =
            DateTime.now().millisecondsSinceEpoch ~/ 1000;

        await db.saveContactList(loadedContactList!);
        contactList = loadedContactList;
        completer.complete(contactList);
      } else if (contactList != null) {
        completer.complete(contactList);
      } else {
        completer.complete(null);
      }
    } else {
      completer.complete(contactList);
    }

    return completer.future;
  }

  Future<List<ContactList>> loadContactLists(
    List<String> pubkeys, {
    bool forceRefresh = false,
    int idleTimeout = DEFAULT_STREAM_IDLE_TIMEOUT,
    EventsSource source = EventsSource.cacheFirst,
  }) async {
    // Load existing ones from DB

    final localLists = await db.loadContactLists(pubkeys);
    final localMap = {for (final cl in localLists) cl.pubkey: cl};

    // Figure out which pubkeys still need fetching
    final toFetch = forceRefresh
        ? pubkeys
        : pubkeys.where((p) => !localMap.containsKey(p)).toList();

    final fetchedMap = <String, ContactList>{};

    if (toFetch.isNotEmpty) {
      final id = await doQuery(
        [
          Filter(
            kinds: [EventKind.CONTACT_LIST],
            authors: toFetch,
          ),
        ],
        [],
        timeOut: 3,
        source: source,
        eventCallBack: (event, relay) {
          final existing = fetchedMap[event.pubkey];
          if (existing == null || existing.createdAt < event.createdAt) {
            fetchedMap[event.pubkey] = ContactList.fromEvent(event);
          }
        },
        eoseCallBack: (requestId, ok, relay, unCompletedRelays) {},
      );

      closeRequests([id]);

      if (fetchedMap.isNotEmpty) {
        final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        for (final cl in fetchedMap.values) {
          cl.loadedTimestamp = now;
        }

        await db.saveContactLists(fetchedMap.values.toList());
      }
    }

    // Merge local and fetched, keeping freshest per pubkey
    final merged = {
      for (final cl in [...localMap.values, ...fetchedMap.values]) cl.pubkey: cl
    }.values.toList();

    return merged;
  }

  Future<MuteList?> loadMutesList(
    String pubkey, {
    bool forceRefresh = false,
    int idleTimeout = DEFAULT_STREAM_IDLE_TIMEOUT,
  }) async {
    final completer = Completer<MuteList?>();

    MuteList? muteList = await db.loadMuteList(pubkey);

    if (muteList == null || forceRefresh) {
      MuteList? loadedMuteList;

      final id = await doQuery(
        [
          Filter(
            kinds: [EventKind.CONTACT_LIST],
            authors: [pubkey],
            limit: 1,
          ),
        ],
        [],
        timeOut: 2,
        eventCallBack: (event, relay) {
          if (loadedMuteList == null ||
              loadedMuteList!.createdAt < event.createdAt) {
            loadedMuteList = MuteList.fromEvent(event);
          }
        },
        eoseCallBack: (requestId, ok, relay, unCompletedRelays) {},
      );

      closeRequests([id]);

      if (loadedMuteList != null &&
          (muteList == null ||
              muteList.createdAt < loadedMuteList!.createdAt)) {
        loadedMuteList!.loadedTimestamp =
            DateTime.now().millisecondsSinceEpoch ~/ 1000;

        await db.saveMuteList(loadedMuteList!);
        muteList = loadedMuteList;
        completer.complete(muteList);
      } else if (muteList != null) {
        completer.complete(muteList);
      } else {
        completer.complete(null);
      }
    } else {
      completer.complete(muteList);
    }

    return completer.future;
  }

  Future<bool> loadWotDataByBatch(
    List<String> pubkeys, {
    bool forceRefresh = false,
    int idleTimeout = 5000,
  }) async {
    final completer = Completer<bool>();

    List<String> remainingContactsPubkeys = List.from(pubkeys);
    List<String> remainingMutesPubkeys = List.from(pubkeys);

    for (final pubkey in pubkeys) {
      final contactList = await db.loadContactList(pubkey);
      final muteList = await db.loadMuteList(pubkey);

      if (contactList != null) {
        remainingContactsPubkeys.remove(pubkey);
      }

      if (muteList != null) {
        remainingMutesPubkeys.remove(pubkey);
      }
    }

    if (remainingContactsPubkeys.isNotEmpty ||
        remainingMutesPubkeys.isNotEmpty) {
      final id = await doQuery(
        [
          if (remainingContactsPubkeys.isNotEmpty)
            Filter(
              kinds: [EventKind.CONTACT_LIST],
              authors: remainingContactsPubkeys,
            ),
          if (remainingMutesPubkeys.isNotEmpty)
            Filter(
              kinds: [EventKind.MUTE_LIST],
              authors: remainingMutesPubkeys,
            ),
        ],
        [],
        timeOut: 2,
        eventCallBack: (event, relay) {
          if (remainingContactsPubkeys.contains(event.pubkey) &&
              event.kind == EventKind.CONTACT_LIST) {
            db.saveContactList(ContactList.fromEvent(event));
            remainingContactsPubkeys.remove(event.pubkey);
          }

          if (remainingMutesPubkeys.contains(event.pubkey) &&
              event.kind == EventKind.MUTE_LIST) {
            db.saveMuteList(MuteList.fromEvent(event));
            remainingMutesPubkeys.remove(event.pubkey);
          }
        },
        eoseCallBack: (requestId, ok, relay, unCompletedRelays) {},
      );

      closeRequests([id]);

      completer.complete(true);
    } else {
      completer.complete(false);
    }

    return completer.future;
  }

  Future<bool> buildWotData({required String pubkey}) async {
    try {
      final contactList = await loadContactList(pubkey);
      final cs = Set<String>.from(contactList?.contacts ?? []);

      if (cs.isEmpty) {
        return false;
      }

      const int batchSize = 50;

      final csList = cs.toList();
      for (var i = 0; i < csList.length; i += batchSize) {
        final batch = csList.sublist(
          i,
          i + batchSize < csList.length ? i + batchSize : csList.length,
        );

        await loadWotDataByBatch(batch);
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, num?>> calculatePeerPubkeyWotList({
    required List<String> peerPubkeys,
    required String originPubkey,
  }) async {
    if (peerPubkeys.isEmpty) return {};

    final scores = <String, num?>{};

    try {
      // Step 1: Batch load existing scores using the new Map method
      final existingScores = await db.loadWotScoreMap(
        peerPubkeys,
        originPubkey,
      );

      final needCalculation = <String>[];

      for (final pubkey in peerPubkeys) {
        final existing = existingScores[pubkey]; // O(1) lookup!
        if (existing != null) {
          scores[pubkey] = existing.score;
        } else {
          needCalculation.add(pubkey);
        }
      }

      if (needCalculation.isEmpty) return scores;

      // Step 2: Load contact list once
      final contactsList = await db.loadContactList(originPubkey);
      if (contactsList == null || contactsList.contacts.isEmpty) {
        for (final pubkey in needCalculation) {
          scores[pubkey] = null;
        }
        return scores;
      }

      final contacts = contactsList.contacts;
      final newScores = <WotScore>[];
      final needWotCalculation = <String>[];

      // Step 3: Check direct follows
      for (final pubkey in needCalculation) {
        if (contacts.contains(pubkey)) {
          scores[pubkey] = 10;
          newScores.add(WotScore(
            id: uuid.v4(),
            pubkey: pubkey,
            score: 10,
            createdAt: currentUnixTimestampSeconds(),
            originPubkey: originPubkey,
          ));
        } else {
          needWotCalculation.add(pubkey);
        }
      }

      // Step 4: Batch calculate WoT using the new batch method
      if (needWotCalculation.isNotEmpty) {
        final wotResults = await db.getWotAvailabilityBatch(
          originPubkeyList: contacts,
          peerPubkeys: needWotCalculation,
        );

        for (final pubkey in needWotCalculation) {
          final result = wotResults[pubkey];
          if (result != null) {
            final following = result['following'] ?? 0;
            final mutes = result['mutes'] ?? 0;

            final ratio = following / contacts.length;
            final mutesPenalty = (mutes / contacts.length) * 0.5;

            // Logarithmic scaling for max 8 for indirect
            final baseScore = math.log(1 + ratio * 10) / math.log(11) * 8;
            final calculatedScore = (baseScore - mutesPenalty).clamp(0.0, 8.0);

            scores[pubkey] = calculatedScore;
            newScores.add(WotScore(
              id: uuid.v4(),
              pubkey: pubkey,
              score: calculatedScore,
              createdAt: currentUnixTimestampSeconds(),
              originPubkey: originPubkey,
            ));
          }
        }
      }

      if (newScores.isNotEmpty) {
        db.saveWotScoresBatch(newScores);
      }

      return scores;
    } catch (e) {
      logger.i('Error in batch WoT calculation: $e');
      return _fallbackIndividualCalculation(peerPubkeys, originPubkey);
    }
  }

  Future<Map<String, num?>> _fallbackIndividualCalculation(
    List<String> peerPubkeys,
    String originPubkey,
  ) async {
    final scores = <String, num?>{};

    for (final pubkey in peerPubkeys) {
      scores[pubkey] = (await calculatePeerPubkeyWot(
            peerPubkey: pubkey,
            originPubkey: originPubkey,
          ))
              ?.score ??
          0;
    }

    return scores;
  }

  Future<WotScore?> calculatePeerPubkeyWot({
    required String peerPubkey,
    required String originPubkey,
  }) async {
    final batchResult = await calculatePeerPubkeyWotList(
      peerPubkeys: [peerPubkey],
      originPubkey: originPubkey,
    );

    final score = batchResult[peerPubkey];
    if (score == null) return null;

    return db.loadWotScore(peerPubkey, originPubkey);
  }

  Future<Map<String, double>> calculateWot({
    required String pubkey,
    required Set<String> mutes,
    bool forceRefresh = false,
  }) async {
    final currentWot = await db.loadUserWot(pubkey);

    if (currentWot != null && !forceRefresh) {
      return currentWot.wot;
    }

    // const int batchSize = 50;
    final Map<String, Set<String>> followings = {};

    final contactList = await loadContactList(pubkey);
    final cs = Set<String>.from(contactList?.contacts ?? []);

    if (cs.isEmpty) {
      return {};
    }

    final csList = cs.take(200).toList();

    final followingsContactList = await loadContactDataByBatch(
      csList,
      forceRefresh: forceRefresh,
    );

    for (final key in followingsContactList.keys) {
      followings[key] = Set<String>.from(followingsContactList[key] ?? []);
    }

    // for (var i = 0; i < csList.length; i += batchSize) {
    //   final batch = csList.sublist(
    //     i,
    //     i + batchSize < csList.length ? i + batchSize : csList.length,
    //   );

    //   final followingsContactList = await loadContactDataByBatch(
    //     batch,
    //     forceRefresh: forceRefresh,
    //   );

    //   for (final key in followingsContactList.keys) {
    //     followings[key] = Set<String>.from(followingsContactList[key] ?? []);
    //   }

    //   await Future.delayed(const Duration(milliseconds: 300));
    // }

    // Create a calculation data object containing only serializable data
    final calculationData = WotCalculationData(
      pubkey: pubkey,
      mutes: Set<String>.from(mutes),
      followings: Map<String, Set<String>>.from(followings),
      contacts: csList.toSet(),
    );

    // Serialize the data completely before spawning the isolate
    final serializedData = calculationData.toJson();

    // Spawn isolate for WoT calculation using a top-level function
    final receivePort = ReceivePort();
    final isolate = await Isolate.spawn(
      calculateWotIsolate,
      receivePort.sendPort,
    );

    try {
      final sendPort = await receivePort.first as SendPort;

      final completer = Completer<Map<String, double>>();

      final responsePort = ReceivePort();

      responsePort.listen(
        (message) {
          if (message is Map<String, dynamic>) {
            if (message.containsKey('error')) {
              logger.e('Error in isolate: ${message['error']}');
              completer.complete({});
            } else {
              db.saveUserWot(
                WotModel(
                  pubkey: pubkey,
                  wot: Map<String, double>.from(message),
                  createdAt: DateTime.now().toSecondsSinceEpoch(),
                ),
              );

              completer.complete(message.cast<String, double>());
            }
            responsePort.close();
            isolate.kill(priority: Isolate.immediate);
          }
        },
      );

      sendPort.send({...serializedData, 'responsePort': responsePort.sendPort});

      return await completer.future;
    } catch (e) {
      logger.e('Error in WoT calculation: $e');
      return {};
    } finally {
      isolate.kill(priority: Isolate.immediate);
      receivePort.close();
    }
  }

// Placeholder for loadContactListByBatch
  Future<Map<String, List<String>>> loadContactDataByBatch(
    List<String> pubkeys, {
    bool forceRefresh = false,
    int idleTimeout = 5000,
  }) async {
    final loadedContactLists = await loadContactLists(
      pubkeys,
      forceRefresh: forceRefresh,
      idleTimeout: idleTimeout,
      source: EventsSource.relays,
    );

    return {for (final c in loadedContactLists) c.pubkey: c.contacts};
  }

  Future<ContactList?> publishRemoveContacts(
    List<String> toRemove,
    List<String> relays,
    EventSigner signer,
  ) async {
    ContactList? contactList = await ensureUpToDateContactListOrEmpty(signer);
    toRemove.removeWhere((element) => !contactList.contacts.contains(element));

    if (toRemove.isNotEmpty) {
      for (final p in toRemove) {
        contactList.contacts.remove(p);
        contactList.loadedTimestamp = Helpers.now;
        contactList.createdAt = Helpers.now;
      }

      final e = await Event.genEvent(
        kind: EventKind.CONTACT_LIST,
        tags: contactList.toAllTags(),
        content: "",
        signer: signer,
      );

      if (e == null) {
        return null;
      }

      final isSuccessful = await publish(e, relays);

      if (isSuccessful) {
        await db.saveContactList(contactList);
      } else {
        return null;
      }
    }

    return contactList;
  }

  Future<ContactList?> publishAddContacts(
    List<String> toAdd,
    List<String> relays,
    EventSigner signer,
  ) async {
    ContactList contactList = await ensureUpToDateContactListOrEmpty(signer);

    if (toAdd.isNotEmpty) {
      for (final p in toAdd) {
        if (!contactList.contacts.contains(p)) {
          contactList.contacts.add(p);
          contactList.loadedTimestamp = Helpers.now;
          contactList.createdAt = Helpers.now;
        }
      }

      final e = await Event.genEvent(
        kind: EventKind.CONTACT_LIST,
        tags: contactList.toAllTags(),
        content: "",
        signer: signer,
      );

      if (e == null) {
        return null;
      }

      final isSuccessful = await publish(e, relays);

      if (isSuccessful) {
        await db.saveContactList(contactList);
      } else {
        return null;
      }
    }

    return contactList;
  }

  Future<ContactList?> publishUpdateContacts(
    List<String> pubkeys,
    List<String> relays,
    EventSigner signer,
    Set<String> mutes,
  ) async {
    ContactList contactList = await ensureUpToDateContactListOrEmpty(signer);

    if (pubkeys.isNotEmpty) {
      for (final p in pubkeys) {
        if (!contactList.contacts.contains(p)) {
          contactList.contacts.add(p);
          contactList.loadedTimestamp = Helpers.now;
          contactList.createdAt = Helpers.now;
        } else {
          contactList.contacts.remove(p);
          contactList.loadedTimestamp = Helpers.now;
          contactList.createdAt = Helpers.now;
        }
      }

      final e = await Event.genEvent(
        kind: EventKind.CONTACT_LIST,
        tags: contactList.toAllTags(),
        content: "",
        signer: signer,
      );

      if (e == null) {
        return null;
      }

      final isSuccessful = await publish(
        e,
        relays,
      );

      if (isSuccessful) {
        calculateWot(
          pubkey: signer.getPublicKey(),
          mutes: mutes,
          forceRefresh: true,
        );
        await db.saveContactList(contactList);
      } else {
        return null;
      }
    }

    return contactList;
  }

  // =====================================================================
  // MARK: METADATA HANDLING
  // =====================================================================

  Future<List<Metadata>> loadMissingMetadatas(
    List<String> pubKeys,
    List<String> relays, {
    Function(Set<String>)? onRefresh,
    bool? forceSeach,
  }) async {
    List<String> missingPubKeys = [];

    if (forceSeach != null) {
      missingPubKeys = pubKeys;
    } else {
      missingPubKeys = await db.getMissingMetadatas(pubKeys);
    }

    Map<String, Metadata> metadatas = {};

    if (missingPubKeys.isNotEmpty) {
      final id = await doQuery(
        [
          Filter(authors: missingPubKeys, kinds: [EventKind.METADATA])
        ],
        relays,
        eventCallBack: (event, relay) async {
          if (metadatas[event.pubkey] == null ||
              metadatas[event.pubkey]!.createdAt < event.createdAt) {
            final m = Metadata.fromEvent(event);

            if (m != null) {
              metadatas[event.pubkey] = m.copyWith(
                refreshedTimestamp: Helpers.now,
              );
            }
          }
        },
        timeOut: 2,
        eoseCallBack: (p0, p1, p2, p3) {
          onRefresh?.call(metadatas.keys.toSet());
        },
      );

      closeRequests([id]);
    }

    final ms = metadatas.values.toList();
    await db.saveMetadatas(ms);

    return ms;
  }

  Future<Metadata?> broadcastMetadata(
    Metadata metadata,
    List<String> relays,
    EventSigner signer,
    Function(List<String>, List<String>)? onProgress,
  ) async {
    final event = await metadata.toEvent(signer);

    if (event != null) {
      final isSuccessful = await publish(event, relays, onProgress: onProgress);

      if (isSuccessful) {
        final newMetadata = metadata.copyWith(
          createdAt: Helpers.now,
          refreshedTimestamp: Helpers.now,
        );

        await db.saveMetadata(newMetadata);

        return newMetadata;
      }

      return null;
    }

    return null;
  }

  // =====================================================================
  // MARK: USER RELAY LIST
  // =====================================================================

  Future<RelaySet?> getRelaySet(String name, String pubKey) async {
    return await db.loadRelaySet(name, pubKey);
  }

  Future<void> saveRelaySet(RelaySet relaySet) async {
    return await db.saveRelaySet(relaySet);
  }

  Future<RelaySet> calculateRelaySet({
    required String name,
    required String ownerPubKey,
    required List<String> pubKeys,
    required RelayDirection direction,
    required int relayMinCountPerPubKey,
    Function(String, int, int)? onProgress,
  }) async {
    RelaySet byScore = await _relaysByPopularity(
      name: name,
      ownerPubKey: ownerPubKey,
      pubKeys: pubKeys,
      direction: direction,
      relayMinCountPerPubKey: relayMinCountPerPubKey,
      onProgress: onProgress,
    );

    if (byScore.relaysMap.isNotEmpty) {
      return byScore;
    }

    return RelaySet(
      name: name,
      pubkey: ownerPubKey,
      relayMinCountPerPubkey: relayMinCountPerPubKey,
      direction: direction,
      relaysMap: _allConnectedRelays(pubKeys),
    );
  }

  Map<String, List<PubkeyMapping>> _allConnectedRelays(List<String> pubKeys) {
    Map<String, List<PubkeyMapping>> map = {};
    for (var relay in relays()) {
      if (isWebSocketOpen(relay)) {
        map[relay] = pubKeys
            .map(
              (pubKey) => PubkeyMapping(
                  pubKey: pubKey, rwMarker: ReadWriteMarker.readWrite),
            )
            .toList();
      }
    }
    return map;
  }

  Future<RelaySet> _relaysByPopularity({
    required String name,
    required String ownerPubKey,
    required List<String> pubKeys,
    required RelayDirection direction,
    required int relayMinCountPerPubKey,
    Function(String stepName, int count, int total)? onProgress,
  }) async {
    await loadMissingRelayListsFromNip65OrNip02(
      pubKeys,
      onProgress: onProgress,
    );

    Map<String, Set<PubkeyMapping>> pubKeysByRelayUrl =
        await _buildPubKeysMapFromRelayLists(pubKeys, direction);

    Map<String, Set<String>> minimumRelaysCoverageByPubkey = {};
    Map<String, List<PubkeyMapping>> bestRelays = {};

    if (onProgress != null) {
      if (kDebugMode) {
        print("Calculating best relays...");
      }

      onProgress.call(
        "Calculating best relays",
        minimumRelaysCoverageByPubkey.length,
        pubKeysByRelayUrl.length,
      );
    }

    for (String url in pubKeysByRelayUrl.keys) {
      if (!pubKeysByRelayUrl[url]!.any((pubKey) =>
          minimumRelaysCoverageByPubkey[pubKey.pubKey] == null ||
          minimumRelaysCoverageByPubkey[pubKey.pubKey]!.length <
              relayMinCountPerPubKey)) {
        continue;
      }

      if (url.contains('wot')) {
        continue;
      }

      await connect(url);

      if (bestRelays[url] == null) {
        bestRelays[url] = [];
      }

      for (PubkeyMapping pubKey in pubKeysByRelayUrl[url]!) {
        Set<String>? relays = minimumRelaysCoverageByPubkey[pubKey.pubKey];
        if (relays == null) {
          relays = {};
          minimumRelaysCoverageByPubkey[pubKey.pubKey] = relays;
        }

        relays.add(url);

        if (!bestRelays[url]!.contains(pubKey)) {
          bestRelays[url]!.add(pubKey);
        }
      }

      if (onProgress != null) {
        onProgress.call(
          "Calculating best relays",
          minimumRelaysCoverageByPubkey.length,
          pubKeys.length,
        );
      }
    }

    return RelaySet(
      name: name,
      pubkey: ownerPubKey,
      relayMinCountPerPubkey: relayMinCountPerPubKey,
      direction: direction,
      relaysMap: bestRelays,
    );
  }

  _buildPubKeysMapFromRelayLists(
    List<String> pubKeys,
    RelayDirection direction,
  ) async {
    Map<String, Set<PubkeyMapping>> pubKeysByRelayUrl = {};
    int foundCount = 0;
    for (String pubKey in pubKeys) {
      UserRelayList? userRelayList = await db.loadUserRelayList(pubKey);
      if (userRelayList != null) {
        if (userRelayList.relays.isNotEmpty) {
          foundCount++;
        }

        for (var entry in userRelayList.relays.entries) {
          _handleRelayUrlForPubKey(
            pubKey,
            direction,
            entry.key,
            entry.value,
            pubKeysByRelayUrl,
          );
        }
      } else {
        int now = DateTime.now().millisecondsSinceEpoch ~/ 1000;

        await db.saveUserRelayList(
          UserRelayList(
            pubkey: pubKey,
            relays: {},
            createdAt: now,
            refreshedTimestamp: now,
          ),
        );
      }
    }

    print(
      "Have lists of relays for $foundCount/${pubKeys.length} pubKeys ${foundCount < pubKeys.length ? "(missing ${pubKeys.length - foundCount})" : ""}",
    );

    List<MapEntry<String, Set<PubkeyMapping>>> sortedEntries =
        pubKeysByRelayUrl.entries.toList()
          ..sort((a, b) {
            int rr = b.value.length.compareTo(a.value.length);
            if (rr == 0) {
              bool aC = isWebSocketOpen(a.key);
              bool bC = isWebSocketOpen(b.key);

              if (aC != bC) {
                return aC ? -1 : 1;
              }
              return 0;
            }
            return rr;
          });

    return Map<String, Set<PubkeyMapping>>.fromEntries(sortedEntries);
  }

  _handleRelayUrlForPubKey(
      String pubKey,
      RelayDirection direction,
      String url,
      ReadWriteMarker marker,
      Map<String, Set<PubkeyMapping>> pubKeysByRelayUrl) {
    String? cleanUrl = Relay.clean(url);

    if (cleanUrl != null) {
      if (direction.matchesMarker(marker)) {
        Set<PubkeyMapping>? set = pubKeysByRelayUrl[cleanUrl];
        if (set == null) {
          pubKeysByRelayUrl[cleanUrl] = {};
        }
        pubKeysByRelayUrl[cleanUrl]!
            .add(PubkeyMapping(pubKey: pubKey, rwMarker: marker));
      }
    }
  }

  Future<UserRelayList?> ensureUpToDateUserRelayList(EventSigner signer) async {
    UserRelayList? userRelayList = await db.loadUserRelayList(
      signer.getPublicKey(),
    );

    int sometimeAgo = DateTime.now()
            .subtract(REFRESH_USER_RELAY_DURATION)
            .millisecondsSinceEpoch ~/
        1000;

    bool refresh =
        userRelayList == null || userRelayList.refreshedTimestamp < sometimeAgo;

    if (refresh) {
      userRelayList = await getSingleUserRelayList(signer.getPublicKey(),
          forceRefresh: true);
    }

    return userRelayList;
  }

  Future<UserRelayList?> getSingleUserRelayList(
    String pubKey, {
    bool forceRefresh = false,
  }) async {
    UserRelayList? userRelayList = await db.loadUserRelayList(pubKey);

    if (userRelayList == null || forceRefresh) {
      await loadMissingRelayListsFromNip65OrNip02(
        [pubKey],
        forceRefresh: forceRefresh,
      );

      userRelayList = await db.loadUserRelayList(pubKey);
    }
    return userRelayList;
  }

  Future<UserRelayList?> setNip65Relays(
    Map<String, ReadWriteMarker> newRelays,
    List<String> relays,
    EventSigner signer,
    OKCallBack okCallBack,
  ) async {
    int now = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    final userRelayList = UserRelayList(
      pubkey: signer.getPublicKey(),
      relays: newRelays,
      createdAt: now,
      refreshedTimestamp: now,
    );

    final event = await userRelayList.toNip65().toEvent(signer);

    if (event != null) {
      final isSuccessful = await publish(
        event,
        relays,
      );

      if (isSuccessful) {
        await db.saveUserRelayList(userRelayList);
        return userRelayList;
      }

      return null;
    }

    return null;
  }

  Future<void> loadMissingRelayListsFromNip65OrNip02(
    List<String> pubKeys, {
    Function(
      String stepName,
      int count,
      int total,
    )? onProgress,
    bool forceRefresh = false,
  }) async {
    Set<String> missingPubKeys = {};

    for (var pubKey in pubKeys) {
      UserRelayList? userRelayList = await db.loadUserRelayList(pubKey);
      if (userRelayList == null || forceRefresh) {
        missingPubKeys.add(pubKey);
      }
    }

    Map<String, UserRelayList> fromNip65s = {};
    Map<String, UserRelayList> fromNip02Contacts = {};
    Set<ContactList> contactLists = {};
    Set<String> found = {};

    if (missingPubKeys.isNotEmpty) {
      print("loading missing relay lists ${missingPubKeys.length}");
      if (onProgress != null) {
        onProgress.call(
            "loading missing relay lists", 0, missingPubKeys.length);
      }

      final id = await doQuery(
        [
          Filter(
            authors: missingPubKeys.toList(),
            kinds: [
              EventKind.RELAY_LIST_METADATA,
              EventKind.CONTACT_LIST,
            ],
          ),
        ],
        DEFAULT_BOOTSTRAP_RELAYS,
        eventCallBack: (event, relay) {
          switch (event.kind) {
            case EventKind.RELAY_LIST_METADATA:
              Nip65 nip65 = Nip65.fromEvent(event);
              if (nip65.relays.isNotEmpty) {
                UserRelayList fromNip65 = UserRelayList.fromNip65(nip65);
                if (fromNip65s[event.pubkey] == null ||
                    fromNip65s[event.pubkey]!.createdAt < event.createdAt) {
                  fromNip65s[event.pubkey] = fromNip65;
                }
                if (onProgress != null) {
                  found.add(event.pubkey);
                  onProgress.call("loading missing relay lists", found.length,
                      missingPubKeys.length);
                }
              }
            case EventKind.CONTACT_LIST:
              ContactList contactList = ContactList.fromEvent(event);
              contactLists.add(contactList);
              if (event.content.isNotEmpty) {
                if (fromNip02Contacts[event.pubkey] == null ||
                    fromNip02Contacts[event.pubkey]!.createdAt <
                        event.createdAt) {
                  fromNip02Contacts[event.pubkey] =
                      UserRelayList.fromNip02EventContent(event);
                }
                if (onProgress != null) {
                  found.add(event.pubkey);
                  onProgress.call("loading missing relay lists", found.length,
                      missingPubKeys.length);
                }
              }
          }
        },
      );

      closeRequests([id]);

      Set<UserRelayList> relayLists = Set.of(fromNip65s.values);

      for (MapEntry<String, UserRelayList> entry in fromNip02Contacts.entries) {
        if (!fromNip65s.containsKey(entry.key)) {
          relayLists.add(entry.value);
        }
      }

      await db.saveUserRelayLists(relayLists.toList());

      List<ContactList> contactListsSave = [];

      for (ContactList contactList in contactLists) {
        ContactList? existing = await db.loadContactList(contactList.pubkey);
        if (existing == null || existing.createdAt < contactList.createdAt) {
          contactListsSave.add(contactList);
        }
      }

      await db.saveContactLists(contactListsSave);

      if (onProgress != null) {
        onProgress.call(
            "loading missing relay lists", found.length, missingPubKeys.length);
      }
    }
  }
}

typedef NoticeCallBack = void Function(String notice, String relay);

typedef OKCallBack = void Function(
  OKEvent ok,
  String relay,
  List<String> unCompletedRelays,
);

typedef EventCallBack = void Function(Event event, String relay);

typedef EOSECallBack = void Function(
  String requestId,
  OKEvent ok,
  String relay,
  List<String> unCompletedRelays,
);

typedef ConnectStatusCallBack = void Function(String relay, int status);

class Sends {
  String sendsId;
  List<String> relays;
  int sendsTime;
  String eventId;
  OKCallBack? okCallBack;

  Sends(
      this.sendsId, this.relays, this.sendsTime, this.eventId, this.okCallBack);
}

class Requests {
  String requestId;
  List<String> relays;
  int requestTime;
  Map<String, String> subscriptions;
  EventCallBack? eventCallBack;
  EOSECallBack? eoseCallBack;

  Requests(
    this.requestId,
    this.relays,
    this.requestTime,
    this.subscriptions,
    this.eventCallBack,
    this.eoseCallBack,
  );
}

@pragma('vm:entry-point')
void calculateWotIsolate(SendPort sendPort) {
  final receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);

  receivePort.listen(
    (message) {
      if (message is Map<String, dynamic>) {
        try {
          final wot = <String, double>{};
          final cs = Set<String>.from(message['contacts']);
          final followings =
              Map<String, Set<String>>.from(message['followings']);
          final mutes = Set<String>.from(message['mutes']);
          final sp = message['responsePort'] as SendPort;

          for (final p in cs) {
            if (!mutes.contains(p)) {
              int count = 0;
              for (final f in followings.values) {
                if (f.contains(p)) {
                  count++;
                }
              }

              final score = cs.isNotEmpty ? (count * 10) / cs.length : 0.0;
              if (score >= 2) {
                wot[p] = score.clamp(0, 10);
              }
            }
          }

          for (final f in followings.values) {
            if (f.isNotEmpty) {
              for (final p in f) {
                if (!mutes.contains(p) && !wot.containsKey(p)) {
                  int count = 0;
                  for (final f2 in followings.values) {
                    if (f2.contains(p)) {
                      count++;
                    }
                  }

                  final score = cs.isNotEmpty ? (count * 10) / cs.length : 0.0;
                  if (score >= 2) {
                    wot[p] = score.clamp(0, 10);
                  }
                }
              }
            }
          }

          final sortedEntries = wot.entries.toList()
            ..sort((a, b) => b.value.compareTo(a.value));

          final result = Map<String, double>.fromEntries(
            sortedEntries.take(100),
          );

          sp.send(result);
        } catch (e) {
          // Send back the error as a string
          sendPort.send({'error': e.toString()});
        }
      }
    },
  );
}
