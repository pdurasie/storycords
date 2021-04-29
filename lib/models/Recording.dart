import 'Rating.dart';

class Recording {
  String title = "", author = "";
  int length = 0;
  Rating rating = Rating(0);
  //DateTime datePosted;
  //List<Comment>

  Recording(
      {this.title = "",
      this.author = "",
      this.length = 0,
      required this.rating})
      : super();
}
