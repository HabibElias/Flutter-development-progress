import 'package:baseleal/themes/darkmode.dart';
import 'package:baseleal/themes/lightmode.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightmode;
  // bool if light mode
  bool get isLightmode => _themeData == lightmode;

  // geting the theme
  ThemeData get getThemeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    themeData = isLightmode ? darkmode : lightmode;
  }
}
