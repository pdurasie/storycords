import 'package:flutter/material.dart';

class RatingBoxVertical extends StatelessWidget {
  const RatingBoxVertical({
    Key? key,
    required int rating,
  })   : _rating = rating,
        super(key: key);

  final int _rating;

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
            _rating.toString(),
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
