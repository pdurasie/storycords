import 'package:flutter/material.dart';
import 'package:tonband/models/Topic.dart';

class RatingBoxVertical extends StatelessWidget {
  const RatingBoxVertical({
    Key? key,
    required Topic topic,
  })   : _topic = topic,
        super(key: key);

  final Topic _topic;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.keyboard_arrow_up),
            onPressed: () {},
          ),
          Text(
            _topic.rating.toString(),
            textAlign: TextAlign.left,
          ),
          IconButton(
            icon: Icon(Icons.keyboard_arrow_down),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
