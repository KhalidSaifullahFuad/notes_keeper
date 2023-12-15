import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:notes_keeper/utils/app_exports.dart';

class AuthenticationRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserRepository _userRepository = UserRepository();

  final logger = Logger();

  Stream<UserModel> get user => _auth.authStateChanges().map((user) {
        if (user == null) {
          return UserModel.empty;
        } else {
          return UserModel(
            id: user.uid,
            name: user.displayName ?? "",
            email: user.email ?? "",
          );
        }
      });

  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      UserModel newUser = UserModel(
        id: authResult.user!.uid,
        name: name,
        email: email,
        password: password,
        createdDate: DateTime.now(),
        updatedDate: DateTime.now(),
      );

      await _userRepository.createUser(newUser);

      return authResult.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw AuthException(
              scope: "email",
              message: "An account is already exists for this email.");
        case 'invalid-email':
          throw AuthException(
              scope: "email", message: "Email address is invalid.");
        case 'weak-password':
          throw AuthException(
              scope: "password", message: "Password is too weak.");
        case 'operation-not-allowed':
          throw Exception('Account not not enabled.');
        default:
          throw Exception('An undefined Error happened.');
      }
    } catch (e) {
      logger.e(e);
    }
  }

  Future<User?> login({required String email, required String password}) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      switch (e.code) {
        case 'invalid-login-credentials':
          throw AuthException(
              scope: "email", message: "Invalid login credentials.");
        case 'user-disabled':
          throw AuthException(
              scope: "email", message: "This account has been disabled.");
        case 'user-not-found':
          throw AuthException(
              scope: "email", message: "No account found for this email.");
        case 'wrong-password':
          throw AuthException(
              scope: "password", message: "Wrong password provided.");
        default:
          throw Exception('An undefined Error happened.');
      }
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }

  // Future<User> signInWithGoogle() async {
  //   final googleSignIn = GoogleSignIn();
  //   final googleSignInAccount = await googleSignIn.signIn();
  //   if (googleSignInAccount != null) {
  //     final googleSignInAuthentication =
  //         await googleSignInAccount.authentication;
  //     if (googleSignInAuthentication != null) {
  //       final authResult = await _auth.signInWithCredential(
  //         GoogleAuthProvider.credential(
  //           accessToken: googleSignInAuthentication.accessToken,
  //           idToken: googleSignInAuthentication.idToken,
  //         ),
  //       );
  //       return authResult.user;
  //     } else {
  //       throw AuthenticationException(
  //         message: 'Missing Google Authentication',
  //       );
  //     }
  //   } else {
  //     throw AuthenticationException(
  //       message: 'Sign in aborted by user',
  //     );
  //   }
  // }

  // Future<void> signOut() async {
  //   final googleSignIn = GoogleSignIn();
  //   await googleSignIn.signOut();
  //   await _auth.signOut();
  // }
}
