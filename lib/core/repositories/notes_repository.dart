import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:notes_keeper/utils/app_exports.dart';

class NotesRepository {
  final CollectionReference _notesCollection =
      FirebaseFirestore.instance.collection('notes');
  var logger = Logger();

  Future<void> createNote(Note note) async {
    try {
      await _notesCollection.add(note.toMap());
    } on FirebaseException catch (e) {
      logger.e('Firebase Error: ${e.code}');
    } catch (e) {
      logger.e('Error creating note: $e');
    }
  }

  Future<void> updateNote(Note note) async {
    try {
      await _notesCollection.doc(note.id).update(note.toMap());
    } on FirebaseException catch (e) {
      logger.e('Firebase Error: ${e.code}');
    } catch (e) {
      logger.e('Error updating note: $e');
    }
  }

  Future<void> deleteNote(String noteId) async {
    try {
      await _notesCollection.doc(noteId).delete();
    } on FirebaseException catch (e) {
      logger.e('Firebase Error: ${e.code}');
    } catch (e) {
      logger.e('Error deleting note: $e');
    }
  }

  Future<List<Note>> getAllNotes() async {
    try {
      QuerySnapshot querySnapshot = await _notesCollection.get();
      return querySnapshot.docs.map((doc) => Note.fromSnapshot(doc)).toList();
    } on FirebaseException catch (e) {
      logger.e('Firebase Error: ${e.code}');
      return [];
    } catch (e) {
      logger.e('Error getting all notes: $e');
      return [];
    }
  }

  Future<Note?> getNoteById(String noteId) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _notesCollection.doc(noteId).get();
      return Note.fromSnapshot(documentSnapshot);
    } on FirebaseException catch (e) {
      logger.e('Firebase Error: ${e.code}');
      return null;
    } catch (e) {
      logger.e('Error getting note by id: $e');
      return null;
    }
  }
}
