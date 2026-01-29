class Nut17 {
  static const String methodSubscribe = 'subscribe';
  static const String methodUnsubscribe = 'unsubscribe';
  static const String kindBolt11MintQuote = 'bolt11_mint_quote';
  static const String kindBolt11MeltQuote = 'bolt11_melt_quote';
  static const String kindProofState = 'proof_state';

  static Map<String, dynamic> createSubscriptionRequest({
    required String kind,
    required List<String> filters,
    required String subId,
    required int id,
  }) {
    return {
      'jsonrpc': '2.0',
      'method': methodSubscribe,
      'params': {
        'kind': kind,
        'filters': filters,
        'subId': subId,
      },
      'id': id,
    };
  }

  static Map<String, dynamic> createCloseSubscriptionRequest({
    required String subId,
    required int id,
  }) {
    return {
      'jsonrpc': '2.0',
      'method': methodUnsubscribe,
      'params': {
        'subId': subId,
      },
      'id': id,
    };
  }
}
