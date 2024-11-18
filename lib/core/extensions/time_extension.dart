

extension DateTimeParsing on String {
  DateTime toDateTimeFromCustomFormat() {
    return DateTime.parse(this);
  }
}
