import 'package:storycords/models/Recording.dart';

class Cord {
  String title = "";
  String author = "";
  String description = "";
  int rating = 0;
  List<Recording>? recordings;

  Cord({
    this.title = "",
    this.author = "",
    this.description = "",
    this.rating = 0,
    this.recordings,
  }) : super();
}
