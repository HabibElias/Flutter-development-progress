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

  // need to change the theme if light mode
  void chageThemeData() {
    if (_themeData == lightmode) {
      themeData = darkmode;
    } else {
      themeData = lightmode;
    }
  }
}
