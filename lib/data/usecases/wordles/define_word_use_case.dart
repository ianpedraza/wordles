import 'package:wordles/data/repositories/wordles_respository.dart';

class DefineWordUseCase {
  final WordlesRepository repository;

  DefineWordUseCase({required this.repository});

  Future<String?> invoke(String word) {
    return repository.defineWord(word);
  }
}
