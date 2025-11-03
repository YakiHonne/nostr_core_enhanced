import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

/// Byte reader that preserves the socket for WebSocket usage
class TorByteStream {
  final Socket socket;
  final _controller = StreamController<Uint8List>();
  final Queue<int> _buffer = Queue<int>();
  StreamSubscription? _subscription;
  bool _detached = false;

  TorByteStream(this.socket) {
    // We MUST listen here, but we'll forward remaining data later
    _subscription = socket.listen(
      (data) {
        if (!_detached) {
          _buffer.addAll(data);
        } else {
          // Forward to controller after detach
          _controller.add(data);
        }
      },
      onError: _controller.addError,
      onDone: _controller.close,
    );
  }

  Future<Uint8List> read(int count) async {
    if (_detached) {
      throw StateError('Already detached');
    }

    final timeout = DateTime.now().add(Duration(seconds: 60));

    while (_buffer.length < count) {
      if (DateTime.now().isAfter(timeout)) {
        throw TimeoutException('Read timeout');
      }
      await Future.delayed(Duration(milliseconds: 10));
    }

    final result = Uint8List.fromList(_buffer.take(count).toList());
    for (int i = 0; i < count; i++) {
      _buffer.removeFirst();
    }

    return result;
  }

  /// Returns a socket wrapper that WebSocket can use
  Socket detachSocket() {
    _detached = true;

    // If there's buffered data, emit it first
    if (_buffer.isNotEmpty) {
      _controller.add(Uint8List.fromList(_buffer.toList()));
      _buffer.clear();
    }

    return _SocketWrapper(socket, _controller.stream);
  }

  Future<void> close() async {
    await _subscription?.cancel();
    await _controller.close();
    await socket.close();
  }
}

/// Wrapper that makes the socket's stream appear "fresh" to WebSocket
class _SocketWrapper implements Socket {
  final Socket _socket;
  final Stream<Uint8List> _stream;

  _SocketWrapper(this._socket, this._stream);

