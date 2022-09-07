import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLang = 'en';
  ThemeMode currentTheme = ThemeMode.light;

  void changeTheme(ThemeMode newTheme) async {
    if (newTheme == currentTheme) {
      return;
    }
    final prefs = await SharedPreferences.getInstance();
    currentTheme = newTheme;
    prefs.setString('theme', newTheme == ThemeMode.light ? 'light' : 'dark');
    notifyListeners();
  }

  void changeLanguage (String newLang) async {
    if (newLang == currentLang) {
      return;
    }
    final prefs = await SharedPreferences.getInstance();
    currentLang = newLang;
    prefs.setString('language', newLang);
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
