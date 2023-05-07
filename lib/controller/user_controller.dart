import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:front/entity/user.dart';
import '../entity/objective.dart';
import '../entity/phrase.dart';

class UserController {
  final usersCollection = FirebaseFirestore.instance.collection('users');

  Future<String> createUser(User user) async {
    return await usersCollection
        .add(user.toJson())
        .then((DocumentReference documentRef) => documentRef.id)
        .catchError((error) => throw Exception(error));
  }

  Future<User?> findUser(userId) async {
    Map<String, dynamic> userFromSnapShot = await usersCollection
        .doc(userId)
        .get()
        .then((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>)
        .catchError((error) => throw Exception(error));

    final List<Objective> objectives = [];

    userFromSnapShot['objectives'].forEach((objective) async => objectives.add(
        Objective(
            name: objective['name'],
            phrases: await Stream.fromIterable(objective['phrases'])
                .map((phraseFromObjective) =>
                    Phrase(text: phraseFromObjective['text']))
                .toList())));

    return User(
        name: userFromSnapShot['name'] as String,
        notificationTime: userFromSnapShot['notificationTime'] as int,
        dailyGoal: userFromSnapShot['dailyGoal'] as int,
        timeUsed: userFromSnapShot['timeUsed'] as int,
        objectives: objectives,
        phrases: await Stream.fromIterable(userFromSnapShot['phrases'])
            .map((phraseFromUser) => Phrase(text: phraseFromUser['text']))
            .toList());
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
