import 'dart:async';
import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../core/nuts/v1/nut_17.dart';

class CashuMintWebSocket {
  final String mintURL;
  WebSocketChannel? _channel;
  final Map<int, Completer> _pendingRequests = {};
  final Map<String, StreamController<Map<String, dynamic>>>
      _activeSubscriptions = {};

  int _idCounter = 1;
  bool _isConnected = false;
  final Logger _logger = Logger();

  bool get isConnected => _isConnected;

  CashuMintWebSocket(this.mintURL);

  void connect() {
    if (_isConnected) return;

    try {
      final wsUrl = _getWsUrl(mintURL);
      _logger.d('[CashuWS] Connecting to $wsUrl');
      _channel = WebSocketChannel.connect(Uri.parse(wsUrl));
      _isConnected = true;

      _channel!.stream.listen(
        _onMessage,
        onDone: _onDone,
        onError: _onError,
      );
    } catch (e) {
      _isConnected = false;
      _logger.e('[CashuWS] Connection failed: $e');
      rethrow;
    }
  }

  void disconnect() {
    _channel?.sink.close();
    _isConnected = false;
    _channel = null;
    _pendingRequests.clear();
    for (var controller in _activeSubscriptions.values) {
      controller.close();
    }
    _activeSubscriptions.clear();
  }

  Future<Stream<Map<String, dynamic>>> subscribe(
      String kind, List<String> filters) async {
    if (!isConnected) {
      connect();
    }

    final id = _idCounter++;
    final subId = const Uuid().v4();
    final req = Nut17.createSubscriptionRequest(
      kind: kind,
      filters: filters,
      subId: subId,
      id: id,
    );

    final completer = Completer<String>();
    _pendingRequests[id] = completer;

    final controller = StreamController<Map<String, dynamic>>();
    _activeSubscriptions[subId] = controller;

    _channel!.sink.add(jsonEncode(req));

    try {
      // Wait for the server to acknowledge the subscription
      await completer.future;
      return controller.stream;
    } catch (e) {
      _activeSubscriptions.remove(subId);
      controller.close();
      rethrow;
    }
  }

  Future<void> unsubscribe(String subId) async {
    if (!isConnected) return;

    final id = _idCounter++;
    final req = Nut17.createCloseSubscriptionRequest(subId: subId, id: id);

    _channel!.sink.add(jsonEncode(req));
    // We can await a response if we want, but usually fire and forget or simple ack for unsub.

    await _activeSubscriptions[subId]?.close();
    _activeSubscriptions.remove(subId);
  }

  String _getWsUrl(String httpUrl) {
    Uri uri = Uri.parse(httpUrl);
    String scheme = uri.scheme == 'https' ? 'wss' : 'ws';
    // Append /v1/ws

    String path = uri.path;
    if (path.endsWith('/')) {
      path = path.substring(0, path.length - 1);
    }

    if (!path.endsWith('/v1/ws')) {
      path = '$path/v1/ws';
    }

    return uri.replace(scheme: scheme, path: path).toString();
  }

  void _onMessage(dynamic message) {
    try {
      final Map<String, dynamic> data = jsonDecode(message);

      // 1. Handle Response to a Request (e.g. subscribe response)
      if (data.containsKey('id') && data['id'] != null) {
        final id = data['id'] as int;
        if (_pendingRequests.containsKey(id)) {
          final completer = _pendingRequests.remove(id);
          if (data.containsKey('error') && data['error'] != null) {
            completer?.completeError(data['error']);
          } else {
            // Success response to subscribe or unsubscribe
            // We can complete with a dummy value or the result if needed.
            completer?.complete("OK");
          }
        }
        return;
      }

      // 2. Handle Notifications (method = subscribe, params = { subId: ..., payload: ... })
      // Or method = "subscription"
      if (data.containsKey('method') &&
          data['method'] == Nut17.methodSubscribe) {
        final params = data['params'] as Map<String, dynamic>;
        final subId = params['subId'] as String?;
        final payload = params['payload'] ??
            params['result']; // Helper if they nest it differently

        if (subId != null && _activeSubscriptions.containsKey(subId)) {
          _activeSubscriptions[subId]?.add(
              payload is Map<String, dynamic> ? payload : {'data': payload});
        }
      }
    } catch (e) {
      _logger.e('[CashuWS] Error parsing message: $e');
    }
  }

  void _onDone() {
    _isConnected = false;
    _logger.d('[CashuWS] Connection closed');
    // Reconnect logic could go here
    _cleanup();
  }

  void _onError(error) {
    _isConnected = false;
    _logger.e('[CashuWS] Connection error: $error');
    _cleanup();
  }

  void _cleanup() {
    for (var c in _pendingRequests.values) {
      c.completeError("Connection closed");
    }
    _pendingRequests.clear();
    // Close active subs? or keep them open for reconnect?
    // For now, close them.
    for (var c in _activeSubscriptions.values) {
      c.close();
    }
    _activeSubscriptions.clear();
  }
}
