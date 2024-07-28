import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Color(0xffffe0b2),
    onPrimary: Colors.white,
    secondary: Color.fromARGB(255, 139, 69, 19),
    onSecondary: Color(0xff1e1e1e),
  ),
);

ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Color(0xff4a4a4a),
    onPrimary: Color(0xff1e1e1e),
    secondary: Color(0xff6f8c95),
    onSecondary: Color(0xffffffff),
  ),
);
