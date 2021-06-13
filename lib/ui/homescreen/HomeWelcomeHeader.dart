import 'package:flutter/material.dart';

import '../../style.dart';

// TODO: This doesn't work atm, but will be replaced by a new front page design anyway
class WelcomeHeaderWidget extends StatelessWidget {
  static const headerSizeMultiplier = 0.25;

  const WelcomeHeaderWidget() : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorPrimary,
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: paddingLarge),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "TONBAND",
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.w500)),
          ])),
        ),
      ),
    );
  }
}
