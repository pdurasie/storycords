import 'package:flutter/material.dart';
import 'package:tonband/models/Topic.dart';
import 'package:tonband/ui/ScreenTopicDetail.dart';

import '../../style.dart';
import 'VerticalRatingBox.dart';

const _topicCardRadius = 20.0;

class HomeTopicCard extends StatelessWidget {
  final Topic _topic;
  const HomeTopicCard(this._topic) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(paddingDefault),
      child: SizedBox(
        height: 120,
        width: MediaQuery.of(context).size.width,
        //Beware: Incredible workaround for adding shadow around the card.
        //You need to put a container under your ClipRRect via stack that
        //receives the shadow, but you also need to wrap the content
        // of the ClipRRect with a container with white background, so that
        // the shadow of your underlying container doesn't shine through.
        child: Stack(children: [
          // Dummy container for shadow
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(_topicCardRadius),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(2, 2),
                    blurRadius: 5.0),
              ],
            ),
          ),
          // The actual card body
          GestureDetector(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ScreenTopicDetail())),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(_topicCardRadius)),
              child: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextDataContainer(_topic),
                    ),
                    RatingBoxVertical(rating: _topic.rating)
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

/*
class TopicCardImage extends StatelessWidget {
  const TopicCardImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(_cordCardRadius),
                bottomRight: Radius.circular(_cordCardRadius)),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.lightBlueAccent,
                  Colors.blue,
                ])),
        child: Center(
            child: IconButton(
          icon: Icon(
            Icons.play_circle_outline,
            color: Colors.white,
          ),
          iconSize: 50,
          onPressed: () {},
        )),
      ),
    );
  }
}

 */

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
          text: _topic.recordings?.length.toString(),
          style: Theme.of(context).textTheme.caption),
      WidgetSpan(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2),
      )),
      WidgetSpan(
          child: Image.asset(
        'asset/images/button_icon_58.png',
        scale: 2.5,
      ))
    ]));
  }
}
