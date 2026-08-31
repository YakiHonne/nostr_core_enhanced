import 'dart:convert';

import 'package:nostr_core_enhanced/nostr/message.dart';

class Nip20 {
  static OKEvent? getOk(String okPayload) {
    var ok = Message.deserialize(okPayload);
    if (ok.type == 'OK') {
      var object = jsonDecode(ok.message) as List;
      return OKEvent(
        object[0]?.toString() ?? '',
        object.length > 1 && object[1] == true,
        object.length > 2 ? (object[2]?.toString() ?? '') : '',
      );
    }
    return null;
  }
}

class OKEvent {
  String eventId;
  bool status;
  String message;

  OKEvent(this.eventId, this.status, this.message);
}
