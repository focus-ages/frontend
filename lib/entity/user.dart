import 'objective.dart';
import 'phrase.dart';

class User {
  final String? name;
  final int? notificationTime;
  final int? dailyGoal;
  final List<Objective>? objectives;
  final List<Phrase>? phrases;

  const User({
    this.name,
    this.notificationTime,
    this.dailyGoal,
    this.objectives,
    this.phrases,
  });

  Map<String, dynamic> toJson() {
    List objectivesJson = objectives!.map((e) => e.toJson()).toList();
    List phrasesJson = phrases!.map((e) => e.toJson()).toList();

    return {
      'name': name,
      'notificationTime': notificationTime,
      'dailyGoal': dailyGoal,
      'objectives': objectivesJson,
      'phrases': phrasesJson,
    };
  }
}
