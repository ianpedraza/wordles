import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:wordles/common_ui_components/keyboard/keyboard_model.dart';
import 'package:wordles/common_ui_components/wordles_modal/wordles_modal.dart';
import 'package:wordles/data/usecases/wordles/define_word_use_case.dart';
import 'package:wordles/model/character_status.dart';
import 'package:wordles/model/wordle_model.dart';
import 'package:wordles/styles/text_styles.dart';
import 'package:wordles/utils/types.dart';
import 'package:wordles/utils/words_manager.dart';
import 'package:wordles/values/dimens.dart';
import 'package:wordles/values/strings.dart';

class GameProvider with ChangeNotifier {
  final _wordleModel = WordleModel();
  WordleModel get wordleModel => _wordleModel;

  final _keyboardModel = KeyboardModel();
  KeyboardModel get keyboardModel => _keyboardModel;

  int _currentRow = 0;
  int get currentRow => _currentRow;

  bool _hasWon = false;
  bool get hasWon => _hasWon;

  bool _hasLose = false;
  bool get hasLose => _hasLose;

  String? _meaning;
  String get meaning => _meaning ?? emptyString;

  String? _error;
  String? get error => _error;

  String get shared => _getShared();

  final String word;
  final String? name;

  int _index = -1;

  final DefineWordUseCase _defineWordUseCase = Injector.appInstance.get();

  GameProvider(this.word, this.name) {
    _index = WordsManager.indexOf(word);
    _defineWord();
  }

  void _defineWord() async {
    final response = await _defineWordUseCase.invoke(word);

    if (response != null) {
      _meaning = response;
    }

    notifyListeners();
  }

  void write(String value) {
    _error = null;

    final row = _wordleModel.rows[_currentRow];

    final writeIndex = row.characters.indexWhere((character) => character.value.isEmpty);

    if (writeIndex < 0 || writeIndex > 4) {
      notifyListeners();
      return;
    }

    row.characters[writeIndex].value = value;

    notifyListeners();
  }

  void delete() {
    _error = null;

    final row = _wordleModel.rows[_currentRow];

    if (row.characters.first.value.isEmpty) {
      notifyListeners();
      return;
    }

    final deleteIndex = row.characters.lastIndexWhere((character) => character.value.isNotEmpty);

    if (deleteIndex < 0 || deleteIndex > 4) {
      return;
    }

    row.characters[deleteIndex].value = emptyString;

    notifyListeners();
  }

  void check() {
    if (_currentRow >= _wordleModel.rows.length) return;

    final row = _wordleModel.rows[_currentRow];
    final rowWord = row.characters.fold<String>(emptyString, (value, element) => value + element.value).trim();

    if (rowWord.length < 5) {
      _error = eNotEnoughLetters;
      notifyListeners();
      return;
    }

    if (!WordsManager.words.contains(rowWord)) {
      _error = eNotInWordlList;
      notifyListeners();
      return;
    }

    /* Check in wordle */

    for (int i = 0; i < 5; i++) {
      if (word.contains(row.characters[i].value)) {
        row.characters[i].status = CharacterStatus.inWordle;
        _keyboardModel.changeStatus(row.characters[i].value, CharacterStatus.inWordle);
      }
    }

    /* Check at position */

    final answerArray = word.toLowerCase().split('');

    for (int i = 0; i < 5; i++) {
      if (answerArray[i] == row.characters[i].value.toLowerCase()) {
        row.characters[i].status = CharacterStatus.atPosition;
        _keyboardModel.changeStatus(row.characters[i].value, CharacterStatus.atPosition);
      }
    }

    /* Paint no in wordle */

    for (int i = 0; i < 5; i++) {
      if (row.characters[i].status == null) {
        row.characters[i].status = CharacterStatus.notIn;
        _keyboardModel.changeStatus(row.characters[i].value, CharacterStatus.notIn);
      }
    }

    /* Check if win */

    if (word == rowWord) {
      _hasWon = true;
    }

    /* Check if lose */

    if (_currentRow == 5 && word != rowWord) {
      _hasLose = true;
    }

    _currentRow++;

    notifyListeners();
  }

  void showMeaning(BuildContext context) {
    WordlesModal.showModal(
      context: context,
      child: SingleChildScrollView(
        child: Wrap(
          children: <Widget>[
            Text(word, style: TextStyles(context).baseBold24Text),
            const SizedBox(height: Dimens.componentsDivider),
            Text(_meaning ?? emptyString, style: TextStyles(context).baseRegular18Text),
          ],
        ),
      ),
    );
  }

  String _getShared() {
    String value = "wordles.online ${name != null ? 'Wordle de $name' : _index} ${_hasWon ? _currentRow : 'X'}/6";

    final emojis = _wordleModel.rows.fold<String>(emptyString, (previousValue, row) {
      return previousValue +
          row.characters.fold<String>(emptyString, (previousValue, element) {
            return previousValue + (element.status != null ? element.status!.emoji : emptyString);
          }) +
          "\n";
    }).trim();

    return "$value\n\n$emojis";
  }
}
