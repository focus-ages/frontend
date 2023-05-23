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
                .toList(), text: '')));

    return User(
        name: userFromSnapShot['name'] as String,
        notificationTime: userFromSnapShot['notificationTime'] as int,
        dailyGoal: userFromSnapShot['dailyGoal'] as int,
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

  Future<bool> addPhrase(userId, Phrase phrase) async {
    try {
      await usersCollection.doc(userId).update({
        'phrases': FieldValue.arrayUnion([phrase.toJson()])
      });
      return true;
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<bool> updateField(userId, String fieldName, String fieldValue) async {
    try {
      await usersCollection
          .doc(userId)
          .update({fieldName: int.parse(fieldValue)});
      return true;
    } catch (error) {
      throw Exception(error);
    }
  }


  Stream<List<Phrase>> getPhrases(userId) {
    try {
      return usersCollection
          .doc(userId)
          .snapshots()
          .map((DocumentSnapshot<Map<String, dynamic>> docmentSnapshot) {
        final data = docmentSnapshot.data();
        if (data != null) {
          final phrasesJson = data['phrases'] ?? [];
          final phrases =
              phrasesJson.map((json) => Phrase(text: json['text'])).toList();
          return phrases;
        } else {
          return [];
        }
      });
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<bool> deletePhrase(userId, Phrase phrase) async {
    try {
      await usersCollection.doc(userId).update({
        'phrases': FieldValue.arrayRemove([phrase.toJson()])
      });
      return true;
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> addGoal(userId, Objective objective) async {
    try {
      await usersCollection.doc(userId).update({
        'objectives': FieldValue.arrayUnion([objective.toJson()])
      });
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<bool> removeGoal(userId, String objectiveName) async {
    try{
      User? user = await findUser(userId);
      await usersCollection
          .doc(userId)
          .update({"objectives": FieldValue
          .arrayRemove([user!.objectives!
          .firstWhere((objective) => objective.name == objectiveName)
          .toJson()])});
      return true;
    } catch (error) {
      return false;
    }
  }
}
