import 'package:riverpod/riverpod.dart';
import 'package:tonband/infrastructure/TopicRepository.dart';
import 'package:tonband/infrastructure/providers/TopicDetailNotifier.dart';
import 'package:tonband/models/Topic.dart';

final topicDetailNotifierProvider =
    StateNotifierProvider<TopicDetailNotifier, TopicDetailState>(
        (ref) => TopicDetailNotifier());

final topicRepositoryProvider = Provider((ref) => TopicRepository());

final topicsProvider = FutureProvider<List<Topic>>((ref) async {
  final topicRepo = ref.read(topicRepositoryProvider);
  return topicRepo.getTopics();
});
