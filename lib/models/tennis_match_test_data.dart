// tennis_match_test_data.dart
import 'package:flutter_firebase_template_app/models/tennis_match.dart';

final List<TennisMatch> tennisMatchData = [
  TennisMatch(
    id: '1',
    players: ['1', '2'],
    scheduledTime: DateTime(2023, 12, 20, 14),
  ),
  TennisMatch(
    id: '2',
    players: ['1', '2'],
    scheduledTime: DateTime(2023, 12, 22, 12),
  ),
  // ...
];
