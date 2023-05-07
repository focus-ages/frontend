import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../controller/user_controller.dart';
import '../entity/user.dart';

class User_model {
  final UserController userController = UserController();
  User? user = null;
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

  Future<void> loadUserFromDB() async {
    String? userIdFromDb = await _storage.read(key: 'userId');
    if (userIdFromDb != null) {
      userId = userIdFromDb;
      user = await userController.findUser(userId);
    }
  }

  Future<Map<String, String>> loadUserFromStorage() async {
    Map<String, String> allValues = await _storage.readAll();
    return allValues;
  }

  Future<void> changeDailyGoal(String value) async {
    int valueInteger;
    if (value.contains(":")) {
      value = value.replaceAll(':', '');
    }

    valueInteger = int.parse(value);
    if (user != null) {
      user!.dailyGoal = valueInteger;
      await userController.updateUser(userId, user!);
    }
  }

  Future<void> changeNotificationTime(int value) async {
    if (user != null) {
      user!.notificationTime = value;
      await userController.updateUser(userId, user!);
    }
  }
}
