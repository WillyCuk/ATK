import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      foregroundColor: Color.fromARGB(255, 5, 44, 96),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    ),
    dividerTheme: const DividerThemeData(color: Colors.white, thickness: 3),
    colorScheme: const ColorScheme.dark(
      background: Color.fromARGB(255, 5, 44, 96),
      primary: Colors.white,
      secondary: Color.fromRGBO(255, 255, 255, .6),
      tertiary: Colors.black,
      inversePrimary: Color.fromARGB(255, 5, 44, 96),
      primaryContainer: Color.fromRGBO(242, 242, 242, 0.82),
      secondaryContainer: Color.fromRGBO(242, 242, 242, 0.5),
    ));
