import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tonband/infrastructure/providers/providers.dart';
import 'package:tonband/ui/homescreen/HomeTopicCard.dart';
import 'package:tonband/ui/homescreen/HomeWelcomeHeader.dart';

import '../../style.dart';
import 'HomeCategoryTitle.dart';

const _bodyOffset = 0.07;

class HomeBodyWidget extends StatelessWidget {
  final _bodyTopOffsetMultiplier =
      WelcomeHeaderWidget.headerSizeMultiplier - _bodyOffset;

  HomeBodyWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              // add top margin to have only slight overlap to the header
              top:
                  MediaQuery.of(context).size.height * _bodyTopOffsetMultiplier,
              left: 8,
              right: 8),
          child: Material(
            elevation: 20,
            borderRadius: BorderRadius.vertical(top: Radius.circular(60.0)),
            clipBehavior: Clip.antiAlias,
            child: Container(
              color: colorGreyBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //this container makes sure everything is below the circular main card radius
                  Container(
                      height: MediaQuery.of(context).size.height * _bodyOffset),
                  HomeCategoryTitle("Gerade beliebt"), //TODO get from API
                  Consumer(builder: (context, watch, child) {
                    final responseAsyncValue = watch(topicsProvider);
                    return responseAsyncValue.map(
                      data: (topics) => Column(
                        children: [
                          for (var topic in topics.value) HomeTopicCard(topic)
                        ],
                      ),
                      loading: (_) => Container(
                          height: MediaQuery.of(context)
                              .size
                              .height, //TODO this is not true (too large)
                          child: Center(
                              child: CircularProgressIndicator.adaptive())),
                      error: (_) => Text(
                        _.error.toString(),
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
