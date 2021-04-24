import 'package:riverpod/riverpod.dart';
import 'package:tonband/infrastructure/TopicDetailNotifier.dart';

final topicDetailNotifierProvider =
    StateNotifierProvider<TopicDetailNotifier, TopicDetailState>(
        (ref) => TopicDetailNotifier());