  @override
  StreamSubscription<Uint8List> listen(
    void Function(Uint8List event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return _stream.listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }

  // Delegate everything else to the original socket
  @override
  Encoding get encoding => _socket.encoding;

  @override
  set encoding(Encoding value) => _socket.encoding = value;

  @override
  void write(Object? object) => _socket.write(object);

  @override
  void writeln([Object? object = ""]) => _socket.writeln(object);

  @override
  void writeAll(Iterable objects, [String separator = ""]) =>
      _socket.writeAll(objects, separator);

  @override
  void add(List<int> data) => _socket.add(data);

  @override
  void addError(Object error, [StackTrace? stackTrace]) =>
      _socket.addError(error, stackTrace);

  @override
  Future addStream(Stream<List<int>> stream) => _socket.addStream(stream);

  @override
  void writeCharCode(int charCode) => _socket.writeCharCode(charCode);

  @override
  Future flush() => _socket.flush();

  @override
  Future close() => _socket.close();

  @override
  Future get done => _socket.done;

  @override
  InternetAddress get address => _socket.address;

  @override
  int get port => _socket.port;

  @override
  InternetAddress get remoteAddress => _socket.remoteAddress;

  @override
  int get remotePort => _socket.remotePort;

  @override
  bool setOption(SocketOption option, bool enabled) =>
      _socket.setOption(option, enabled);

  @override
  Uint8List getRawOption(RawSocketOption option) =>
      _socket.getRawOption(option);

  @override
  void setRawOption(RawSocketOption option) => _socket.setRawOption(option);

  @override
  void destroy() => _socket.destroy();

  // Additional Stream methods
  @override
  bool get isBroadcast => _stream.isBroadcast;

  @override
  Stream<Uint8List> asBroadcastStream({
    void Function(StreamSubscription<Uint8List> subscription)? onListen,
    void Function(StreamSubscription<Uint8List> subscription)? onCancel,
  }) {
    return _stream.asBroadcastStream(onListen: onListen, onCancel: onCancel);
  }

  @override
  Stream<Uint8List> where(bool Function(Uint8List event) test) =>
      _stream.where(test);

  @override
  Stream<S> map<S>(S Function(Uint8List event) convert) => _stream.map(convert);

  @override
  Stream<E> asyncMap<E>(FutureOr<E> Function(Uint8List event) convert) =>
      _stream.asyncMap(convert);

  @override
  Stream<E> asyncExpand<E>(Stream<E>? Function(Uint8List event) convert) =>
      _stream.asyncExpand(convert);

  @override
  Stream<Uint8List> handleError(Function onError,
          {bool Function(dynamic error)? test}) =>
      _stream.handleError(onError, test: test);

  @override
  Stream<S> expand<S>(Iterable<S> Function(Uint8List element) convert) =>
      _stream.expand(convert);

  @override
  Future pipe(StreamConsumer<Uint8List> streamConsumer) =>
      _stream.pipe(streamConsumer);

  @override
  Stream<S> transform<S>(StreamTransformer<Uint8List, S> streamTransformer) =>
      _stream.transform(streamTransformer);

  @override
  Future<Uint8List> reduce(
          Uint8List Function(Uint8List previous, Uint8List element) combine) =>
      _stream.reduce(combine);

  @override
  Future<S> fold<S>(
          S initialValue, S Function(S previous, Uint8List element) combine) =>
      _stream.fold(initialValue, combine);

  @override
  Future<String> join([String separator = ""]) => _stream.join(separator);

  @override
  Future<bool> contains(Object? needle) => _stream.contains(needle);

  @override
  Future forEach(void Function(Uint8List element) action) =>
      _stream.forEach(action);

  @override
  Future<bool> every(bool Function(Uint8List element) test) =>
      _stream.every(test);

  @override
  Future<bool> any(bool Function(Uint8List element) test) => _stream.any(test);

  @override
  Future<int> get length => _stream.length;

  @override
  Future<bool> get isEmpty => _stream.isEmpty;

  @override
  Stream<Uint8List> take(int count) => _stream.take(count);

  @override
  Stream<Uint8List> takeWhile(bool Function(Uint8List element) test) =>
      _stream.takeWhile(test);

  @override
  Stream<Uint8List> skip(int count) => _stream.skip(count);

  @override
  Stream<Uint8List> skipWhile(bool Function(Uint8List element) test) =>
      _stream.skipWhile(test);

  @override
  Stream<Uint8List> distinct(
          [bool Function(Uint8List previous, Uint8List next)? equals]) =>
      _stream.distinct(equals);

  @override
  Future<Uint8List> get first => _stream.first;

  @override
  Future<Uint8List> get last => _stream.last;

  @override
  Future<Uint8List> get single => _stream.single;

  @override
  Future<Uint8List> firstWhere(bool Function(Uint8List element) test,
          {Uint8List Function()? orElse}) =>
      _stream.firstWhere(test, orElse: orElse);

  @override
  Future<Uint8List> lastWhere(bool Function(Uint8List element) test,
          {Uint8List Function()? orElse}) =>
      _stream.lastWhere(test, orElse: orElse);

  @override
  Future<Uint8List> singleWhere(bool Function(Uint8List element) test,
          {Uint8List Function()? orElse}) =>
      _stream.singleWhere(test, orElse: orElse);

  @override
  Future<Uint8List> elementAt(int index) => _stream.elementAt(index);

  @override
  Stream<Uint8List> timeout(Duration timeLimit,
          {void Function(EventSink<Uint8List> sink)? onTimeout}) =>
      _stream.timeout(timeLimit, onTimeout: onTimeout);

  @override
  Future<List<Uint8List>> toList() => _stream.toList();

  @override
  Future<Set<Uint8List>> toSet() => _stream.toSet();

  @override
  Stream<R> cast<R>() => _stream.cast<R>();

  @override
  Future<E> drain<E>([E? futureValue]) => _stream.drain(futureValue);
}
