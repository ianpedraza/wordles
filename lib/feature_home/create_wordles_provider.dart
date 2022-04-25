import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:wordles/common_providers/loader_state.dart';
import 'package:wordles/data/usecases/dynamic_links/create_dynamic_link_use_case.dart';
import 'package:wordles/data/usecases/wordles/create_wordle_use_case.dart';
import 'package:wordles/utils/words_manager.dart';
import 'package:wordles/values/strings.dart';

class CreateWordlesProvider with ChangeNotifier implements LoaderState {
  String? _word;
  String? get word => _word;

  String? _name;
  String? get name => _name;

  bool _isValidWord = false;
  bool get isValidWord => _isValidWord;

  bool _isValidName = false;
  bool get isValidName => _isValidName;

  ViewState _state = ViewState.idle;

  @override
  ViewState get state => _state;

  bool _error = false;
  bool get error => _error;

  Uri? _wordleURL;
  Uri? get wordleURL => _wordleURL;

  String? _wordError;
  String? get wordError => _wordError;

  String? _nameError;
  String? get nameError => _nameError;

  final CreateWordleUseCase _createWordleUseCase = Injector.appInstance.get();
  final CreateDynamicLinkUseCase _createDynamicLinkUseCase = Injector.appInstance.get();

  @override
  void setState(ViewState viewState) {
    _state = viewState;
  }

  void setWord(String word) {
    _word = null;
    _wordError = null;
    _isValidWord = false;

    if (WordsManager.words.contains(word)) {
      _word = word;
      _isValidWord = true;
      notifyListeners();
      return;
    }

    if (word.isEmpty) {
      _wordError = eWordEmpty;
    } else {
      _wordError = eNotInWordlList;
    }

    notifyListeners();
  }

  void setName(String name) {
    _name = null;
    _nameError = null;
    _isValidName = false;

    if (name.isEmpty) {
      _nameError = eNameEmpty;
    } else {
      _name = name;
      _isValidName = true;
    }

    notifyListeners();
  }

  void dissmissError() {
    _error = false;
    notifyListeners();
  }

  void dissmissSuccess() {
    _isValidName = false;
    _isValidWord = false;
    _word = null;
    _name = null;
    _error = false;
    _wordleURL = null;
    setState(ViewState.idle);
    notifyListeners();
  }

  void createWordle() async {
    if (!_isValidWord || !_isValidName) return;

    setState(ViewState.busy);
    notifyListeners();

    final index = WordsManager.words.indexOf(_word!);

    if (index < 0) {
      setState(ViewState.idle);
      _error = true;
      notifyListeners();
      return;
    }

    final wordleId = await _createWordleUseCase.invoke(index, _name!);

    if (wordleId == null) {
      setState(ViewState.idle);
      _error = true;
    } else {
      _wordleURL = await _createDynamicLinkUseCase.invoke(wordleId);
    }

    notifyListeners();
  }
}
