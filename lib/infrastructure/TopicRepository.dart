import 'package:tonband/models/Recording.dart';
import 'package:tonband/models/Topic.dart';

class TopicRepository {
  List<Topic> _topics = [];

  Future<List<Topic>> getTopics() async {
    return Future.delayed(
        Duration(seconds: 2),
        () => List.generate(
              8,
              (index) => Topic(
                  title:
                      "Dies ist ein wundervolles, atemberaubendes Topic mit der Nummer $index",
                  author: "mir",
                  description:
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. ",
                  rating: index * 12,
                  recordings: [
                    Recording(
                      title:
                          "Als ich mich endlich traute, meinen Mitbewohner rauszuschmeißen",
                      author: "Lucia",
                      length: 412,
                      rating: 81,
                    )
                  ]),
            ));
  }

  Future<List<Recording>> getRecordingsByTopicId(int id) async {
    return Future.delayed(
        Duration(seconds: 2),
        () => [
              Recording(
                title:
                    "Als ich mich endlich traute, meinen Mitbewohner rauszuschmeißen",
                author: "Lucia",
                length: 412,
                rating: 81,
              ),
              Recording(
                title: "Ich dachte schon, ich guck nicht richtig",
                author: "David313",
                length: 123,
                rating: 12,
              ),
              Recording(
                title: "Franzbrötchen am Strand",
                author: "PatDog",
                length: 425,
                rating: 1992,
              )
            ]);
  }
}
