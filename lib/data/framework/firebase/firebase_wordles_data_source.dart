import 'dart:developer';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:wordles/data/api.dart';
import 'package:wordles/data/datasources/wordles_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wordles/data/domain/wordle.dart';
import 'package:wordles/data/framework/firebase/firebase_constants.dart';

class FirebaseWordlesDataSource implements WordlesDataSource {
  static const tag = "FirebaseWordlesDataSource";

  final _database = FirebaseFirestore.instance;

  @override
  Future<Wordle?> createWordle(int indexWord, String name) async {
    try {
      final ref = _database.collection(FirebaseConstants.collectionWordles);

      final wordleId = ref.doc().id;
      final wordle = Wordle(id: wordleId, indexWord: indexWord, name: name);

      await ref.doc(wordleId).set(wordle.toMap());

      return wordle;
    } catch (error) {
      log("$tag:createWordle:Error:$error");
      return null;
    }
  }

  @override
  Future<Wordle?> getWordle(String id) async {
    try {
      final snapshot = await _database.collection(FirebaseConstants.collectionWordles).doc(id).get();

      if (snapshot.exists && snapshot.data() != null) {
        return Wordle.fromMap(snapshot.data()!);
      }

      return null;
    } catch (error) {
      log("$tag:getWordle:Error:$error");
      return null;
    }
  }

  @override
  Future<String?> defineWord(String word) async {
    try {
      HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(
        WordlesApi.functionDefine,
        options: HttpsCallableOptions(
          timeout: const Duration(seconds: 5),
        ),
      );

      final params = <String, dynamic>{
        'word': word,
      };

      final response = await callable(params);

      final result = response.data["def"];
      log("$tag:defineWord:$result");

      return result;
    } catch (error) {
      log("$tag:defineWord:Error:$error");
      return null;
    }
  }
}
