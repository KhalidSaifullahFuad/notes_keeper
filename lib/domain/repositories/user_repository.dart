import 'package:notes_keeper/data/database/database_helper.dart';
import 'package:notes_keeper/domain/models/user_model.dart';

class UserRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  Future<int> insertUser(User user) async {
    return await _databaseHelper.insertUser(user);
  }

  Future<User?> getUserById(String id) async {
    return await _databaseHelper.getUserById(id);
  }

  Future<User?> getUserByEmail(String email) async {
    return await _databaseHelper.getUserByEmail(email);
  }

  Future<User?> getUserByEmailAndPassword(
      String email, String password) async {
    return await _databaseHelper.getUserByEmailAndPassword(email, password);
  }

  Future<List<User>> getAllUsers() async {
    return await _databaseHelper.getAllUsers();
  }
}