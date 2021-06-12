import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tonband/logic/playback/PlaybackService.dart';
import 'package:tonband/models/Tonband.dart';

abstract class PlaybackState {
  const PlaybackState();
}

class PlaybackInitial extends PlaybackState {
  const PlaybackInitial();
}

class PlaybackLoading extends PlaybackState {
  const PlaybackLoading();
}

class PlaybackPlaying extends PlaybackState {
  const PlaybackPlaying();
}

class PlaybackPaused extends PlaybackState {
  const PlaybackPaused();
}

class PlaybackCompleted extends PlaybackState {
  const PlaybackCompleted();
}

class PlaybackError extends PlaybackState {
  final String message;
  const PlaybackError(this.message);
}

class PlaybackNotifier extends StateNotifier<PlaybackState> {
  final PlaybackService _playbackService;
  PlaybackNotifier(this._playbackService) : super(PlaybackInitial()) {
    /// Maps a player state event to a playback state.
    _playbackService.playerStateStream.listen((event) {
      if (event.tonbandProcessingState == TonbandProcessingState.loading ||
          event.tonbandProcessingState == TonbandProcessingState.buffering) {
        state = PlaybackLoading();
      } else if (!event.playing) {
        state = PlaybackPaused();
      } else if (event.tonbandProcessingState !=
          TonbandProcessingState.completed) {
        state = PlaybackPlaying();
      } else {
        state = PlaybackCompleted();
      }
    });
  }

  Future<void> playTonband(Tonband? tonband) async {
    if (tonband != null) {
      if (_playbackService.isPlayerIdle()) {
        //audio hasn't loaded yet
        playFromUrl(tonband.url);
      } else {
        _playbackService.playSingleTrack();
      }
    }
  }

  Future<void> playFromUrl(String url) async {
    try {
      await _playbackService.setUrl(url);
      _playbackService.playSingleTrack();
    } on Exception {
      state = PlaybackError("Failed");
    }
  }

  void pausePlayback() {
    _playbackService.pause();
  }
}
