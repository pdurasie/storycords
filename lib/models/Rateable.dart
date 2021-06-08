import 'package:flutter/cupertino.dart';

import 'Rating.dart';

/// This class is used as an abstraction for the upvoting/downvoting feature.
/// Topics, Tonbands, (Comments?),.. all are rateable, but have different
/// behaviour on voting (different documents on backend side must be updated).
///
/// The cool thing with this is that you can implement the "rating" widget anywhere
/// and let the model class handle the voting logic.
abstract class Rateable {
  Rating rating;
  bool isUpvoted;
  bool isDownvoted;

  Rateable(this.rating, this.isUpvoted, this.isDownvoted);

  void upvote(BuildContext context);
  void downvote(BuildContext context);
}
