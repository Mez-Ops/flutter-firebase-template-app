import 'package:firebase_auth/firebase_auth.dart' as auth;

class AppUser {
  final String id;
  final String name;
  final String email;
  final double tennisRating;

  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.tennisRating,
  });

  factory AppUser.fromFirebaseUser(auth.User user, double tennisRating) {
    return AppUser(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      tennisRating: tennisRating,
    );
  }

  // Add any additional methods or properties if needed
}
