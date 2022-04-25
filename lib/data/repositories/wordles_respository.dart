import 'package:wordles/data/datasources/wordles_data_source.dart';
import 'package:wordles/data/domain/wordle.dart';

class WordlesRepository {
  final WordlesDataSource dataSource;

  WordlesRepository({required this.dataSource});

  Future<Wordle?> createWordle(int indexWord, String name) {
    return dataSource.createWordle(indexWord, name);
  }

  Future<Wordle?> getWordle(String id) {
    return dataSource.getWordle(id);
  }

  Future<String?> defineWord(String word) {
    return dataSource.defineWord(word);
  }
}
