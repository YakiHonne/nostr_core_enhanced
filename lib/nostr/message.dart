import 'dart:convert';

import 'package:nostr_core_enhanced/nostr/closed.dart';
import 'package:nostr_core_enhanced/nostr/nostr.dart';
import 'package:nostr_core_enhanced/nostr/remote_cache_event.dart';

import '../cache/remote_cache_service.dart';

// Used to deserialize any kind of message that a nostr client or relay can transmit.
class Message {
  late String type;
  late dynamic message;

// nostr message deserializer
  Message.deserialize(String payload) {
    dynamic data = jsonDecode(payload);
    var messages = [
      'EVENT',
      'REQ',
      'CLOSE',
      'CLOSED',
      'NOTICE',
      'EOSE',
      'OK',
      'AUTH'
    ];

    assert(messages.contains(data[0]), 'Unsupported payload (or NIP)');

    type = data[0];
    switch (type) {
      case 'EVENT':
        message = Event.deserialize(data);
        break;
      case 'REQ':
        message = Request.deserialize(data);
        break;
      case 'CLOSE':
        message = Close.deserialize(data);
        break;
      case 'CLOSED':
        message = Closed.deserialize(data);
        break;
      default:
        message = jsonEncode(data.sublist(1));
        break;
    }
  }
}

class RemoteCacheMessage {
  late String type;
  late dynamic message;

  RemoteCacheMessage.deserialize(String payload) {
    dynamic data = jsonDecode(payload);

    var messages = [
      'EVENT',
      'REQ',
      'CLOSE',
      'EOSE',
    ];

    assert(messages.contains(data[0]), 'Unsupported payload (or NIP)');

    type = data[0];

    switch (type) {
      case 'EVENT':
        {
          message = data[2]['kind'] > 1000000
              ? RemoteCacheEvent.deserialize(data)
              : Event.deserialize(data);
        }
        break;
      case 'REQ':
        message = RemoteCacheRequest.deserialize(data);
        break;
      case 'CLOSE':
        message = Close.deserialize(data);
        break;
      case 'CLOSED':
        message = Closed.deserialize(data);
        break;
      default:
        message = jsonEncode(data.sublist(1));
        break;
    }
  }
}
