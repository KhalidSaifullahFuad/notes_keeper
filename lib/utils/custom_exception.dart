class AuthException implements Exception {
  final String scope;
  final String message;

  AuthException({
    required this.scope,
    required this.message,
  });
}

class WrongPassword extends AuthException {
  WrongPassword({required super.scope, required super.message});
}
