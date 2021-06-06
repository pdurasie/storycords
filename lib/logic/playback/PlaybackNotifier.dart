import 'package:riverpod/riverpod.dart';
import 'package:tonband/logic/playback/PlaybackService.dart';
import 'package:tonband/models/Recording.dart';

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
  PlaybackNotifier() : super(PlaybackInitial());

  //TODO: This should first start resuming, if possible. Or at least the current
  // use case should just resume and not always start again
  Future<void> playRecording(Recording? recording) async {
    if (recording != null) {
      playFromUrl(recording.url);
    }
  }

  Future<void> playFromUrl(String url) async {
    try {
      state = PlaybackLoading();
      await PlaybackService.setUrl(url);
      PlaybackService.playSingleTrack();
      state = PlaybackPlaying();
    } on Exception {
      state = PlaybackError("Failed");
    }
  }

  void pausePlayback() {
    PlaybackService.pause();
    _setPlaybackPaused();
  }

  void _setPlaybackPaused() {
    state = PlaybackPaused();
  }

  void _setPlaybackFinished() {
    state = PlaybackInitial();
  }
}
