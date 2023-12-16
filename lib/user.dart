import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;

  User({required this.id, required this.name});

  // Factory method to create a User from a Firestore document.
  factory User.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return User(
      id: doc.id,
      name: data['name'] ?? '',
    );
  }

  // Method to convert User object to JSON for Firestore.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
