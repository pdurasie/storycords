import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tonband/infrastructure/providers/providers.dart';

import '../../style.dart';

/// This widget is used for displaying the currently playing recording and
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
///             tag: CurrentlyPlayingControllerRow.tag,
///             child: CurrentlyPlayingControllerRow())
///             ];
///
/// Implement this on every single screen. It is invisible until a recording is
/// started, so you're safe to do so.
///
class CurrentlyPlayingControllerRow extends ConsumerWidget {
  static const String tag = "CurrentlyPlayingControllerRowTag";
  const CurrentlyPlayingControllerRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final currentRecording = watch(playingRecordingProvider).state;
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      clipBehavior: Clip.antiAlias,
      child: AnimatedContainer(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [colorPrimary.withAlpha(130), colorPrimary])),
          duration: Duration(milliseconds: 600),
          curve: Curves.decelerate,
          height: currentRecording != null ? 80 : 0,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(currentRecording?.title ?? "",
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                    Text(
                      "Dies ist ein wundervolles, atemberaubendes Topic mit der Nummer 0",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(
                      "asset/images/icon_skip_15_ahead.svg",
                      height: 24,
                      width: 24,
                    ),
                    Icon(
                      Icons.play_arrow,
                      size: 32,
                    ),
                    Icon(
                      Icons.skip_next,
                      size: 32,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
