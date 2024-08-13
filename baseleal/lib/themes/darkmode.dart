import 'package:flutter/material.dart';

ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Color(0xff141414),
    inversePrimary: Color(0xFF393939),
    onSecondary: Color.fromARGB(153, 191, 191, 191),
    secondary: Color(0xffbfbfbf),
    secondaryFixedDim: Color(0x20bfbfbf),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Color(0xffbfbfbf),
      fontSize: 30,
      fontFamily: 'Baris',
    ),
    titleMedium: TextStyle(
      color: Color(0xffbfbfbf),
      fontSize: 19.5,
      fontFamily: 'Bradobrei',
      height: 0.85,
    ),
    labelLarge: TextStyle(
      color: Color(0xffBFBFBF),
      fontFamily: 'Fantuwua',
      fontSize: 23,
    ),
    labelMedium: TextStyle(
      color: Color(0xff141414),
      fontFamily: 'Fantuwua',
      fontSize: 17,
    ),
    labelSmall: TextStyle(
      color: Color(0x80141414),
      fontFamily: 'Lexend',
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Sadiss',
      color: Color(0xffbfbfbf),
      fontSize: 23,
      height: 1.25,
      letterSpacing: 1.25,
    ),
    displayLarge: TextStyle(
      color: Color(0xffbfbfbf),
      fontSize: 23,
      fontFamily: 'Baris',
    ),
    displayMedium: TextStyle(
      color: Color(0xffbfbfbf),
      fontSize: 18.5,
      fontFamily: 'Bradobrei',
      height: 0.85,
    ),
    displaySmall: TextStyle(
      color: Color.fromARGB(255, 19, 120, 243),
      fontFamily: 'Lexend',
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    headlineMedium: TextStyle(
      color: Color.fromARGB(255, 125, 125, 125),
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'Lexend',
    ),
    bodyLarge: TextStyle(
      color: Color(0xffbfbfbf),
      fontFamily: 'Lexend',
      fontSize: 30,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      color: Color(0x80bfbfbf),
      fontFamily: 'Lexend',
      fontSize: 20,
      fontWeight: FontWeight.normal,
    ),
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Color(0xffbfbfbf),
      fontWeight: FontWeight.w600,
      fontSize: 21,
      fontFamily: 'Lexend',
    ),
  ),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStatePropertyAll(
        Color(0xff141414),
      ),
      backgroundColor: WidgetStatePropertyAll(
        Color(0xffbfbfbf),
      ),
    ),
  ),
);
