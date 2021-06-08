import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tonband/infrastructure/providers/providers.dart';
import 'package:tonband/models/Tonband.dart';
import 'package:tonband/models/Topic.dart';
import 'package:tonband/ui/ScreenRecordingDetailPage.dart';
import 'package:tonband/ui/components/CurrentlyPlayingControllerRow.dart';

import 'components/TonbandWidget.dart';
import 'components/VerticalRatingBox.dart';

class ScreenTopicDetailPage extends ConsumerWidget {
  final Topic _topic;
  const ScreenTopicDetailPage(this._topic) : super();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    //modify state asynchronously to avoid bad state of widget in life cycle
    // https://github.com/rrousselGit/river_pod/issues/177
    Future.delayed(
        Duration.zero,
        () => context
            .read(topicDetailNotifierProvider.notifier)
            .getTonbands(121)); //TODO put in topic real id
    return ProviderListener(
        onChange: (context, state) {
          // show bottom modal
        },
        provider: currentTonbandProvider,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              _topic.title,
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
            ),
          ),
          body: TopicDetailBody(
            topic: _topic,
          ),
        ));
  }
}

class TopicDetailBody extends ConsumerWidget {
  const TopicDetailBody({
    Key? key,
    required Topic topic,
  })  : _topic = topic,
        super(key: key);

  final Topic _topic;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomScrollView(
              slivers: [
                //These are all slivers because I originally planned the header to
                //collapse elegantly when scrolling down
                //I left it as sliver so that everything now scrolls
                SliverToBoxAdapter(), //empty box needed because of https://github.com/flutter/flutter/issues/55170
                SliverToBoxAdapter(child: TopicHeader(topic: _topic)),
                TopicTonbandOverview(),
              ],
            ),
          ),
        ),
        Hero(
            tag: CurrentlyPlayingControllerRow.tag,
            child: CurrentlyPlayingControllerRow()),
      ],
    );
  }
}

class TopicTonbandOverview extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final responseAsyncValue = watch(tonbandsProvider);
    return responseAsyncValue.map(
      data: (tonbands) => SliverList(
          delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return TonbandWidget(
              tonband: tonbands.value.elementAt(index),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ScreenTonbandDetailPage())));
          //playRecording(context, recordings.value.elementAt(index)));
        },
        childCount: tonbands.value.length,
      )),
      loading: (_) => SliverToBoxAdapter(
          child: Center(child: CircularProgressIndicator.adaptive())),
      error: (_) => SliverToBoxAdapter(
        child: Text(
          _.error.toString(),
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}

void playRecording(BuildContext context, Tonband recording) {
  context.read(currentTonbandProvider).state = recording;
  context.read(playbackNotifierProvider.notifier).playTonband(recording);
}

class TopicHeader extends StatelessWidget {
  const TopicHeader({
    Key? key,
    required this.topic,
  }) : super(key: key);

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                topic.title,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            RatingBoxVertical(rateable: topic),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Text(topic.description),
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

// Diese Aufnahme melden
// Gefällt mir
// Gefällt mir nicht
// Top 2 Kommentare

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
