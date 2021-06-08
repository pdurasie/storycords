import 'package:riverpod/riverpod.dart';
import 'package:tonband/infrastructure/TopicRepository.dart';
import 'package:tonband/models/Tonband.dart';

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
  final List<Tonband> tonbands;
  const TopicDetailFullyLoaded(this.tonbands);
}

class TopicDetailError extends TopicDetailState {
  final String message;
  const TopicDetailError(this.message);
}

// TODO this class is useless - only used for dummy purposes
class TopicDetailNotifier extends StateNotifier<TopicDetailState> {
  final TopicRepository _topicRepository;

  TopicDetailNotifier(this._topicRepository) : super(TopicDetailInitial());

  Future<void> getTonbands(int id) async {
    try {
      state = TopicDetailLoading();
      final tonbands = await _topicRepository.getTonbandsByTopicId(id);
      state = TopicDetailFullyLoaded(tonbands);
    } on Exception {
      state = TopicDetailError("Failed");
    }
  }
}
