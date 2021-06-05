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

extension CustomDateFormatter on DateTime {
  String formatToTimeAgo() {
    final int timeNow = DateTime.now().millisecondsSinceEpoch;
    final difference = timeNow - this.millisecondsSinceEpoch;

    final duration = Duration(milliseconds: difference);
    if (duration.inMinutes < 2) {
      return "Gerade eben";
    } else if (duration.inMinutes < 60) {
      return "vor ${duration.inMinutes} Minuten";
    } else if (duration.inHours < 2) {
      return "vor einer Stunde";
    } else if (duration.inHours < 24) {
      return "vor ${duration.inHours} Stunden";
    } else if (duration.inDays < 2) {
      return "Gestern";
    } else if (duration.inDays < 8) {
      return "Letzte Woche";
    } else if (duration.inDays < 43) {
      return "vor ${duration.inDays ~/ 7} Wochen";
    } else if (duration.inDays < 365) {
      return "vor ${(duration.inDays ~/ 30).round()} Monaten"; //this isn't totally clean, but everything else is overkill I think
    } else if (duration.inDays < 730) {
      return "Letztes Jahr";
    } else {
      return "vor ${duration.inDays ~/ 365} Jahren";
    }
  }
//jetzt
  //vor 59 Minuten
  //vor 20 Stunden
  //gestern
// vor 2 Tagen
//letzten Monat
// vor 1 Monat
// letztes Jahr
// vor 2 Jahren
}
