import 'package:flutter/material.dart';
import 'package:storycords/ui/components/HomeWelcomeHeader.dart';

import 'HomeCategoryTitle.dart';
import 'HomeCordSelection.dart';

const _bodyOffset = 0.07;

class HomeBodyWidget extends StatelessWidget {
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
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60), topRight: Radius.circular(60)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //this container makes sure everything is below the circular main card radius
              Container(
                  height: MediaQuery.of(context).size.height * _bodyOffset),
              HomeCategoryTitle(),
              HomeCordCard(),
            ],
          ),
        ),
      ),
    );
  }
}
