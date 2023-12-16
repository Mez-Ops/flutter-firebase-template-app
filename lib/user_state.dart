import 'package:flutter/material.dart';
import 'package:flutter_firebase_template_app/user.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;

class UserState with ChangeNotifier {
  User? _currentUser;
  String _verificationId = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _currentUser;
  String get verificationId => _verificationId;

  void setUser(User? user) {
    _currentUser = user;
    notifyListeners();
  }

  /// Sign the user in with their phone number.
  /// This needs updated.
  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        final userCredential = await _auth.signInWithCredential(credential);
        setUser(User(id: userCredential.user?.uid ?? '', name: phoneNumber));
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle failed phone number verification
        // Notify listeners to update UI accordingly
        notifyListeners();
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
        // Notify listeners if needed
        notifyListeners();
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
        // Notify listeners if needed
        notifyListeners();
      },
    );
  }

  // Add any other relevant methods to manipulate the user state
}
