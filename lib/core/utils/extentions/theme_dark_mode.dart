import 'package:flutter/material.dart';

final ThemeData customDarkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.white,

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.white,
  ),
  colorScheme: const ColorScheme.dark(
    primary: Colors.white,
    secondary: Colors.white,
    surface: Color.fromARGB(255, 255, 255, 255),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white, fontSize: 18),
    bodyMedium: TextStyle(color: Colors.white),
  ),
);
