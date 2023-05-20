class Phrase {
  String text;

  Phrase({required this.text});

  int? get length => null;

  Map<String, dynamic> toJson() {
    return {'text': text};
  }
}
