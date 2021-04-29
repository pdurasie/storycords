import 'Rating.dart';

class Topic {
  String title = "";
  String author = "";
  String description = "";

  Rating rating = Rating(0);

  int recordingsAmount;

  Topic({
    this.title = "",
    this.author = "",
    this.description = "",
    required this.rating,
    this.recordingsAmount = 0,
  }) : super();
}
