import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tonband/infrastructure/providers/providers.dart';
import 'package:tonband/models/Topic.dart';
import 'package:tonband/ui/components/RecordingWidget.dart';

import 'components/VerticalRatingBox.dart';

class ScreenTopicDetail extends StatelessWidget {
  final Topic _topic;
  const ScreenTopicDetail(this._topic) : super();

  @override
  Widget build(BuildContext context) {
    //modify state asynchronously to avoid bad state of widget in life cycle
    // https://github.com/rrousselGit/river_pod/issues/177
    Future.delayed(
        Duration.zero,
        () => context
            .read(topicDetailNotifierProvider.notifier)
            .getRecordings(121)); //TODO put in topic real id
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: TopicPartiallyLoaded(
          topic: _topic,
        ),
      ),
    );
  }
}

class TopicPartiallyLoaded extends StatelessWidget {
  const TopicPartiallyLoaded({
    Key? key,
    required Topic topic,
  })  : _topic = topic,
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
        Consumer(builder: (context, watch, child) {
          final responseAsyncValue = watch(recordingsProvider);
          return responseAsyncValue.map(
            data: (recordings) => Expanded(
              child: Column(
                children: [
                  for (var recording in recordings.value)
                    RecordingWidget(
                      recording: recording,
                    )
                ],
              ),
            ),
            loading: (_) => CircularProgressIndicator(),
            error: (_) => Text(
              _.error.toString(),
              style: TextStyle(color: Colors.red),
            ),
          );
        }),
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
