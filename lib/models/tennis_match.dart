class TennisMatch {
  final String id;
  final List<String> players;
  final DateTime scheduledTime;
  String? score;

  TennisMatch(
      {required this.id,
      required this.players,
      required this.scheduledTime,
      this.score});

  // Add methods for serialization and deserialization from Firebase
  factory TennisMatch.fromFirestore(Map<String, dynamic> firestoreData) {
    return TennisMatch(
      id: firestoreData['id'],
      players: firestoreData['players'],
      scheduledTime: firestoreData['scheduledTime'],
      score: firestoreData['score'],
    );
  }
}
