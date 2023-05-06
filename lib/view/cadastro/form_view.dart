// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../entity/phrase.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  //final String title;

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final String example = "27yacftJ82t8KwlYnmzN";
  final TextEditingController _phraseController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore Example'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _phraseController,
            decoration: const InputDecoration(
              labelText: 'Phrase',
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final userId = example;
              final phrase = Phrase(text: _phraseController.text);
              final result = await addPhrase(userId, phrase);
              if (result) {
                final phrases = await getPhrases(userId).first;
                print('Phrases: $phrases');
              }
            },
            child: const Text('Add Phrase'),
          ),
          ElevatedButton(
            onPressed: () async {
              final userId = example;
              final phrases = await getPhrases(userId).first;
              print('Phrases: $phrases');
            },
            child: const Text('Get Phrases'),
          ),
          ElevatedButton(
            onPressed: () async {
              final userId = example;
              final phrase = Phrase(text: _phraseController.text);
              final result = await deletePhrase(userId, phrase);
              if (result) {
                final phrases = await getPhrases(userId).first;
                print('Phrases: $phrases');
              }
            },
            child: const Text('Delete Phrase'),
          ),
        ],
      ),
    );
  }

  Future<bool> addPhrase(String userId, Phrase phrase) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'phrases': FieldValue.arrayUnion([phrase.toJson()])
      });
      return true;
    } catch (error) {
      throw Exception(error);
    }
  }

  Stream<List<Phrase>> getPhrases(String userId) {
    try {
      return _firestore
          .collection('users')
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

  Future<bool> deletePhrase(String userId, Phrase phrase) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'phrases': FieldValue.arrayRemove([phrase.toJson()])
      });
      return true;
    } catch (error) {
      throw Exception(error);
    }
  }
}
