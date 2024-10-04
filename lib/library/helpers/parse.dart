class ParseHelper {
  static bool parseBool(dynamic text) {
    return text.toString().compareTo("1") == 0 || text.toString().compareTo("true") == 0;
  }

  static String numberAsCurrency(num value) {
    return value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1);
  }
}
