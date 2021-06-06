import 'package:flutter/cupertino.dart';
import 'package:tonband/models/Rateable.dart';

import 'Comment.dart';
import 'Rating.dart';
import 'Topic.dart';

//TODO clean up the dummy default data after backend is configured
class Recording implements Rateable {
  String title = "";
  String author = "";
  String url = "https://s3.amazonaws.com/scifri-segments/scifri201711241.mp3";
  int length = 0;
  @override
  bool isUpvoted;
  @override
  bool isDownvoted;
  @override
  Rating rating;
  //DateTime datePosted;
  List<Comment>? comments;

  Topic parentTopic = Topic(
      title: "Dies ist ein ganz normales Topic, nichts Neues hier zu sehen",
      rating: Rating(32));

  Recording(
      {this.title = "",
      this.author = "",
      this.length = 0,
      required this.rating,
      this.isUpvoted = false,
      this.isDownvoted = false,
      required this.comments})
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
