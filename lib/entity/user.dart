import 'objective.dart';
import 'phrase.dart';

class User {
  String name;
  int notificationTime;
  int dailyGoal;
  List<Objective> objectives;
  List<Phrase> phrases;

  User({
    required this.name,
    required this.notificationTime,
    required this.dailyGoal,
    required this.objectives,
    required this.phrases,
  });

    Map<String, dynamic> toJson() {
    List objectivesJson =
        objectives.map((e) => e.toJson()).toList();
    List phrasesJson =
        phrases.map((e) => e.toJson()).toList();

    return {
      'name': name,
      'notificationTime': notificationTime,
      'dailyGoal': dailyGoal,
      'objectives': objectivesJson,
      'phrases': phrasesJson,
    };
  }
}
