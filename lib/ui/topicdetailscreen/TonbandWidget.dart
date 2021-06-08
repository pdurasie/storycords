import 'package:flutter/material.dart';
import 'package:tonband/models/Tonband.dart';
import 'package:tonband/style.dart';
import 'package:tonband/ui/components/CardWidgetWithShadow.dart';
import 'package:tonband/ui/components/VerticalRatingBox.dart';
import 'package:tonband/util/Formatter.dart';

import '../../style.dart';

class TonbandWidget extends StatelessWidget {
  final Tonband tonband;
  final GestureTapCallback? onTap;
  const TonbandWidget({Key? key, required this.tonband, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CardWidgetWithShadowAndInkwell(
        onTap: onTap,
        child: Row(
          children: [
            PlayButtonWithTime(timeString: tonband.length.toDurationString()),
            InfoText(
              tonband: tonband,
            ),
            RatingBoxVertical(
              rateable: tonband,
            )
          ],
        ),
      ),
    );
  }
}

class InfoText extends StatelessWidget {
  final Tonband tonband;

  const InfoText({
    required this.tonband,
    Key? key,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: RichText(
          text: TextSpan(
        children: [
          TextSpan(
              text: tonband.title,
              style: Theme.of(context).textTheme.bodyText1),
          WidgetSpan(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.0),
            child: Container(),
          )),
          TextSpan(text: "\n"),
          TextSpan(
              text: "von ${tonband.author} vor 2 Jahren",
              style: Theme.of(context).textTheme.caption),
          WidgetSpan(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Container(),
          )),
          WidgetSpan(
              child: TonbandMetaInfoRow(
            tonband: tonband,
          ))
        ],
      )),
    );
  }
}

class TonbandMetaInfoRow extends StatelessWidget {
  final Tonband tonband;

  const TonbandMetaInfoRow({
    required this.tonband,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.chat_bubble_outline,
          color: Colors.grey,
          size: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            tonband.comments?.length.toString() ?? "0",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
      ],
    );
  }
}

class PlayButtonWithTime extends StatelessWidget {
  final String timeString;
  const PlayButtonWithTime({
    Key? key,
    required this.timeString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0, right: 12.0),
      child: Column(
        children: [
          Icon(
            Icons.play_circle_outline,
            color: colorPrimary,
            size: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text(timeString),
          )
        ],
      ),
    );
  }
}
