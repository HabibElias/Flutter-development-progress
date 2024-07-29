import 'package:flutter/material.dart';
import 'package:quizproject/themes/themes.dart';

class Themeprovider extends ChangeNotifier {
  // the actual theme data
  ThemeData _themeData = lightmode;

  // need to get the themeData
  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // returns the bool isDarkmode
  bool get isDarkmode => _themeData == darkmode;

  // need to change the theme if light mode
  void chageThemeData() =>
      themeData = _themeData == darkmode ? lightmode : darkmode;
}
