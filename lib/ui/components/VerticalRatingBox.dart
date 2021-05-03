import 'package:flutter/material.dart';
import 'package:tonband/models/Pair.dart';
import 'package:tonband/models/Rateable.dart';
import 'package:tonband/util/Formatter.dart';

import '../../style.dart';

class RatingBoxVertical extends StatefulWidget {
  final Rateable rateable;
  RatingBoxVertical({
    required this.rateable,
    Key? key,
  });

  @override
  _RatingBoxVerticalState createState() => _RatingBoxVerticalState();
}

class _RatingBoxVerticalState extends State<RatingBoxVertical> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(
                Icons.keyboard_arrow_up,
                size: getUpvoteIconSpecs().first,
                color: getUpvoteIconSpecs().second,
              ),
              onPressed: widget.rateable.isDownvoted ? _emptyClick : _upvote),
          Text(
            widget.rateable.rating.total.toRatingString(),
            textAlign: TextAlign.left,
          ),
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: getDownvoteIconSpecs().first,
              color: getDownvoteIconSpecs().second,
            ),
            onPressed: widget.rateable.isUpvoted ? _emptyClick : _downvote,
          ),
        ],
      ),
    );
  }

  Pair getUpvoteIconSpecs() {
    double iconSize = 24;
    Color voteIconColor = Colors.black;
    if (widget.rateable.isUpvoted) {
      iconSize = 34;
      voteIconColor = colorPrimary;
    } else if (widget.rateable.isDownvoted) {
      iconSize = 18;
      voteIconColor = Colors.grey;
    }
    return Pair(iconSize, voteIconColor);
  }

  Pair getDownvoteIconSpecs() {
    double iconSize = 24;
    Color voteIconColor = Colors.black;
    if (widget.rateable.isDownvoted) {
      iconSize = 34;
      voteIconColor = colorAccent;
    } else if (widget.rateable.isUpvoted) {
      iconSize = 18;
      voteIconColor = Colors.grey;
    }
    return Pair(iconSize, voteIconColor);
  }

  void _upvote() {
    setState(() {
      if (!widget.rateable.isUpvoted) {
        widget.rateable.upvote(context);
      }
    });
  }

  void _downvote() {
    setState(() {
      if (!widget.rateable.isDownvoted) {
        widget.rateable.downvote(context);
      }
    });
  }

  void _emptyClick() {
    //let the button catch the click, but don't do anything
  }
}
