import 'package:tonband/models/Recording.dart';

class Topic {
  String title = "";
  String author = "";
  String description = "";
  int rating = 0;
  List<Recording>? recordings;

  Topic({
    this.title = "",
    this.author = "",
    this.description = "",
    this.rating = 0,
    this.recordings,
  }) : super();
}
