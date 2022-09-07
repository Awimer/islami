import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLang = 'en';
  ThemeMode currentTheme = ThemeMode.light;

  void changeTheme(ThemeMode newTheme) {
    if (newTheme == currentTheme) {
      return;
    }
    currentTheme = newTheme;
    notifyListeners();
  }

  void changeLanguage(String newLang) {
    if (newLang == currentLang) {
      return;
    }
    currentLang = newLang;
    notifyListeners();
  }

  bool isDarkMode() {
    return currentTheme == ThemeMode.dark;
  }

  String getMainBackGround() {
    return isDarkMode()
        ? 'assets/images/background_pattern_dark.png'
        : 'assets/images/background_pattern.png';
  }

  String getBodyOfSebha() {
    return isDarkMode()
        ? 'assets/images/body_of_sebha_dark.png'
        : 'assets/images/body_of_sebha.png';
  }

  String getHeadOfSebha() {
    return isDarkMode()
        ? 'assets/images/head_of_sebha_dark.png'
        : 'assets/images/head_of_sebha.png';
  }
}
