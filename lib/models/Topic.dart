import 'package:flutter/cupertino.dart';
import 'package:tonband/models/Rateable.dart';

import 'Rating.dart';

class Topic implements Rateable {
  String title = "";
  String author = "";
  String description = "";

  DateTime? dateCreated = DateTime.now(); //TODO remove this placeholder
  @override
  bool isUpvoted;
  @override
  bool isDownvoted;
  @override
  Rating rating;

  /// This variable may seem redundant at first. But we are saving a
  /// database query by not having to look up the number of entries in the
  /// corresponding recordings array.
  /// Databases should be optimized for reading, not writing, after all.
  int numberOfRecordings;

  Topic({
    this.title = "",
    this.author = "",
    this.description = "",
    required this.rating,
    this.isUpvoted = false,
    this.isDownvoted = false,
    this.numberOfRecordings = 0,
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
