import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Register a new user with email, password, and full name
  Future<String?> registerUser({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      // Step 1: Create User in Firebase Authentication
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        // Step 2: Update Firebase Authentication Profile with Display Name
        await user.updateDisplayName(fullName);
        await user.reload();

        // Step 3: Store User Info in Firestore for Further Use
        await _firestore.collection("users").doc(user.uid).set({
          "fullName": fullName,
          "email": email,
          "uid": user.uid,
          "createdAt": FieldValue.serverTimestamp(),
        });

        return null; // No errors, registration successful
      }
      return "User registration failed.";
    } catch (e) {
      return e.toString(); // Return error message
    }
  }

  /// Get Current User Data from Firestore
  Future<DocumentSnapshot?> getUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      return await _firestore.collection("users").doc(user.uid).get();
    }
    return null;
  }
}
