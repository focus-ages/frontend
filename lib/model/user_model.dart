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

  Future<User?> loadUserFromDB() async {
    String? userIdFromDb = await _storage.read(key: 'userId');
    if (userIdFromDb != null) {
      userId = userIdFromDb;
      user = await userController.findUser(userId);
      return user;
    }
    return null;
  }
}