import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Login user with email & password
  Future<String?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Success, no error message
    } catch (e) {
      return e.toString(); // Return error message if login fails
    }
  }

  /// Logout user
  Future<void> logoutUser() async {
    await _auth.signOut();
  }

  /// Get Current User
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
