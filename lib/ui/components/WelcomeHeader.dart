import 'package:flutter/material.dart';

import '../../style.dart';

class WelcomeHeaderWidget extends StatelessWidget {
  const WelcomeHeaderWidget() : super();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          child: Container(
            height: size.height * 0.2,
            width: size.width,
            color: colorPrimary,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: paddingLarge),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "STORYCORDS",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.w500)),
                ])),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
