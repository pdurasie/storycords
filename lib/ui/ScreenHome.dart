import 'package:flutter/material.dart';

import 'components/HomeBody.dart';
import 'components/HomeWelcomeHeader.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //this is needed so that the stack fills the entire screen
          Container(
            height: double.infinity,
            width: double.infinity,
          ),
          WelcomeHeaderWidget(),
          HomeBodyWidget(),
        ],
      ),
    );
  }
}
