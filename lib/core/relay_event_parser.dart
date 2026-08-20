import 'dart:async';
import 'dart:collection';
import 'dart:isolate';

import '../nostr/message.dart';

/// Parses relay frames (EVENT/EOSE/NOTICE/OK/AUTH) on a long-lived background
/// isolate so jsonDecode + Event construction stay off the UI isolate
/// (merged with the Android main thread since Flutter 3.x — long parses
/// there are ANRs).
///
/// Every frame from a relay goes through here, in wire order — not just
/// EVENT. Relays send EVENT frames followed by EOSE, and callers close
/// subscriptions on EOSE; if EOSE were dispatched inline while its preceding
/// EVENTs were still queued for parsing, the subscription would already be
/// gone by the time those events arrived, silently dropping them. Routing
/// every frame type through the same batch/dispatch pipeline keeps them in
/// the order the relay sent them.
///
/// Frames are batched across the isolate boundary; per-frame round-trips
/// would erase the win. Callbacks fire on the main isolate, in arrival order.
///
/// The isolate and all queues are static: the app creates several NostrCore
/// instances (each with its own parser), and per-instance isolates piled up.
/// One isolate serves them all; each frame remembers its owner's callbacks.
class RelayEventParser {
  RelayEventParser({required this.onMessage, required this.onUnparsable});

  final void Function(Message message, String raw, String relay) onMessage;
  final void Function(String raw, String relay) onUnparsable;

  static const _maxBatch = 100;
  static const _flushDelay = Duration(milliseconds: 8);

  static final List<String> _pendingMessages = [];
  static final List<String> _pendingRelays = [];
  static final List<RelayEventParser> _pendingOwners = [];

  /// Batches sent (or queued to be sent) to the isolate, awaiting results.
  /// Replies arrive in FIFO order; on isolate death these are re-sent, so
  /// frames are never silently dropped.
  static final Queue<_Batch> _inFlight = Queue();

  static Timer? _flushTimer;
  static SendPort? _sendPort;
  static ReceivePort? _receivePort;
  static bool _spawning = false;
  static int _seq = 0;

  void add(String message, String relay) {
    _pendingMessages.add(message);
    _pendingRelays.add(relay);
    _pendingOwners.add(this);
    if (_pendingMessages.length >= _maxBatch) {
      _flush();
    } else {
      _flushTimer ??= Timer(_flushDelay, _flush);
    }
  }

  static void _flush() {
    _flushTimer?.cancel();
    _flushTimer = null;
    if (_pendingMessages.isEmpty) return;

    final batch = _Batch(
      _seq++,
      List.of(_pendingMessages),
      List.of(_pendingRelays),
      List.of(_pendingOwners),
    );
    _pendingMessages.clear();
    _pendingRelays.clear();
    _pendingOwners.clear();
    _inFlight.add(batch);

    final port = _sendPort;
    if (port != null) {
      port.send([batch.seq, batch.messages]);
    } else {
      _spawn();
    }
  }

  static Future<void> _spawn() async {
    // _spawning stays true until the handshake SendPort arrives, not just
    // until Isolate.spawn returns — flushes landing in that window used to
    // see (_sendPort == null && !_spawning) and spawn extra isolates.
    if (_spawning || _sendPort != null) return;
    _spawning = true;
    try {
      final receivePort = ReceivePort();
      await Isolate.spawn(
        parseMessagesIsolate,
        receivePort.sendPort,
        onExit: receivePort.sendPort,
        onError: receivePort.sendPort,
      );

      _receivePort = receivePort;
      receivePort.listen(_onIsolateMessage);
    } catch (_) {
      // Isolate unavailable: parse on the main isolate rather than drop.
      _spawning = false;
      _drainSynchronously();
    }
  }

  static void _onIsolateMessage(dynamic message) {
    if (message == null) {
      // onExit sentinel: the isolate died. Respawn and re-send what it
      // never answered.
      _receivePort?.close();
      _receivePort = null;
      _sendPort = null;
      if (_inFlight.isNotEmpty || _pendingMessages.isNotEmpty) {
        _spawn();
      }
      return;
    }

    if (message is SendPort) {
      // Handshake: isolate is up, send everything queued so far.
      _spawning = false;
      _sendPort = message;
      for (final batch in _inFlight) {
        message.send([batch.seq, batch.messages]);
      }
      return;
    }

    if (message is List && message.length == 2 && message[0] is int) {
      final seq = message[0] as int;
      if (_inFlight.isNotEmpty && _inFlight.first.seq == seq) {
        _dispatch(_inFlight.removeFirst(), message[1] as List);
      }
      // Stale seq (reply raced a respawn's re-send): ignore, the re-sent
      // batch's reply will dispatch it exactly once.
      return;
    }

    // onError payload ([error, stackTrace]); errorsAreFatal, so the onExit
    // null follows and triggers the respawn above.
  }

  static void _dispatch(_Batch batch, List results) {
    for (var i = 0; i < batch.messages.length; i++) {
      final m = results[i];
      final owner = batch.owners[i];
      if (m is Message) {
        owner.onMessage(m, batch.messages[i], batch.relays[i]);
      } else {
        owner.onUnparsable(batch.messages[i], batch.relays[i]);
      }
    }
  }

  static void _drainSynchronously() {
    _flushTimer?.cancel();
    _flushTimer = null;
    if (_pendingMessages.isNotEmpty) {
      _inFlight.add(_Batch(
        _seq++,
        List.of(_pendingMessages),
        List.of(_pendingRelays),
        List.of(_pendingOwners),
      ));
      _pendingMessages.clear();
      _pendingRelays.clear();
      _pendingOwners.clear();
    }
    while (_inFlight.isNotEmpty) {
      final batch = _inFlight.removeFirst();
      _dispatch(batch, parseMessageFrames(batch.messages));
    }
  }
}

class _Batch {
  final int seq;
  final List<String> messages;
  final List<String> relays;
  final List<RelayEventParser> owners;

  _Batch(this.seq, this.messages, this.relays, this.owners);
}

@pragma('vm:entry-point')
void parseMessagesIsolate(SendPort replyPort) {
  final receivePort = ReceivePort();
  replyPort.send(receivePort.sendPort);

  receivePort.listen((message) {
    final seq = message[0] as int;
    final frames = (message[1] as List).cast<String>();
    replyPort.send([seq, parseMessageFrames(frames)]);
  });
}

/// Null entries mark unparsable frames; the caller logs them.
List<Message?> parseMessageFrames(List<String> frames) {
  return [
    for (final frame in frames) _parseMessageFrame(frame),
  ];
}

Message? _parseMessageFrame(String frame) {
  try {
    return Message.deserialize(frame);
  } catch (_) {
    return null;
  }
}
