import 'package:flutter/material.dart';
import 'package:flutter_firebase_template_app/views/schedule_match_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Firebase Template App'),
      ),
      body: const Center(
        child: Text(
          'Hello, world!',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ScheduleMatchScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
