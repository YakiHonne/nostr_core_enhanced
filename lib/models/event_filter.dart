import 'package:nostr_core_enhanced/nostr/event.dart';

abstract class EventFilter {
  bool filter(Event event);
}
