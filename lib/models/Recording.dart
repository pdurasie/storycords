import 'package:flutter/cupertino.dart';
import 'package:tonband/models/Rateable.dart';

import 'Rating.dart';

class Recording implements Rateable {
  String title = "", author = "";
  int length = 0;
  @override
  bool isUpvoted;
  @override
  bool isDownvoted;
  @override
  Rating rating;
  //DateTime datePosted;
  //List<Comment>

  Recording(
      {this.title = "",
      this.author = "",
      this.length = 0,
      required this.rating,
      this.isUpvoted = false,
      this.isDownvoted = false})
      : super();

  @override
  void downvote(BuildContext context) {
    rating.downvotes++;
    isDownvoted = true;
    //upload downvote to server
  }

  @override
  void upvote(BuildContext context) {
    //context.read(provider)
    rating.upvotes++;
    isUpvoted = true;
  }
}
