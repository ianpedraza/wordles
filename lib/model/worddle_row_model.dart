import 'package:wordles/model/wordle_character_model.dart';

class WordleRowModel {
  List<WordleCharacterModel> characters;

  WordleRowModel({this.characters = const []}) {
    if (characters.isEmpty) {
      characters = List<WordleCharacterModel>.generate(
        5,
        (_) => WordleCharacterModel(),
        growable: false,
      );
    }
  }
}
