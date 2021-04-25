import 'package:tonband/models/Topic.dart';

abstract class TopicsOverviewState {
  const TopicsOverviewState();
}

class TopicsOverviewInitial extends TopicsOverviewState {
  const TopicsOverviewInitial();
}

class TopicsOverviewlLoading extends TopicsOverviewState {
  const TopicsOverviewlLoading();
}

class TopicsOverviewLoaded extends TopicsOverviewState {
  final List<Topic> topics;
  const TopicsOverviewLoaded(this.topics);
}

class TopicsOverviewError extends TopicsOverviewState {
  final String message;
  const TopicsOverviewError(this.message);
}
/*
class TopicsOverviewNotifier extends StateNotifier<TopicsOverviewState> {
  List<Topic> _topics = [];
  List<Topic> get topics => _topics;

  TopicsOverviewNotifier()
      : super(
            TopicsOverviewInitial()); //TODO fetch (partially loaded) Topic from Repo here

  Future<void> getRecordings() async {
    try {
      state = TopicsOverviewlLoading();
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
      _topics.recordings = recordings;
      state = TopicsOverviewLoaded(_topics);
    } on Exception {
      state = TopicsOverviewError("Failed");
    }
  }
}

 */
