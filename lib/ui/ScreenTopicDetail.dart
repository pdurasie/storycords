import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tonband/infrastructure/providers/providers.dart';
import 'package:tonband/models/Recording.dart';
import 'package:tonband/models/Topic.dart';
import 'package:tonband/style.dart';

import 'components/RecordingWidget.dart';
import 'components/VerticalRatingBox.dart';

class ScreenTopicDetail extends ConsumerWidget {
  final Topic _topic;
  const ScreenTopicDetail(this._topic) : super();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    //modify state asynchronously to avoid bad state of widget in life cycle
    // https://github.com/rrousselGit/river_pod/issues/177
    Future.delayed(
        Duration.zero,
        () => context
            .read(topicDetailNotifierProvider.notifier)
            .getRecordings(121)); //TODO put in topic real id
    final playingRecording = watch(playingRecordingProvider);
    return ProviderListener(
        onChange: (context, state) {
          _showBottomModal();
        },
        provider: playingRecordingProvider,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              _topic.title,
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
            ),
          ),
          body: TopicDetailBody(
            topic: _topic,
          ),
        ));
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: colorGreyBackground,
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
                  RatingBoxVertical(rateable: _topic),
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
                    child: ListView.builder(
                        itemCount: recordings.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          return RecordingWidget(
                            recording: recordings.value.elementAt(index),
                          );
                        }),
                  ),
                  loading: (_) => CircularProgressIndicator(),
                  error: (_) => Text(
                    _.error.toString(),
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }),
            ],
          ),
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
