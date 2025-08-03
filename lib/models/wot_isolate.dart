// Class to handle errors from isolate
class IsolateError {
  final String error;
  final String stackTrace;

  IsolateError(this.error, this.stackTrace);
}

// Data class to pass to the isolate
class WotLoopInput {
  final List<String> cs;
  final Set<String> mutes;
  final Map<String, List<String>> followings;
  final Map<String, double> wot;

  WotLoopInput(this.cs, this.mutes, this.followings, this.wot);
}
