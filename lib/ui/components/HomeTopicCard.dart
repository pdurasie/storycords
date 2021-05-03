import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tonband/models/Topic.dart';
import 'package:tonband/ui/ScreenTopicDetail.dart';
import 'package:tonband/ui/components/CardWidgetWithShadow.dart';

import 'VerticalRatingBox.dart';

class HomeTopicCard extends ConsumerWidget {
  final Topic _topic;
  const HomeTopicCard(this._topic) : super();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: SizedBox(
        height: 120,
        width: MediaQuery.of(context).size.width,
        child: CardWidgetWithShadowAndInkwell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ScreenTopicDetail(_topic))),
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

  @override
  void downvote() {}

  @override
  void upvote() {
    // TODO: implement upvote
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
                text: "von ${_topic.author}",
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
          text: _topic.recordingsAmount.toString(),
          style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 14)),
      WidgetSpan(
          child: Icon(
        Icons.mic_none,
        size: 14,
      )),
    ]));
  }
}
