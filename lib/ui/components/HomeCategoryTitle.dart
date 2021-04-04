import 'package:flutter/material.dart';

import '../../style.dart';

class HomeCategoryTitle extends StatelessWidget {
  final String title;
  const HomeCategoryTitle(this.title) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(paddingDefault),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
