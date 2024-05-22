import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      foregroundColor: Color.fromARGB(255, 255, 255, 255),
      backgroundColor: Color.fromARGB(255, 5, 44, 96),
    ),
    dividerTheme: const DividerThemeData(
        color: Color.fromARGB(255, 5, 44, 96), thickness: 3),
    colorScheme: const ColorScheme.light(
      background: Colors.white,
      primary: Colors.black,
      tertiary: Colors.white,
      inversePrimary: Colors.white,
      primaryContainer: Color.fromARGB(255, 5, 44, 96),
    ));
