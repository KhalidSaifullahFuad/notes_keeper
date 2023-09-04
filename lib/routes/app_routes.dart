import 'package:flutter/material.dart';

import 'package:notes_keeper/core/app_exports.dart';

final Map<String, WidgetBuilder> routes = {
  '/get_started': (context) => const StartScreen(),
  '/login': (context) => const LoginScreen(),
  '/signup': (context) => const SignupScreen(),
  '/notes': (context) => const NotesScreen(),
  '/create_note': (context) => const CreateNoteScreen(),
};

enum Routes {
  get_started,
  login,
  signup,
  notes,
  create_note,
}
