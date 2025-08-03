// ignore_for_file: non_constant_identifier_names

class Relay {
  static RegExp RELAY_URL_REGEX = RegExp(
    r'^(ws|wss):\/\/([0-9]{1,3}(?:\.[0-9]{1,3}){3}|[^:]+):?([0-9]{1,5})?$',
  );

  static String? clean(String adr) {
    if (adr.endsWith("/")) {
      adr = adr.substring(0, adr.length - 1);
    }
    if (adr.contains("%")) {
      adr = Uri.decodeComponent(adr);
    }
    adr = adr.trim();
    if (!RELAY_URL_REGEX.hasMatch(adr)) {
      return null;
    }
    return adr;
  }

  static String? removeSocket(String adr) {
    if (adr.endsWith("/")) {
      adr = adr.substring(0, adr.length - 1);
    }
    if (adr.contains("%")) {
      adr = Uri.decodeComponent(adr);
    }

    adr = adr.trim();

    if (!RELAY_URL_REGEX.hasMatch(adr)) {
      return null;
    }

    if (adr.startsWith('wss://')) {
      adr = adr.substring(6);
    }

    if (adr.startsWith('ws://')) {
      adr = adr.substring(5);
    }

    return adr;
  }
}
