import 'package:riverpod/riverpod.dart';
import 'package:tonband/infrastructure/TopicRepository.dart';
import 'package:tonband/infrastructure/providers/TopicDetailNotifier.dart';
import 'package:tonband/models/Recording.dart';
import 'package:tonband/models/Topic.dart';

final topicDetailNotifierProvider =
    StateNotifierProvider<TopicDetailNotifier, TopicDetailState>(
        (ref) => TopicDetailNotifier(ref.watch(topicRepositoryProvider)));

final topicRepositoryProvider = Provider((ref) => TopicRepository());

final topicsProvider = FutureProvider<List<Topic>>((ref) async {
  final topicRepo = ref.read(topicRepositoryProvider);
  return topicRepo.getTopics();
});

final recordingsProvider = FutureProvider<List<Recording>>((ref) async {
  final topicRepo = ref.read(topicRepositoryProvider);
  return topicRepo.getRecordingsByTopicId(
      21); //TODO put in actual topic id, caches all the time otherwise
});
