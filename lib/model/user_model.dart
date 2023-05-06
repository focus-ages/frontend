import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../controller/user_controler.dart';

class User_model {
  final UserControler userController = UserControler();
  var user = {};
  String userId = '';

  static final User_model user_model = User_model._internal();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  factory User_model() {
    return user_model;
  }

  User_model._internal();

  Future<void> createUser(var formsUser) async {
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

  Future<void> adicionarFrase(String frase) async {
    try {
      if (user == {}) {
        loadUserFromDB();
      }

      // pega a lista de frases do usuario
      var phrases = user['phrases'];
      // adiciona a frase nova nessa lista
      phrases.add(frase);
      //substitui a lista antiga do usuário com a nova lista
      user['phrases'] = phrases;

      // realiza o update do usuário com a lista nova no banco de dados
      bool isUpdated = await userController.updateUser(userId, user);

      // se não ocorreu update
      if (!isUpdated) {
        throw Exception('erro ao relaizar update no firebase');
      }
    } catch (e) {
      print('Erro ao adicionar a frase ao Firebase: $e');
    }
  }

  Future<void> deletarFrase(String frase) async {
    try {
      if (user == {}) {
        loadUserFromDB();
      }

      var phrases = user['phrases'];
      phrases.delete(frase);

      if (phrases.contains(frase)) {
        phrases.remove(frase);
      }

      user['phrases'] = phrases;

      bool isUpdated = await userController.updateUser(userId, user);

      if (!isUpdated) {
        throw Exception('Erro ao realizar update no Firebase.');
      }
    } catch (e) {
      print('Erro ao excluir a frase do Firebase: $e');
    }
  }
}
