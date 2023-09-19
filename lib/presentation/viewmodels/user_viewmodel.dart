import 'package:notes_keeper/domain/models/user_model.dart';
import 'package:notes_keeper/domain/repositories/user_repository.dart';
import 'package:uuid/uuid.dart';

class UserViewModel {
  final UserRepository _userRepository = UserRepository();
  final Uuid _uuid = const Uuid();

  Future<int> registerUser(String name, String email, String password) async {
    User? existingUser = await _userRepository.getUserByEmail(email);

    if (existingUser != null) return -1;

    User newUser = User(_uuid.v4(), name, email, password, DateTime.now(), DateTime.now());
    return await _userRepository.insertUser(newUser);
  }

  Future<bool> loginUser(String email, String password) async {
    User? user = await _userRepository.getUserByEmailAndPassword(email, password);
    return user != null;
  }
}
