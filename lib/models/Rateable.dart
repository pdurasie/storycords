import 'package:flutter/cupertino.dart';

import 'Rating.dart';

abstract class Rateable {
  Rating rating;
  bool isUpvoted;
  bool isDownvoted;

  Rateable(this.rating, this.isUpvoted, this.isDownvoted);

  void upvote(BuildContext context);
  void downvote(BuildContext context);
}
