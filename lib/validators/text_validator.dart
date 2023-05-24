class TextValidator {
  static String? nameRequired(
    String? value,
  ) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  static String? textValidator(String? value) {
    if (nameRequired(value) != null) {
      return 'Campo obrigatório';
    } else if (value != null && (value.length < 5 || value.length > 150)) {
      return 'A frase deve ter entre 5 e 150 caracteres!';
    }
    return null;
  }

  static String? objectiveValidator(String? value) {
    if (nameRequired(value) != null) {
      return 'Campo obrigatório';
    } else if (value != null && (value.length < 4 || value.length > 20)) {
      return 'A frase deve ter entre 4 e 20 caracteres!';
    }
    return null;
  }
}
