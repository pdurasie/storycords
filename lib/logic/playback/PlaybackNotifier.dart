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

class PlaybackError extends PlaybackState {
  final String message;
  const PlaybackError(this.message);
}

class PlaybackNotifier extends StateNotifier<PlaybackState> {
  final PlaybackService _playbackService;
  PlaybackNotifier(this._playbackService) : super(PlaybackInitial());

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
      state = PlaybackLoading();
      await _playbackService.setUrl(url);
      _playbackService.playSingleTrack();
      state = PlaybackPlaying();
    } on Exception {
      state = PlaybackError("Failed");
    }
  }

  void pausePlayback() {
    _playbackService.pause();
    _setPlaybackPaused();
  }

  void _setPlaybackPaused() {
    state = PlaybackPaused();
  }

  void _setPlaybackFinished() {
    state = PlaybackInitial();
  }
}
