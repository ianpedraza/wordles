import 'package:wordles/model/character_status.dart';
import 'package:wordles/utils/types.dart';

class WordleCharacterModel {
  String value;
  CharacterStatus? status;

  WordleCharacterModel({
    this.value = emptyString,
    this.status,
  });
}
