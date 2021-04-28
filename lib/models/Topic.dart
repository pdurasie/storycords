import 'package:tonband/models/Recording.dart';

import 'Rating.dart';

class Topic {
  String title = "";
  String author = "";
  String description = "";
  String asd = "";

  Rating rating = Rating(0);

  List<Recording>? recordings;

  Topic({
    this.title = "",
    this.author = "",
    this.description = "",
    this.recordings,
  }) : super();
}
