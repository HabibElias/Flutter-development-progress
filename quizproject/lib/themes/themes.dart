import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Color(0xffffe0b2),
    onPrimary: Colors.white,
    secondary: Color.fromARGB(255, 139, 69, 19),
    onSecondary: Color(0xff1e1e1e),
    tertiary: Color(0xffADD8E6),
    onTertiary: Color.fromARGB(141, 245, 245, 245),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0x80FFE0B2),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Color(0xffA0C2CC),
  ),
);

ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Color(0xffffffff),
    onPrimary: Color(0xff1e1e1e),
    secondary: Color(0xff6f8c95),
    onSecondary: Color.fromARGB(255, 236, 236, 236),
    tertiary: Color(0xff4a4a4a),
    onTertiary: Color.fromARGB(120, 74, 74, 74),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff6f8c95),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Color(0xff4A4A4A),
  ),
);
