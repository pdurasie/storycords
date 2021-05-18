import 'package:tonband/models/Rating.dart';

class Comment {
  String bodyText = "";
  Rating rating;
  DateTime datePosted;

  Comment(this.bodyText, this.rating, this.datePosted);
}
