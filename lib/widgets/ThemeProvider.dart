import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeData get currentTheme =>
      _themeMode == ThemeMode.light ? _lightTheme : _darkTheme;

  ThemeMode get currentThemeMode => _themeMode;

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  static final ThemeData _darkTheme = ThemeData.dark();
  static final ThemeData _lightTheme = ThemeData.light();
}
