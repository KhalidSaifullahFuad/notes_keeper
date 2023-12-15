import 'package:flutter/material.dart';
import 'package:notes_keeper/utils/alert_dialog.dart';
import 'package:notes_keeper/utils/app_exports.dart';

class NotesViewModel with ChangeNotifier {
  final NotesRepository _notesRepository = NotesRepository();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  UserModel currentUser = UserModel.empty;

  List<Note> _notes = [];

  List<Note> get notes => _notes;

  bool isListView = true;

  bool isFetching = false;

  void toggleView() {
    isListView = !isListView;
    notifyListeners();
  }

  // Fetch all notes
  // Future<void> getAllNotes() async {
  //   _notes = await _notesRepository.getAllNotes();
  //   notifyListeners();
  // }
  Future<void> getAllNotes(BuildContext context) async {
    // return await _notesRepository.getAllNotes();
    isFetching = true;
    _notes = [];
    try {
      // showMyDialog(context);
      _notes = await _notesRepository.getAllNotesByUserId(currentUser.id);
    } catch (e) {
      // print(e);
    } finally {
      notifyListeners();
      isFetching = false;
      // Navigator.of(context).pop();
    }
  }

  // Create a new note
  Future<void> createNote() async {
    String title = titleController.text.trim();
    String content = contentController.text.trim();

    if (content.isEmpty) return;
    if (title.isEmpty) {
      titleController.text = 'Untitled';
      title = 'Untitled';
    }

    Note newNote = Note(
      userId: currentUser.id,
      title: title,
      content: content,
      tags: [],
      createdDate: DateTime.now(),
      updatedDate: DateTime.now(),
    );

    _notes.insert(0, newNote);

    titleController.clear();
    contentController.clear();

    notifyListeners();

    await _notesRepository.createNote(newNote);
  }

  // Update an existing note
  Future<void> updateNote(String noteId) async {
    String title = titleController.text.trim();
    String content = contentController.text.trim();

    if (title.isEmpty) {
      title = 'Untitled';
    }

    int index = _notes.indexWhere((element) => element.id == noteId);
    Note existingNote = _notes[index];
    Note updatedNote = Note(
      id: noteId,
      userId: currentUser.id,
      title: title,
      content: content,
      tags: existingNote.tags,
      createdDate: existingNote.createdDate,
      updatedDate: DateTime.now(),
    );

    _notes[index] = updatedNote;
    titleController.clear();
    contentController.clear();
    notifyListeners();

    await _notesRepository.updateNote(updatedNote);
  }

  // Delete a note
  Future<void> deleteNote(String noteId) async {
    await _notesRepository.deleteNote(noteId);
    // await getAllNotes(); // Refresh the list after deleting a note
  }

  Future<void> filterNotesByTag(String tag) async {
    if (tag.isEmpty || tag == 'All') {
      // await getAllNotes();
      return;
    }
    _notes = await _notesRepository.filterNotesByTag(tag);
    notifyListeners();
    // return _notes.where((note) => note.tags!.contains(tag)).toList();
  }
}
