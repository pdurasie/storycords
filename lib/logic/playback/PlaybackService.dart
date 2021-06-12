import 'dart:async';

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

  /// Plays the loaded resource.
  void play() {
    _audioPlayer.play();
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

  Stream<TonbandPlayerState> get playerStateStream => _audioPlayer
      .playerStateStream
      .map((event) => TonbandPlayerState(event.playing, event.processingState));
}

class TonbandPlayerState extends PlayerState {
  TonbandProcessingState get tonbandProcessingState =>
      processingState.toTonbandProcessingState();

  TonbandPlayerState(bool playing, ProcessingState processingState)
      : super(playing, processingState);
}

// Copied from ProcessingState
enum TonbandProcessingState {
  /// The player has not loaded an [AudioSource].
  idle,

  /// The player is loading an [AudioSource].
  loading,

  /// The player is buffering audio and unable to play.
  buffering,

  /// The player is has enough audio buffered and is able to play.
  ready,

  /// The player has reached the end of the audio.
  completed,
}

extension ProcessingStateMapper on ProcessingState {
  TonbandProcessingState toTonbandProcessingState() {
    switch (this) {
      case ProcessingState.idle:
        return TonbandProcessingState.idle;
      case ProcessingState.loading:
        return TonbandProcessingState.loading;
      case ProcessingState.buffering:
        return TonbandProcessingState.buffering;
      case ProcessingState.ready:
        return TonbandProcessingState.ready;
      case ProcessingState.completed:
        return TonbandProcessingState.completed;
    }
  }
}
