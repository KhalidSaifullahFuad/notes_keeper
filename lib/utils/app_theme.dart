import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Roboto',
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: const Color(0xFF3534C2),
    primaryContainer: Color.fromARGB(255, 199, 199, 255),
    surface: const Color(0xFFE8E8EB),
    secondary: Colors.grey.shade400,
    onBackground: const Color(0xFF202A4B),
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurfaceVariant: const Color.fromARGB(255, 104, 104, 104),
    error: const Color(0xFFD32F2F), //Color(0xFFD8352A),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: const Color(0xFF1E1E1E),
    primary: const Color(0xFF51519E),
    primaryContainer: Color.fromARGB(255, 162, 162, 233),
    surface: Color.fromARGB(255, 22, 22, 22),
    secondary: Colors.grey.shade800,
    onPrimary: Colors.white,
    onSecondary: Colors.grey.shade50,
    error: const Color(0xFFD32F2F),
  ),
);
