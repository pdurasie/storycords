import 'package:intl/intl.dart';

extension NumberFormatter on int {
  String toDurationString() {
    final minutes = this ~/ 60; //integer division
    final seconds = (this % 60)
        .toString()
        .padLeft(2, '0'); //make sure it's 2 characters wide
    return "$minutes:$seconds";
  }

  String toRatingString() {
    return NumberFormat.compact().format(this);
  }
}
