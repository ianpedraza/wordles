import 'package:wordles/data/domain/wordle.dart';
import 'package:wordles/data/repositories/dynamic_links_respository.dart';

class CreateDynamicLinkUseCase {
  final DynamicLinksRepository repository;

  CreateDynamicLinkUseCase({required this.repository});

  Future<Uri?> invoke(Wordle wordle) {
    return repository.createDynamicLink(wordle);
  }
}
