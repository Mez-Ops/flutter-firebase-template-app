import 'package:flutter/material.dart';
import 'package:flutter_firebase_template_app/models/app_user.dart';
import 'package:flutter_firebase_template_app/services/auth_service.dart';

class AppUserProvider with ChangeNotifier {
  AppUser? _user;
  final AuthService _authService = AuthService();

  AppUser? get user => _user;

  // Example function to sign in and update user state
  Future<void> signIn(String email, String password) async {
    final firebaseUser = await _authService.signIn(email, password);
    if (firebaseUser == null) return;
    _user = AppUser.fromFirebaseUser(firebaseUser, 0.0);
    notifyListeners();
  }

  // Additional methods for sign-up, sign-out, and user data management
}
