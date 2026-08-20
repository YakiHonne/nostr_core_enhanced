/// fiatjaf's Pomegranate protocol: a Nostr secret key split with FROST/Shamir
/// across independent operator servers, with a central running OAuth and
/// exposing a NIP-46 bunker URL.
///
/// Protocol only — the OAuth WebView and all UI stay in the apps, as does
/// deployment policy (which central is default, which operators are offered).
library;

export 'pomegranate_crypto.dart';
export 'pomegranate_helpers.dart';
export 'pomegranate_lookup.dart';
