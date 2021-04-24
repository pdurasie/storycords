class Formatter {
  static String toDurationString(int length) {
    return "${length ~/ 60}:${length % 60}";
  }
}
