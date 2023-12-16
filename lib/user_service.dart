import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_template_app/user.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create or Update User
  Future<void> setUser(User user) async {
    await _firestore.collection('users').doc(user.id).set(user.toJson());
  }

  // Get User
  Future<User?> getUser(String userId) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(userId).get();
      return doc.exists ? User.fromFirestore(doc) : null;
    } catch (e) {
      // Handle errors
      return null;
    }
  }

  // Delete User
  Future<void> deleteUser(String userId) async {
    await _firestore.collection('users').doc(userId).delete();
  }

  // Additional methods like queryUsers for specific use cases can be added
}
