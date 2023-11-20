import 'package:flutter/material.dart';
import 'package:notes_keeper/core/models/note_model.dart';

class NotesViewModel with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  void add(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  void update(Note note) {
    int index = _notes.indexWhere((element) => element.id == note.id);
    _notes[index] = note;
    notifyListeners();
  }

  void delete(Note note) {
    _notes.removeWhere((element) => element.id == note.id);
    notifyListeners();
  }

  void clear() {
    _notes.clear();
    notifyListeners();
  }

  void setNotes(List<Note> notes) {
    _notes = notes;
    notifyListeners();
  }

  Note findById(String id) {
    return _notes.firstWhere((element) => element.id == id);
  }

  List<Note> findByTitleAndContent(String title, String content) {
    return _notes
        .where((element) =>
            element.title.contains(title) && element.content.contains(content))
        .toList();
  }

  List<Note> findByTitle(String title) {
    return _notes.where((element) => element.title.contains(title)).toList();
  }

  List<Note> findByContent(String content) {
    return _notes
        .where((element) => element.content.contains(content))
        .toList();
  }
}
