import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snipscholar/core/services/localStorage/local_storage_shared_preferences.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser({
    required String uid,
    required String fullName,
    required String email,
  }) async {
    try {
      await _firestore.collection("users").doc(uid).set({
        'uid': uid,
        "fullName": fullName,
        "email": email,
        'groups': [],
        "createdAt": FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception("User creation failed: ${e.toString()}");
    }
  }
}
