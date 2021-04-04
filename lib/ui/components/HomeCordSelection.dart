import 'package:flutter/material.dart';

import '../../style.dart';

class HomeCordSelection extends StatelessWidget {
  const HomeCordSelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Padding(
            padding: EdgeInsets.all(paddingDefault),
            child: Text(
              "Gerade beliebt",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
      ],
    );
  }
}
