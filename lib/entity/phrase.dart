class Phrase {
  String text;

  Phrase({required this.text});

    Map<String, dynamic> toJson() {
    return {'text': text};
  }
}