enum ViewState { idle, busy }

abstract class LoaderState {
  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  void setState(ViewState viewState);
}
