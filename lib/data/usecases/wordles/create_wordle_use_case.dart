import 'package:wordles/data/domain/wordle.dart';
import 'package:wordles/data/repositories/wordles_respository.dart';

class CreateWordleUseCase {
  final WordlesRepository repository;

  CreateWordleUseCase({required this.repository});

  Future<Wordle?> invoke(int indexWord, String name) {
    return repository.createWordle(indexWord, name);
  }
}
