import 'package:flutter/material.dart';
import 'package:storycords/ui/components/WelcomeHeader.dart';

import 'HomeCordSelection.dart';

class HomeBodyWidget extends StatelessWidget {
  static const _bodyOffset = 0.07;
  final _bodyTopOffsetMultiplier =
      WelcomeHeaderWidget.headerSizeMultiplier - _bodyOffset;

  const HomeBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: MediaQuery.of(context).size.height * _bodyTopOffsetMultiplier,
      child: SingleChildScrollView(
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60), topRight: Radius.circular(60)),
          ),
          child: Column(
            children: [
              //this container makes sure everything is below the circular card
              Container(
                  height: MediaQuery.of(context).size.height * _bodyOffset),
              HomeCordSelection(),
            ],
          ),
        ),
      ),
    );
  }
}
