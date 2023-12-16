import 'package:flutter/material.dart';
import 'package:flutter_firebase_template_app/models/tennis_match.dart';
import 'package:flutter_firebase_template_app/services/database_service.dart';

class TennisMatchProvider with ChangeNotifier {
  List<TennisMatch> _matches = [];
  final DatabaseService _databaseService = DatabaseService();

  List<TennisMatch> get matches => _matches;

  // Function to fetch matches for the user
  void fetchMatches(String userId) {
    _databaseService.getMatches(userId).listen((matchData) {
      _matches = matchData;
      notifyListeners();
    });
  }

  // Additional methods for match creation and updating scores
}
