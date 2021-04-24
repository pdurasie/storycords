import 'package:flutter/material.dart';
import 'package:tonband/models/Recording.dart';
import 'package:tonband/style.dart';
import 'package:tonband/ui/components/VerticalRatingBox.dart';
import 'package:tonband/util/Formatter.dart';

import '../../style.dart';

class RecordingWidget extends StatelessWidget {
  final Recording recording;
  const RecordingWidget({Key? key, required this.recording}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            //pass the recording down. Should consider provider for this
            PlayButtonWithTime(
                timeString: Formatter.toDurationString(
                    recording.length)), //pass in length
            InfoText(
              recording: recording,
            ),
            RatingBoxVertical(
              rating: 81,
            )
          ],
        ),
      ),
    );
  }
}

class InfoText extends StatelessWidget {
  final Recording recording;

  const InfoText({
    required this.recording,
    Key? key,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: RichText(
          text: TextSpan(
        children: [
          TextSpan(
              text: recording.title,
              style: Theme.of(context).textTheme.bodyText1),
          WidgetSpan(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.0),
            child: Container(),
          )),
          TextSpan(text: "\n"),
          TextSpan(
              text: "von ${recording.author} vor 2 Jahren",
              style: Theme.of(context).textTheme.caption),
          WidgetSpan(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Container(),
          )),
          WidgetSpan(child: RecordingMetaInfoRow())
        ],
      )),
    );
  }
}

class RecordingMetaInfoRow extends StatelessWidget {
  const RecordingMetaInfoRow({
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
            "41",
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
