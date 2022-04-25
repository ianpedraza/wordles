import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class DrawerProvider with ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  BuildContext context;

  DrawerProvider(this.context) {
    _fetchDarkMode();
  }

  void _fetchDarkMode() async {
    final savedThemeMode = await AdaptiveTheme.getThemeMode();
    _isDarkMode = savedThemeMode == AdaptiveThemeMode.dark;
    notifyListeners();
  }

  void setDark(bool isDark) {
    _isDarkMode = isDark;
    _changeTheme();
    notifyListeners();
  }

  void toggle() {
    _isDarkMode = !_isDarkMode;
    _changeTheme();
    notifyListeners();
  }

  void _changeTheme() {
    if (_isDarkMode) {
      AdaptiveTheme.of(context).setDark();
    } else {
      AdaptiveTheme.of(context).setLight();
    }
  }
}
