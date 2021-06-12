import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tonband/infrastructure/TopicRepository.dart';
import 'package:tonband/infrastructure/providers/TopicDetailNotifier.dart';
import 'package:tonband/logic/playback/PlaybackNotifier.dart';
import 'package:tonband/logic/playback/PlaybackService.dart';
import 'package:tonband/models/Tonband.dart';
import 'package:tonband/models/Topic.dart';

final topicDetailNotifierProvider =
    StateNotifierProvider<TopicDetailNotifier, TopicDetailState>(
        (ref) => TopicDetailNotifier(ref.watch(topicRepositoryProvider)));

final topicRepositoryProvider = Provider((ref) => TopicRepository());

final topicsProvider = FutureProvider<List<Topic>>((ref) async {
  final topicRepo = ref.read(topicRepositoryProvider);
  return topicRepo.getTopics();
});

final tonbandsProvider = FutureProvider<List<Tonband>>((ref) async {
  final topicRepo = ref.read(topicRepositoryProvider);
  return topicRepo.getTonbandsByTopicId(
      21); //TODO put in actual topic id, caches all the time otherwise
});

final currentTonbandProvider = StateProvider<Tonband?>((ref) => null);

final audioPlayerProvider = Provider.autoDispose((ref) => AudioPlayer());

final playbackServiceProvider = Provider.autoDispose(
    (ref) => PlaybackService(ref.read(audioPlayerProvider)));

final playbackNotifierProvider =
    StateNotifierProvider<PlaybackNotifier, PlaybackState>(
        (ref) => PlaybackNotifier(ref.read(playbackServiceProvider)));
