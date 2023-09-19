import 'package:uuid/uuid.dart';
import 'package:notes_keeper/domain/models/note_model.dart';
import 'package:notes_keeper/data/database/database_helper.dart';

class NoteViewModel {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  final Uuid _uuid = const Uuid();

  Future<void> addNote(String title, String content) async {
    Note newNote = Note(
      _uuid.v4(),
      title,
      content,
      DateTime.now(),
      DateTime.now(),
    );

    await _databaseHelper.insertNote(newNote);
  }

  Future<List<Note>> getAllNotes() async {
    List<Note> notes = await _databaseHelper.getAllNotes();
    return notes;
  }

  Future<int> updateNote(String id, String title, String content) async {
    Note updatedNote = Note.update(
      id,
      title,
      content,
      DateTime.now(),
    );
    
    return _databaseHelper.updateNoteById(updatedNote);
  }

  Future<int> deleteNoteById(String id) async {
    return _databaseHelper.deleteNoteById(id);
  }
}
