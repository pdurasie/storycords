import 'package:flutter/material.dart';
import 'package:tonband/models/Topic.dart';
import 'package:tonband/ui/components/HomeWelcomeHeader.dart';

import 'HomeCategoryTitle.dart';
import 'HomeTopicCard.dart';

const _bodyOffset = 0.07;

class HomeBodyWidget extends StatelessWidget {
  final _bodyTopOffsetMultiplier =
      WelcomeHeaderWidget.headerSizeMultiplier - _bodyOffset;

  final List<Topic> topics = List.generate(
    8,
    (index) => Topic(
      title:
          "Dies ist ein wundervolles, atemberaubendes Topic mit der Nummer $index",
      author: "mir",
      description:
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. ",
      rating: index * 12,
    ),
  );

  HomeBodyWidget({
    Key? key,
  }) : super(key: key);
//top: MediaQuery.of(context).size.height * _bodyTopOffsetMultiplier,
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
          // add top margin to have only slight overlap to the header
          top: MediaQuery.of(context).size.height * _bodyTopOffsetMultiplier,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60), topRight: Radius.circular(60)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //this container makes sure everything is below the circular main card radius
            Container(height: MediaQuery.of(context).size.height * _bodyOffset),
            HomeCategoryTitle("Gerade beliebt"),
            for (Topic topic in topics) HomeTopicCard(topic),
          ],
        ),
      ),
    );
  }
}