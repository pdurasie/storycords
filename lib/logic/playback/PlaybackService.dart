import 'package:just_audio/just_audio.dart';

/// This class is responsible for playing audio in the foreground.
///
/// It uses the just_audio library to manage this under the hood. So this class
/// is an abstraction interface, in case we need to change the library at some point.
class PlaybackService {
  final AudioPlayer _audioPlayer;

  PlaybackService(this._audioPlayer);

  Future<void> setUrl(final String url) async {
    try {
      await _audioPlayer.setUrl(
          "https://s3.amazonaws.com/scifri-segments/scifri201711241.mp3");
    } catch (e) {
      print(e);
    }
  }

  /// Plays the loaded resource and pauses the player on completion.
  void playSingleTrack() {
    _audioPlayer.play();
    _audioPlayer.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    _audioPlayer.processingStateStream.listen((event) {
      if (event == ProcessingState.completed) {
        /*
        final notifier =
            ProviderContainer().read(playbackNotifierProvider.notifier);
        notifier.pausePlayback();

         */
      }
    });
  }

  playFromLocalStorage(final String path) async {}

  fastForward15() async {}

  resume() async {}

  pause() async {
    _audioPlayer.pause();
  }

  stop() async {
    _audioPlayer.stop();
  }

  isPlayerIdle() {
    return _audioPlayer.processingState == ProcessingState.idle;
  }
}
