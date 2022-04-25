import 'package:wordles/data/domain/wordle.dart';

abstract class WordlesDataSource {
  Future<Wordle?> createWordle(int indexWord, String name);
  Future<Wordle?> getWordle(String id);
  Future<String?> defineWord(String word);
}
