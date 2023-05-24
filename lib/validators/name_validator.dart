class NameValidator {
  static String? nameRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  static String? nameValidator(String? value) {
    final regex = RegExp(r'^[a-zA-Z]+$');
    if (nameRequired(value) != null) {
      return 'Campo obrigatório';
    } else if (value != null && !regex.hasMatch(value)) {
      return 'Informe apenas letras';
    } else if (value != null && (value.length < 3 || value.length > 12)) {
      return 'A string deve ter entre 3 e 12 caracteres';
    }
    return null;
  }
}
