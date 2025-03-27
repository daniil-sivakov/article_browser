class DateFormatter {
  String mdhhmm(DateTime dateTime) {
    final RegExp regex = RegExp(r"(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2})");

    final Match? match = regex.firstMatch(dateTime.toIso8601String());

    if (match == null) {
      return '';
    }

    final String month = match.group(2)!;
    final String day = match.group(3)!;
    final String hour = match.group(4)!;
    final String minute = match.group(5)!;

    final String formatted = "$hour:$minute $month-$day";

    return formatted;
  }
}
