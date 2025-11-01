import 'package:flutter/material.dart';

final ThemeData customLightMode = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.black,
  ),
  colorScheme: const ColorScheme.light(
    primary: Colors.black,
    secondary: Colors.black,
    surface: Colors.black,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black, fontSize: 18),
    bodyMedium: TextStyle(color: Colors.black),
  ),
);
