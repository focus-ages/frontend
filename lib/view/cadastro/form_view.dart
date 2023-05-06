import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../components/home_componenets/custom_button.dart';
import '../../entity/objective.dart';
import '../../entity/phrase.dart';
import '../../entity/user.dart';
import '../../resources/color_pattern.dart';
import '../../controller/user_controller.dart';

class BancoPage extends StatefulWidget {
  const BancoPage({Key? key}) : super(key: key);


  @override
  State<BancoPage> createState() => _BancoPage();
}

final userControler = UserControlLer();
final usersCollection = FirebaseFirestore.instance.collection('users');

final newUserJson = {
  'name': 'John Doe',
  'notification_time': 10,
  'daily_goal': 100,
  'phrases': ['Hello', 'Goodbye'],
  'objectives': {
    'objective_name': 'Learn Spanish',
    'objective_phrases': ['Hola', 'Adiós'],
  },
};
final updateUserJson = {
  'name': 'updateOK',
  'notification_time': 10,
  'daily_goal': 100,
  'phrases': ['updateOK', 'updateOK'],
  'objectives': {
    'objective_name': 'updateOK updateOK',
    'objective_phrases': ['updateOK', 'updateOK'],
  },
};
final User newUser = User(
  name: 'Teste01 - criacao',
  notificationTime: 10,
  dailyGoal: 100,
  objectives: [
    Objective(
      name: 'Meu objetivo 1',
      phrases: [
        Phrase(text: 'Esta é uma frase de exemplo 1.'),
        Phrase(text: 'Esta é uma frase de exemplo 2.'),
      ],
    ),
    Objective(
      name: 'Meu objetivo 2',
      phrases: [
        Phrase(text: 'Esta é uma frase de exemplo 3.'),
        Phrase(text: 'Esta é uma frase de exemplo 4.'),
      ],
    ),
  ],
  phrases: [
    Phrase(text: 'Esta é uma frase de exemplo 5.'),
    Phrase(text: 'Esta é uma frase de exemplo 6.'),
  ],
);

void submitUser() async {
  var teste =  await userControler.createUser(newUser);
  print(teste);
}
void findUser() async {
  var teste =  await userControler.findUser("VH4uungIESJoapoRHmHE");
  print(teste.toString());
}
void updateUser() async {
  var teste =  await userControler.updateUser("aqWtfQw2qs7VBm0Aj0jw",newUser);
  print(teste.toString());
}

class _BancoPage extends State<BancoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPattern.darkMode,
      body: Center (child:
        Column(
          mainAxisSize: MainAxisSize.min,
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: const [
            CustomButton(
              onPressed: submitUser,
              title: Text(
                "submitUser",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:Colors.white,
                ),
              ),
            ),
          ],  
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
            CustomButton(
              onPressed: findUser,
              title: Text(
                "findUser",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:Colors.white,
                ),
              ),
            ),
          ],  
            ),
            SizedBox(height: 10),     
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
            CustomButton(
              onPressed: updateUser,
              title: Text(
                "updateUser",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:Colors.white,
                ),
              ),
            ),
          ],  
            ),
            SizedBox(height: 10)
          ],
        )
      ),
    );
  }
}