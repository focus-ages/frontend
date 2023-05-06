class NumberValidator {
  static String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  static String? validateNumberFormat(String value) {
    RegExp regExp = RegExp(r'^[0-9:]+$');
    if (!regExp.hasMatch(value)) return 'Horário inválido';
    if (value.length > 5)
      return 'Horário inválido';
    else {
      if (value.contains(":") &&
          ((value.length == 4 && value[1] == ":") ||
              (value.length == 5 && value[2] == ":")))
        return null;
      else if (value.length == 1 || value.length == 2)
        return null;
      else
        return 'Horário inválido';
    }
  }

  static String? validateDailyGoal(String value) {
    if (validateNumberFormat(value) != null) return 'Horário inválido';
    int hour, min;
    String aux;
    if (value.length == 1) {
      hour = int.parse(value[0]);
      if (hour < 1 || hour > 20) return 'Horário inválido';
    } else if (value.length == 2) {
      aux = value[0] + value[1];
      hour = int.parse(aux);
      if (hour < 1 || hour > 20) return 'Horário inválido';
    } else if (value.length == 4) {
      hour = int.parse(value[0]);
      aux = value[2] + value[3];
      min = int.parse(aux);
      if (hour < 1 || hour > 20 || min < 0 || min > 59)
        return 'Horário inválido';
    } else if (value.length == 5) {
      aux = value[0] + value[1];
      hour = int.parse(aux);
      aux = value[3] + value[4];
      min = int.parse(aux);
      if (hour < 1 || hour > 20 || min < 0 || min > 59)
        return 'Horário inválido';
    }
    return null;
  }

  static String? validateNotificationTime(String value) {
    RegExp regExp = RegExp(r'^[0-9]+$');
    int time;
    String aux = "";
    if (!regExp.hasMatch(value)) return 'Horário inválido';
    if (value.length > 3) return 'Horário inválido';
    for (int i = 0; i < value.length; i++) {
      aux += value[i];
    }
    time = int.parse(aux);
    if (time < 1 || time > 200)
      return 'Horário inválido';
    else
      return null;
  }
}
