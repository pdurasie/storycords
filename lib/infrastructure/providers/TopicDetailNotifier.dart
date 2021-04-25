import 'package:riverpod/riverpod.dart';
import 'package:tonband/models/Recording.dart';
import 'package:tonband/models/Topic.dart';

abstract class TopicDetailState {
  const TopicDetailState();
}

class TopicDetailInitial extends TopicDetailState {
  final Topic topicWithNoRecordings;
  const TopicDetailInitial(this.topicWithNoRecordings);
}

class TopicDetailLoading extends TopicDetailState {
  const TopicDetailLoading();
}

class TopicDetailFullyLoaded extends TopicDetailState {
  final Topic fullTopic;
  const TopicDetailFullyLoaded(this.fullTopic);
}

class TopicDetailError extends TopicDetailState {
  final String message;
  const TopicDetailError(this.message);
}

class TopicDetailNotifier extends StateNotifier<TopicDetailState> {
  Topic _topic = Topic();
  Topic get topic => _topic;

  TopicDetailNotifier()
      : super(TopicDetailInitial(
            Topic())); //TODO fetch (partially loaded) Topic from Repo here

  void addRecording(Recording recording) {
    _topic.recordings?.add(recording);
  }

  Future<void> getRecordings() async {
    try {
      state = TopicDetailLoading();
      //TODO load recordings from API, for now: fake request
      final recordings = await Future.delayed(
          Duration(seconds: 2),
          () => [
                Recording(
                  title:
                      "Als ich mich endlich traute, meinen Mitbewohner rauszuschmeißen",
                  author: "Lucia",
                  length: 412,
                  rating: 81,
                )
              ]);
      _topic.recordings = recordings;
      state = TopicDetailFullyLoaded(_topic);
    } on Exception {
      state = TopicDetailError("Failed");
    }
  }
}
