import 'phrase.dart';

class Objective {
  String name;
  List<Phrase> phrases;

  Objective({
    required this.phrases,
    required this.name
    });

      Map<String, dynamic> toJson() {
      List phrasesJson =
        phrases.map((e) => e.toJson()).toList();

    return {
      'name': name,
      'phrases': phrasesJson,
    };
  }
}
