import 'dart:math';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:front/entity/objective.dart';

import '../controller/user_controller.dart';
import '../entity/user.dart';
import '../entity/phrase.dart';

class User_model {
  final UserController userController = UserController();
  User user = const User();
  String userId = '';

  static final User_model user_model = User_model._internal();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  factory User_model() {
    return user_model;
  }

  User_model._internal();

  Future<void> createUser(User formsUser) async {
    userId = await userController.createUser(formsUser);
    await _storage.write(key: 'userId', value: userId);
    await loadUserFromDB();
  }

  User getUser() {
    return this.user;
  }

  Future<bool> loadUserFromDB() async {
    String? userIdFromDb = await _storage.read(key: 'userId');
    if (userIdFromDb != null) {
      userId = userIdFromDb;
      user = (await userController.findUser(userId))!;
      return true;
    }
    return false;
  }

  void adicionarFrase(String frase) async {
    await userController.addPhrase(userId, Phrase(text: frase));
    await loadUserFromDB();
  }

  void deletarFrase(String frase) async {
    await userController.deletePhrase(userId, Phrase(text: frase));
    await loadUserFromDB();
  }

  Future<void> changeDailyGoal(String value) async {
    String nvalue = (int.parse(value) * 3600).toString();
    await userController.updateField(userId, 'dailyGoal', nvalue);
    await loadUserFromDB();
  }

  Future<void> changeNotificationTime(String value) async {
    String nvalue = (int.parse(value) * 60).toString();
    await userController.updateField(userId, 'notificationTime', nvalue);
    await loadUserFromDB();
  }

  String buscarFrase() {
    Random random = Random();
    int porcentagem = random.nextInt(100);

    if (user.objectives!.length > 0 && porcentagem > 70) {
      int numeroAleatorio = random.nextInt(user.objectives!.length);
      Objective objetivoEscolhido = user.objectives![numeroAleatorio];

      int fraseAleatoria = random.nextInt(objetivoEscolhido.phrases.length);
      Phrase fraseEscolhida = objetivoEscolhido.phrases[fraseAleatoria];

      return fraseEscolhida.text;
    } else if (user.phrases!.length == 0) {
      return 'Você não adicionou nenhuma frase ainda';
    }

    int indice = random.nextInt(user.phrases!.length);
    return user.phrases![indice].text;
  }

  Future<void> addObjective(String goal) async {
    await userController.addGoal(userId, Objective(phrases: [], name: goal));
    await loadUserFromDB();
  }

  Future<void> removeObjective(String goal) async {
    await userController.removeGoal(userId, goal);
    await loadUserFromDB();
  }
}
