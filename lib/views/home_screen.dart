import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use Provider to access MatchProvider and display matches

    return Scaffold(
      appBar: AppBar(title: const Text('Tennis Match Scheduler')),
      body: const Center(
          // Display list of matches
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to MatchScheduleScreen
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
