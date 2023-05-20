import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
    return user;
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
    await userController.updateField(userId, 'dailyGoal', value);
    await loadUserFromDB();
  }

  Future<void> changeNotificationTime(String value) async {
    await userController.updateField(userId, 'notificationTime', value);
    await loadUserFromDB();
  }
}
