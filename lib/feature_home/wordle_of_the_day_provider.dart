import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:wordles/common_providers/loader_state.dart';
import 'package:wordles/data/framework/firebase/firebase_constants.dart';
import 'package:wordles/data/usecases/wordles/get_wordle_use_case.dart';
import 'package:wordles/router.gr.dart';
import 'package:wordles/utils/words_manager.dart';

class WordleOfTheDayProvider with ChangeNotifier implements LoaderState {
  ViewState _state = ViewState.idle;

  @override
  ViewState get state => _state;

  bool _error = false;
  bool get error => _error;

  final GetWordleUseCase _getWordleUseCase = Injector.appInstance.get();

  @override
  void setState(ViewState viewState) {
    _state = viewState;
  }

  void dissmissError() {
    _error = false;
    setState(ViewState.idle);
    notifyListeners();
  }

  void goWordleOfTheDay(BuildContext context) async {
    _error = false;
    setState(ViewState.busy);
    notifyListeners();

    final wordle = await _getWordleUseCase.invoke(FirebaseConstants.wordleOfTheDay);

    if (wordle == null) {
      _error = true;
      setState(ViewState.idle);
    } else {
      _error = false;
      setState(ViewState.idle);

      final word = WordsManager.words[wordle.indexWord];
      AutoRouter.of(context).push(GameRoute(word: word));
    }

    notifyListeners();
  }
}
