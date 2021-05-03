import 'package:flutter/cupertino.dart';
import 'package:tonband/models/Rateable.dart';

import 'Rating.dart';

class Topic implements Rateable {
  String title = "";
  String author = "";
  String description = "";
  @override
  bool isUpvoted;
  @override
  bool isDownvoted;
  @override
  Rating rating;

  int recordingsAmount;

  Topic({
    this.title = "",
    this.author = "",
    this.description = "",
    required this.rating,
    this.isUpvoted = false,
    this.isDownvoted = false,
    this.recordingsAmount = 0,
  }) : super();

  @override
  void downvote(BuildContext context) {
    if (isUpvoted) {}
    rating.downvotes++;
    isDownvoted = true;
    //upload downvote to server
    //cache downvote locally
  }

  @override
  Rating getRating() {
    return rating;
  }

  @override
  void upvote(BuildContext context) {
    //context.read(provider)
    rating.upvotes++;
    isUpvoted = true;
    //cache upvote locally
  }
}
