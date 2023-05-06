// ignore_for_file: unused_element

import 'package:cloud_firestore/cloud_firestore.dart';

class UserControler {
  final usersCollection = FirebaseFirestore.instance.collection('users');

  Future<String?> createUser(user) async {
    try {
      final docRef = await usersCollection.add(user);
      return docRef.toString();
    } catch (error) {
      throw Exception(error);
    }
  }

  Future findUser(userId) async {
    try {
      DocumentSnapshot doc = await usersCollection.doc(userId).get();
      if (doc.exists) {
        return doc.data();
      } else {
        return throw Exception("User not found");
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<bool> updateUser(userId, user) async {
    try {
      await usersCollection.doc(userId).update(user);
      return true;
    } catch (error) {
      throw Exception(error);
    }

    // ignore: dead_code
    Future<bool> addPhrase(userId, String phrase) async {
      try {
        await usersCollection.doc(userId).update({
          'phrases': FieldValue.arrayUnion([phrase])
        });
        return true;
      } catch (error) {
        throw Exception(error);
      }
    }

    Stream<List<String>> getPhrases(userId) {
      try {
        return usersCollection
            .doc(userId)
            .snapshots()
            .map((DocumentSnapshot<Map<String, dynamic>> docmentSnapshot) {
          final data = docmentSnapshot.data();
          if (data != null) {
            return List<String>.from(data['phrases'] ?? []);
          } else {
            return [];
          }
        });
      } catch (error) {
        throw Exception(error);
      }
    }

    Future<bool> deletePhrase(userId, String phrase) async {
      try {
        await usersCollection.doc(userId).update({
          'phrases': FieldValue.arrayRemove([phrase])
        });
        return true;
      } catch (error) {
        throw Exception(error);
      }
    }
  }
}
