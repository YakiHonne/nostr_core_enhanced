import 'dart:convert';

import 'package:bech32/bech32.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nostr_core_enhanced/nostr/nostr.dart';
import 'package:nostr_core_enhanced/utils/utils.dart';

class Zap {
  static String decodeLud06Link(String lud06) {
    var decoder = Bech32Decoder();
    var bech32Result = decoder.convert(lud06, 2000);
    var data = convertBits(bech32Result.data, 5, 8, false);
    return utf8.decode(data);
  }

  static String? getLud16LinkFromLud16(String lud16) {
    var strs = lud16.split('@');
    if (strs.length < 2) {
      return null;
    }

    var username = strs[0];
    var domainname = strs[1];

    return 'https://$domainname/.well-known/lnurlp/$username';
  }

  static String? getLud16FromLud06(String lud06) {
    try {
      if (StringUtil.isNotBlank(lud06) &&
          lud06.toLowerCase().startsWith('lnurl')) {
        final decode = decodeLud06Link(lud06);
        if (decode.isNotEmpty) {
          final uri = Uri.parse(decode);
          return '${uri.pathSegments[2]}@${uri.host}';
        }
        return null;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static String? getLnurlFromLud16(String lud16) {
    if (StringUtil.isBlank(lud16)) {
      return null;
    } else {
      try {
        var link = getLud16LinkFromLud16(lud16);
        List<int> data = utf8.encode(link!);
        data = convertBits(data, 8, 5, true);

        var encoder = Bech32Encoder();
        Bech32 input = Bech32('lnurl', data);
        var lnurl = encoder.convert(input, 2000);

        return lnurl.toUpperCase();
      } catch (_) {
        return null;
      }
    }
  }

  static Future<LnurlResponse?> getLnurlResponse(String link) async {
    try {
      Uri uri = Uri.parse(link).replace(scheme: 'https');

      var response = await http.get(uri);

      final data =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      if (data["callback"] != null) {
        return LnurlResponse.fromJson(data);
      }

      return null;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      return null;
    }
  }

  static Future<MapEntry<String, Event?>?> getInvoiceCode({
    required String lnurl,
    required String lud16Link,
    required num sats,
    required String recipientPubkey,
    String? eventId,
    String? aTag,
    required EventSigner signer,
    required List<String> relays,
    String? pollOption,
    String? comment,
    bool? removeNostrEvent,
  }) async {
    var lnurlResponse = await getLnurlResponse(lud16Link);

    if (lnurlResponse == null) {
      return null;
    }

    var callback = lnurlResponse.callback!;
    if (callback.contains('?')) {
      callback += '&';
    } else {
      callback += '?';
    }

    var amount = sats.toInt() * 1000;
    callback += 'amount=$amount';

    String eventContent = '';

    if (StringUtil.isNotBlank(comment)) {
      var commentNum = lnurlResponse.commentAllowed;
      if (commentNum != null) {
        if (commentNum < comment!.length) {
          comment = comment.substring(0, commentNum);
        }

        callback += '&comment=${Uri.encodeQueryComponent(comment)}';
        eventContent = comment;
      }
    }

    Event? event;

    if ((removeNostrEvent == null || !removeNostrEvent) &&
        recipientPubkey.isNotEmpty) {
      var tags = [
        ['relays', ...relays],
        ['amount', amount.toString()],
        ['lnurl', lnurl],
        if (recipientPubkey.isNotEmpty) ['p', recipientPubkey],
      ];

      if (StringUtil.isNotBlank(eventId)) {
        tags.add(['e', eventId!]);
      }

      if (StringUtil.isNotBlank(aTag)) {
        tags.add(['a', aTag!]);
      }

      if (StringUtil.isNotBlank(pollOption)) {
        tags.add(['poll_option', pollOption!]);
      }

      event = await Event.genEvent(
        kind: EventKind.ZAP_REQUEST,
        tags: tags,
        content: eventContent,
        signer: signer,
      );

      if (event != null) {
        var eventStr = Uri.encodeQueryComponent(jsonEncode(event));
        callback += '&nostr=$eventStr';
      }
    }

    callback += '&lnurl=$lnurl';

    Uri uri = Uri.parse(callback).replace(scheme: 'https');

    var response = await http.get(uri);

    final responseMap =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

    if (StringUtil.isNotBlank(responseMap['pr'])) {
      return MapEntry(responseMap['pr'], event);
    }

    return null;
  }
}
