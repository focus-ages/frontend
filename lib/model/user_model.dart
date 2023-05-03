import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../controller/user_controler.dart';

     

  class User_model{

    final UserControler userController = UserControler();
    var user = {};
    var userId = '';

    static final User_model user_model = User_model._internal();
    final FlutterSecureStorage _storage = const FlutterSecureStorage();

    factory User_model() {
      return user_model;
    }


    User_model._internal();
    

    //Future<void> saveAccessToken(String token) async {
    //  await _storage.write(key: 'userId', value: 'CIAHUSIHUIA123JOJCAIO213');
    //}
      
    Future<void> loadUserFromDB() async {
      String? userIdFromDb = await _storage.read(key: 'userId');
      if (userIdFromDb != null) {
        userId = userIdFromDb;
        user = await userController.findUser(userId);
      }
    }

    Future<void> adicionarFrase(String frase) async {
      try {
        if(user == {}){
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
        if(!isUpdated){
          throw Exception('erro ao relaizar update no firebase');
        }
      } catch (e) {
        print('Erro ao adicionar a frase ao Firebase: $e');
      }
    }

  Future<void> deletarFrase(String frase) async{

  try {
      if(user == {}){
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

  

 










  /*Future<void> adicionarFrase() async {
    String novaFrase = _fraseController.text;
    try {
      await _frasesRef.add({
        'frase': novaFrase,
        'data': Timestamp.now(),
      });

      _fraseController.clear();  //Limpa o campo de texto
    } catch (e) {
      print('Erro ao adicionar a frase ao Firebase: $e');
    }
  }

  final CollectionReference _frasesRef = FirebaseFirestore.instance.collection('frases');

  Future<void> deletarFrase(String frase) async {
    QuerySnapshot snapshot = await _frasesRef.where('frase', isEqualTo: frase).get();
    if (snapshot.docs.isNotEmpty) {
      String docId = snapshot.docs[0].id;
      await _frasesRef.doc(docId).delete();
    }
  }
  // print('Frase excluída com sucesso do Firebase.');
    //} else {
      //print('Frase não encontrada no Firebase.');
   // }
 // }
    
//Cria uma função deletarFrase que recebe um texto de frase como parâmetro.

//Usa a função where para filtrar os documentos pelo campo "frase" que é igual ao texto da frase que deseja excluir.

//Obtém uma QuerySnapshot contendo os documentos que atendem ao filtro.

//Verifica se o QuerySnapshot contém pelo menos um documento.

//Se contiver, obtém o ID do primeiro documento do QuerySnapshot e exclui-o usando a função delete na referência do documento correspondente.

//Basicamente, a função deletarFrase exclui um documento do Firestore que tem um campo "frase" com o valor especificado pelo parâmetro frase.
*/
