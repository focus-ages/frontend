import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:front/entity/user.dart';

import '../entity/objective.dart';
import '../entity/phrase.dart';

class UserControlLer{
  
  final usersCollection = FirebaseFirestore.instance.collection('users');
  
  Future<String?> createUser(User user) async {
    try {
      final docRef = await usersCollection.add(user.toJson());
      return docRef.toString();
    } catch (error) {
      throw Exception(error);
    }
  }

   Future<User> findUser(userId) async {
    DocumentSnapshot doc = await usersCollection.doc(userId).get();
    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;

      print(data);
      
      final List<Objective> objectives = [];
      final List<Phrase> phrases = [];
      for (final objective in data['objectives']) {
        final List<Phrase> phrasesList = [];
        for (final phrase in objective['phrases']) {
          phrasesList.add(Phrase(text: phrase['text']));
        }
        objectives.add(Objective(
          name: objective['name'],
          phrases: phrasesList,
        ));
      }
      for (final phrase in data['phrases']) {
        phrases.add(Phrase(text: phrase['text']));
      }
      final User newUser = User(
        name: data['name'] as String,
        notificationTime: data['notification_time'] as int,
        dailyGoal: data['daily_goal']as int,
        objectives: objectives,
        phrases: phrases,
      );

      return newUser;
    } else {
      throw Exception("User not found");
    }
}


      Future<bool> updateUser(String userId, User user) async {
      try {
        await usersCollection.doc(userId).update(user.toJson());
        return true;
      } catch (error) {
       throw Exception(error);
      }
  }

}
