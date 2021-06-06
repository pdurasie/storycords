/*
import 'package:riverpod/riverpod.dart';
import 'package:tonband/infrastructure/TopicRepository.dart';
import 'package:tonband/models/Recording.dart';

abstract class TopicDetailState {
  const TopicDetailState();
}

class TopicDetailInitial extends TopicDetailState {
  const TopicDetailInitial();
}

class TopicDetailLoading extends TopicDetailState {
  const TopicDetailLoading();
}

class TopicDetailFullyLoaded extends TopicDetailState {
  final List<Recording> _recordings;
  const TopicDetailFullyLoaded(this._recordings);
}

class TopicDetailError extends TopicDetailState {
  final String message;
  const TopicDetailError(this.message);
}

// TODO this class is useless - only used for dummy purposes
class TopicDetailNotifier extends StateNotifier<TopicDetailState> {
  final TopicRepository _topicRepository;

  TopicDetailNotifier(this._topicRepository) : super(TopicDetailInitial());

  Future<void> getRecordings(int id) async {
    try {
      state = TopicDetailLoading();
      final recordings = await _topicRepository.getRecordingsByTopicId(id);
      state = TopicDetailFullyLoaded(recordings);
    } on Exception {
      state = TopicDetailError("Failed");final PlaybackNotifier notifier =
    }
  }
}

 */

import 'package:riverpod/riverpod.dart';
import 'package:tonband/logic/playback/PlaybackService.dart';

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

  void setPlaybackPaused() {
    state = PlaybackPaused();
  }

  void setPlaybackFinished() {
    state = PlaybackInitial();
  }
}
