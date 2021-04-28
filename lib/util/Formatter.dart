class Formatter {
  static String toDurationString(int length) {
    final minutes = length ~/ 60; //integer division
    final seconds = (length % 60)
        .toString()
        .padLeft(2, '0'); //make sure it's 2 characters wide
    return "$minutes:$seconds";
  }
}
