import 'package:flutter/material.dart';
import 'package:tonband/models/Topic.dart';
import 'package:tonband/ui/components/CardWidgetWithShadow.dart';
import 'package:tonband/util/Formatter.dart';

import '../ScreenTopicDetailPage.dart';
import 'VerticalRatingBox.dart';

class HomeTopicCard extends StatelessWidget {
  final Topic _topic;
  const HomeTopicCard(this._topic) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: SizedBox(
        height: 120,
        width: MediaQuery.of(context).size.width,
        child: CardWidgetWithShadowAndInkwell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ScreenTopicDetailPage(_topic))),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: TextDataContainer(_topic),
              ),
              RatingBoxVertical(
                rateable: _topic,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextDataContainer extends StatelessWidget {
  final Topic _topic;
  const TextDataContainer(this._topic) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, bottom: 6.0, left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildTitleRow(context), _buildBottomRow(context)],
      ),
    );
  }

  Expanded _buildTitleRow(BuildContext context) {
    return Expanded(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: _topic.title),
            TextSpan(text: "\n"),
            TextSpan(
                text: "${_topic.dateCreated?.formatToTimeAgo() ?? ""}",
                style: Theme.of(context).textTheme.caption)
          ],
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }

  RichText _buildBottomRow(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: _topic.numberOfRecordings.toString(),
          style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 14)),
      WidgetSpan(
          child: Icon(
        Icons.mic_none,
        size: 14,
      )),
    ]));
  }
}
