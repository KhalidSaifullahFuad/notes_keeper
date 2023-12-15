import 'package:flutter/material.dart';
import 'package:notes_keeper/utils/app_exports.dart';

class SignUpViewModel with ChangeNotifier {
  final AuthenticationRepository _authenticationRepository = AuthenticationRepository();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  bool _isLoading = false;
  String _errorMessage = '';
  String _emailErrorMessage = '';
  String _passwordErrorMessage = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  String get emailErrorMessage => _emailErrorMessage;
  String get passwordErrorMessage => _passwordErrorMessage;

  void toggleLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  Future<bool> registerUser() async {
    toggleLoading();

    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String phone = phoneController.text.trim();

    try {
      await _authenticationRepository.signUpWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      return true;
    } on AuthException catch (e) {
      if (e.scope == 'email') {
        _emailErrorMessage = e.message;
      } else if (e.scope == 'password') {
        _passwordErrorMessage = e.message;
      } else {
        _errorMessage = e.message;
      }
      notifyListeners();
      return false;
    } catch (e) {
      _errorMessage = e.toString().split(':')[1].trim();
      notifyListeners();
      return false;
    } finally {
      toggleLoading();
    }
  }

  Future<bool> loginUser() async {
    toggleLoading();

    String email = emailController.text;
    String password = passwordController.text;

    try {
      await _authenticationRepository.login(
        email: email,
        password: password,
      );
      return true;
    } on AuthException catch (e) {
      if (e.scope == 'email') {
        _emailErrorMessage = e.message;
      } else if (e.scope == 'password') {
        _passwordErrorMessage = e.message;
      } else {
        _errorMessage = e.message;
      }
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString().split(':')[1].trim();
      notifyListeners();
    } finally {
      toggleLoading();
    }
    return false;
  }

  Future<void> logout() async {
    await _authenticationRepository.logout();
  }
}
