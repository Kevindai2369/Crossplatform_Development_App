import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  Locale _locale = const Locale('en');

  bool get isDarkMode => _isDarkMode;
  Locale get locale => _locale;

  void toggleDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}
