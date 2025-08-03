import 'dart:convert';

/// Used to stop previous subscriptions.
class Closed {
  /// subscription_id is a random string that should be used to represent a subscription.
  late String subscriptionId;
  String? message;

  /// Default constructor
  Closed(this.subscriptionId);

  /// Serialize to nostr close message
  /// - ["CLOSE", subscription_id]
  String serialize() {
    return jsonEncode(['CLOSED', subscriptionId]);
  }

  /// Deserialize a nostr close message
  /// - ["CLOSE", subscription_id]
  Closed.deserialize(input) {
    assert(input.length >= 2);
    subscriptionId = input[1];
    message = input[2];
  }
}
