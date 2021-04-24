import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:tonband/infrastructure/TopicDetailNotifier.dart';
import 'package:tonband/infrastructure/providers.dart';
import 'package:tonband/models/Topic.dart';
import 'package:tonband/ui/components/RecordingWidget.dart';

import 'components/VerticalRatingBox.dart';

class ScreenTopicDetail extends StatelessWidget {
  const ScreenTopicDetail() : super();

  @override
  Widget build(BuildContext context) {
    context.read(topicDetailNotifierProvider.notifier).getRecordings();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Consumer(builder: (context, watch, child) {
          final state = watch(topicDetailNotifierProvider);
          if (state is TopicDetailInitial) {
            return TopicPartiallyLoaded(topic: state.topicWithNoRecordings);
          } else if (state is TopicDetailLoading) {
            return CircularProgressIndicator();
          } else if (state is TopicDetailFullyLoaded) {
            return TopicFullyLoaded(topic: state.fullTopic);
          } else {
            return Center(
              child: Text("Error occured"),
            );
          }
        }),
      ),
    );
  }
}

class TopicFullyLoaded extends StatelessWidget {
  const TopicFullyLoaded({
    Key? key,
    required Topic topic,
  })   : _topic = topic,
        super(key: key);

  final Topic _topic;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                _topic.title,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            RatingBoxVertical(rating: _topic.rating),
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
        RecordingWidget(recording: _topic.recordings![0])
      ],
    );
  }
}

//TODO Refactor this
class TopicPartiallyLoaded extends StatelessWidget {
  const TopicPartiallyLoaded({
    Key? key,
    required Topic topic,
  })   : _topic = topic,
        super(key: key);

  final Topic _topic;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                _topic.title,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            RatingBoxVertical(rating: _topic.rating),
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
      ],
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
