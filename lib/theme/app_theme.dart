import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Roboto',
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: const Color(0xFF3534C2),
    secondary: Colors.grey.shade300,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.grey.shade900,
    secondary: Colors.grey.shade800,
    onPrimary: Colors.white,
    onSecondary: Colors.grey.shade50,
  ),
);
