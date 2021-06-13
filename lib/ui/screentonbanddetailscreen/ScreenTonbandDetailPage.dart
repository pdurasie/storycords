import 'package:flutter/material.dart';
import 'package:tonband/models/Tonband.dart';
import 'package:tonband/style.dart';
import 'package:tonband/ui/components/CurrentlyPlayingControllerRow.dart';

class ScreenTonbandDetailPage extends StatelessWidget {
  Tonband _tonband;
  ScreenTonbandDetailPage(this._tonband);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(children: [
          Expanded(
            child: Container(
              color: colorGreyBackground,
            ),
          ),
          CurrentlyPlayingControllerRow(),
        ]),
      ],
    );
  }
}
