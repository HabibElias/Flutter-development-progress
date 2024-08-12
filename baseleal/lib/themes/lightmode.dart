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
      height: 0.85,
    ),
    labelLarge: TextStyle(
      color: Color(0xff141414),
      fontFamily: 'Fantuwua',
      fontSize: 23,
    ),
    labelMedium: TextStyle(
      color: Color(0xff141414),
      fontFamily: 'Fantuwua',
      fontSize: 17,
    ),
    labelSmall: TextStyle(
      color: Color.fromARGB(163, 20, 20, 20),
      fontFamily: 'Lexend',
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Sadiss',
      color: Color(0xff141414),
      fontSize: 23,
      height: 1.25,
      letterSpacing: 1.25,
    ),
    displayLarge: TextStyle(
      color: Color(0xff141414),
      fontSize: 23,
      fontFamily: 'Baris',
    ),
    displayMedium: TextStyle(
      color: Color(0xff141414),
      fontSize: 18.5,
      fontFamily: 'Bradobrei',
      height: 0.85,
    ),
    displaySmall: TextStyle(
      color: Color.fromARGB(255, 15, 81, 162),
      fontFamily: 'Lexend',
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    headlineMedium: TextStyle(
      color: Color.fromARGB(255, 59, 59, 59),
      fontSize: 23,
      fontWeight: FontWeight.bold,
      fontFamily: 'Bradobrei',
    ),bodyLarge: TextStyle(
      color: Colors.black,
      fontFamily: 'Lexend',
      fontSize: 30,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      color: Color.fromARGB(140, 0, 0, 0),
      fontFamily: 'Lexend',
      fontSize: 20,
      fontWeight: FontWeight.normal,
    ),
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Color(0xff141414),
      fontWeight: FontWeight.w600,
      fontSize: 21,
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
