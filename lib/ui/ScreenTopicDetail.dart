import 'package:flutter/material.dart';
import 'package:tonband/models/Topic.dart';
import 'package:tonband/ui/components/TopicWidget.dart';

import 'components/TopicRatingBox.dart';

class ScreenTopicDetail extends StatelessWidget {
  final Topic _topic;

  const ScreenTopicDetail(this._topic) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    _topic.title,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                RatingBoxVertical(topic: _topic),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Text(_topic.description),
            ),
            Divider(
              color: Colors.grey,
              height: 20,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            TopicWidget()
          ],
        ),
      ),
    );
  }
}

/*
Beschreibung
Labels
Knöpfe sehen
Ausklappen für mehr Details
Ähnliche Cords
 */

/*
OP verlost einen Button an die beste Geschichte
 */
