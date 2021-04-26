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
      state = TopicDetailError("Failed");
    }
  }
}
