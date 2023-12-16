import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_template_app/models/app_user.dart';
import 'package:flutter_firebase_template_app/models/tennis_match.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add or update user in Firestore
  Future<void> saveUser(AppUser user) async {
    await _db.collection('users').doc(user.id).set({
      'name': user.name,
      'email': user.email,
      'tennisRating': user.tennisRating,
    });
  }

  // Add a new match
  Future<void> addMatch(TennisMatch match) async {
    await _db.collection('matches').add({
      'players': match.players,
      'scheduledTime': match.scheduledTime,
      'score': match.score,
    });
  }

  // Update match score
  Future<void> updateMatchScore(String matchId, String score) async {
    await _db.collection('matches').doc(matchId).update({'score': score});
  }

  // Fetch matches for a user
  Stream<List<TennisMatch>> getMatches(String userId) {
    return _db
        .collection('matches')
        .where('players', arrayContains: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => TennisMatch.fromFirestore(doc.data()))
            .toList());
  }

  // ... Additional methods for serializing and deserializing data
  // Add serialization and deserialization methods for AppUser and Match
}
