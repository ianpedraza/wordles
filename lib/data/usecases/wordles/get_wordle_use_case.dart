import 'package:wordles/data/domain/wordle.dart';
import 'package:wordles/data/repositories/wordles_respository.dart';

class GetWordleUseCase {
  final WordlesRepository repository;

  GetWordleUseCase({required this.repository});

  Future<Wordle?> invoke(String id) {
    return repository.getWordle(id);
  }
}
