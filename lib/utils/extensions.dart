extension DateTimeExtensions on DateTime {
  int toSecondsSinceEpoch() {
    return millisecondsSinceEpoch ~/ Duration.millisecondsPerSecond;
  }

  bool isSameDate(DateTime other) {
    return day == other.day && year == other.year && month == other.month;
  }

  bool differenceInHours(DateTime other) {
    return difference(other).inMinutes > 180;
  }

  DateTime basicDate() {
    return DateTime(year, month, day);
  }

  String toHourMinutes() {
    final totalSeconds = hour * 3600 + minute * 60;
    return durationToString(totalSeconds);
  }
}

String durationToString(int seconds) {
  var d = Duration(seconds: seconds);
  List<String> parts = d.toString().split(':');
  return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
}
