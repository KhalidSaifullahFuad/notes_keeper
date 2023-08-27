import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Roboto',
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: const Color(0xFF3534C2),
    surface: const Color(0xFFE8E8EB),
    secondary: Colors.grey.shade400,
    onBackground: const Color(0xFF202A4B),
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    error: const Color(0xFFD32F2F), //Color(0xFFD8352A),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: const Color(0xFF1E1E1E),
    primary: const Color(0xFF51519E),
    surface: const Color(0xFF1A1A1A),
    secondary: Colors.grey.shade800,
    onPrimary: Colors.white,
    onSecondary: Colors.grey.shade50,
    error: const Color(0xFFD32F2F),
  ),
);
