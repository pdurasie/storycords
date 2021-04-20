import 'package:flutter/material.dart';
import 'package:tonband/models/Cord.dart';

class CordRatingBox extends StatelessWidget {
  const CordRatingBox({
    Key? key,
    required Cord cord,
  })   : _cord = cord,
        super(key: key);

  final Cord _cord;

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
            _cord.rating.toString(),
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
