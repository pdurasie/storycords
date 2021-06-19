import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tonband/infrastructure/providers/providers.dart';
import 'package:tonband/ui/components/CurrentlyPlayingControllerRow.dart';

import '../../style.dart';

class DraggablePlayController extends ConsumerWidget {
  const DraggablePlayController({Key? key}) : super(key: key);

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
          return ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              clipBehavior: Clip.antiAlias,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [colorPrimaryLight, colorPrimary])),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: CurrentlyPlayingControllerRow(),
              ));
        });
  }
}
