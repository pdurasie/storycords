import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tonband/infrastructure/providers/providers.dart';

/// This class is responsible for playing audio in the foreground.
///
/// It uses the just_audio library to manage this under the hood. So this class
/// is an abstraction interface, in case we need to change the library at some point.
class PlaybackService {
  static Future<void> setUrl(String url) async {
    final player = ProviderContainer().read(audioPlayerProvider);
    await player.setUrl(url);
  }

  /// Plays the loaded resource and pauses the player on completion.
  static void playSingleTrack() {
    final player = ProviderContainer().read(audioPlayerProvider);
    player.play();
    player.processingStateStream.listen((event) {
      if (event == ProcessingState.completed) {
        player.pause();
        final notifier =
            ProviderContainer().read(playbackNotifierProvider.notifier);
        notifier.setPlaybackPaused();
      }
    });
  }

  static playFromLocalStorage(String path) async {}

  static fastForward15() async {}

  static resume() async {}

  static pause() async {
    final player = ProviderContainer().read(audioPlayerProvider);
    player.pause();
  }

  static stop() async {}
}
