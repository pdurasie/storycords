import 'package:flutter/material.dart';
import 'package:tonband/ui/components/CurrentlyPlayingControllerRow.dart';

import 'HomeBody.dart';
import 'HomeWelcomeHeader.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // we want to implement a sort of parallax behaviour,
      // so header and body are aligned in a stack where we scroll
      // over the header.
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                WelcomeHeaderWidget(),
                HomeBodyWidget(),
              ],
            ),
          ),
          Hero(
              tag: CurrentlyPlayingControllerRow.tag,
              child: CurrentlyPlayingControllerRow()),
        ],
      ),
    );
  }
}
