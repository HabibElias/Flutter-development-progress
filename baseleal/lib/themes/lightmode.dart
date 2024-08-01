import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Color(0xffD8DACF),
    inversePrimary: Color(0xff73746E),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Color(0xff141414),
      fontSize: 30,
      fontFamily: 'Baris',
    ),
    titleMedium: TextStyle(
      color: Color(0xff141414),
      fontSize: 19.5,
      fontFamily: 'Bradobrei',
    ),
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Color(0xff141414),
      fontWeight: FontWeight.w600,
      fontSize: 23,
      fontFamily: 'Lexend',
    ),
  ),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(Color(0xffe1e1e1)),
        backgroundColor:
            WidgetStatePropertyAll(Color.fromARGB(102, 29, 29, 29))),
  ),
);
