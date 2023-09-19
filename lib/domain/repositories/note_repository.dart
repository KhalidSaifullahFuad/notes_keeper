import 'package:notes_keeper/data/database/database_helper.dart';
import 'package:notes_keeper/domain/models/note_model.dart';

class NoteRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  Future<int> insertNote(Note note) async {
    return await _databaseHelper.insertNote(note);
  }

  Future<int> updateNote(Note note) async {
    return await _databaseHelper.updateNoteById(note);
  }

  Future<int> deleteNoteById(String id) async {
    return await _databaseHelper.deleteNoteById(id);
  }

  Future<List<Note>> getAllNotes() async {
    return await _databaseHelper.getAllNotes();
  }
}
