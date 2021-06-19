import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tonband/infrastructure/providers/providers.dart';
import 'package:tonband/logic/playback/PlaybackNotifier.dart';

import '../../style.dart';

class PlayerWidget extends ConsumerWidget {
  const PlayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    const entrySlideInDuration = Duration(milliseconds: 800);

    final playbackState = watch(playbackNotifierProvider);
    final heightRatio = 0.1;
    final initialHeight = MediaQuery.of(context).size.height * heightRatio;
    return DraggableScrollableSheet(
        expand: false,
        minChildSize: heightRatio,
        initialChildSize: heightRatio,
        builder: (context, controller) {
          return CollapsedPlayerWidget();
        });
  }
}

class CollapsedPlayerWidget extends StatelessWidget {
  const CollapsedPlayerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [colorPrimaryLight, colorPrimary])),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: CollapsedPlayerRow(),
        ));
  }
}

/// This widget is used for displaying the currently playing tonband and
/// for skipping, pausing, start, ...
///
/// How to use this widget:
/// Wrap the contents of a screen in a column widget with this widget at the bottom.
/// Wrap this widget in a hero widget with the provided static tag, so that
/// it looks like it does not move, even though it is rebuilt on every screen.
/// (Yes, this is a dirty hack. But until Google provides a single page
/// architecture, I don't have a better solution.)
///
/// Example:
/// Column(
///       children: [
///         ...
///         Hero(
///             tag: CollapsedPlayerRow.tag,
///             child: CollapsedPlayerRow())
///             ];
///
/// Implement this on every single screen. It is invisible until a tonband is
/// started, so you're safe to do so.
///
class CollapsedPlayerRow extends ConsumerWidget {
  static const String tag = "CurrentlyPlayingControllerRowTag";
  const CollapsedPlayerRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CurrentlyPlayingTitleWidget(),
        ),
        PlaybackControlsWidget(),
      ],
    );
  }
}

class CurrentlyPlayingTitleWidget extends ConsumerWidget {
  const CurrentlyPlayingTitleWidget() : super();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final currentTonband = watch(currentTonbandProvider).state;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(currentTonband?.title ?? "",
              style: Theme.of(context).textTheme.bodyText1),
        ),
        Text(
          currentTonband?.parentTopic.title ?? "",
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}

class PlaybackControlsWidget extends StatelessWidget {
  const PlaybackControlsWidget() : super();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        PlayButtonControllerWidget(),
        SkipButtonWidget(),
      ],
    );
  }
}
/*
class Skip15AheadButtonWidget extends StatelessWidget {
  const Skip15AheadButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "asset/images/icon_skip_15_ahead.svg",
      height: 24,
      width: 24,
    );
  }
}

 */

class SkipButtonWidget extends StatelessWidget {
  const SkipButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 32,
      onPressed: () {
        null;
      },
      icon: Icon(
        Icons.skip_next,
      ),
    );
  }
}

/// Shows a pause button while playing a track. Shows a loading indicator
/// while loading. Shows a play button otherwise.
class PlayButtonControllerWidget extends ConsumerWidget {
  const PlayButtonControllerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final playbackState = watch(playbackNotifierProvider);
    return Consumer(builder: (context, watch, child) {
      if (playbackState is PlaybackPlaying) {
        return buildPauseButton(context);
      } else if (playbackState is PlaybackLoading) {
        return buildLoadingIndicator();
      } else {
        //paused, initial or error
        return buildPlayButton(context);
      }
    });
  }

  Widget buildPlayButton(BuildContext context) {
    return IconButton(
      iconSize: 32,
      icon: Icon(
        Icons.play_arrow,
      ),
      onPressed: () {
        final currTonband = context.read(currentTonbandProvider).state;
        context
            .read(playbackNotifierProvider.notifier)
            .playTonband(currTonband);
      },
    );
  }

  Widget buildLoadingIndicator() {
    return Center(
      //center + sized box so that we are sure to stay on size 32
      child: SizedBox(
          width: 42, height: 42, child: CircularProgressIndicator.adaptive()),
    );
  }

  Widget buildPauseButton(BuildContext context) {
    return IconButton(
      iconSize: 32,
      icon: Icon(
        Icons.pause,
      ),
      onPressed: () {
        final notifier = context.read(playbackNotifierProvider.notifier);
        notifier.pausePlayback();
      },
    );
  }
}
