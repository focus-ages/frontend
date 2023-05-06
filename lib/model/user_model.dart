import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../controller/user_controller.dart';
import '../entity/phrase.dart';

  class User_model{

    final UserControlLer userController = UserControlLer();

    var userId = '';

    static final User_model user_model = User_model._internal();

    final FlutterSecureStorage _storage = const FlutterSecureStorage();

    factory User_model() {
      return user_model;
    }


    User_model._internal();
    

    Future<void> saveAccessToken() async {
      await _storage.write(key: 'userId', value: 'DOGYDYmhrgO3X9doU5sO');
    }
      
    Future <void> loadUserFromDB() async {
      saveAccessToken();
      String? userIdFromDb = await _storage.read(key: 'userId');
      try{
        if (userIdFromDb != null) {
          userId = userIdFromDb;
        }
      }catch(Erro){
        rethrow;
      }
    }



    void adicionarFrase(String frase) async {
      await loadUserFromDB().then((value) async => {
        await userController.findUser(userId).then((user) async {
          Phrase novaFrase = Phrase(text: frase);
          user!.phrases.add(novaFrase);
          await userController.updateUser(userId, user);
        })
      });
    }

  void deletarFrase(String frase)async {
      await loadUserFromDB().then((value) async => {
        await userController.findUser(userId).then((user) async {
          user?.phrases.removeWhere((e) => e.text == frase);
          await userController.updateUser(userId, user!);
        })
      });
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
