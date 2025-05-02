import 'package:firebase_auth/firebase_auth.dart';
import 'package:snipscholar/core/services/authServices/user_service.dart';
import 'package:snipscholar/core/services/localStorage/local_storage_shared_preferences.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserService userService=UserService();
  Future<void> registerUser({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = credential.user?.uid;
      if(uid!=null){
        await userService.createUser(uid: uid, fullName: fullName, email: email);
      }else{
        throw Exception("Uid not found after registration");
      }

    } catch (e) {
      throw Exception("Registration failed: ${e.toString()}");
    }
  }
  Future<UserCredential?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle different errors like wrong-password, user-not-found, etc.
      throw Exception("Login Failed");
    }
  }
}
