import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:notes_keeper/utils/app_exports.dart';

class UserRepository {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  var logger = Logger();

  Future<void> createUser(UserModel user) async {
    try {
      await _usersCollection.doc(user.id).set(user.toMap());
    } on FirebaseException catch (e) {
      logger.e('Firebase Error: ${e.code}');
    } catch (e) {
      logger.e('Error creating user: $e');
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      await _usersCollection.doc(user.id).update(user.toMap());
    } on FirebaseException catch (e) {
      logger.e('Firebase Error: ${e.code}');
    } catch (e) {
      logger.e('Error creating user: $e');
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      await _usersCollection.doc(userId).delete();
    } on FirebaseException catch (e) {
      logger.e('Firebase Error: ${e.code}');
    } catch (e) {
      logger.e('Error creating user: $e');
    }
  }
}
