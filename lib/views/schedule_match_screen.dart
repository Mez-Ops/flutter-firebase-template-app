import 'package:flutter/material.dart';
import 'package:flutter_firebase_template_app/models/app_user_test_data.dart';

class ScheduleMatchScreen extends StatelessWidget {
  const ScheduleMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final users = appUserData;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Match'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(user.name[0]),
            ),
            title: Text(user.name),
            subtitle: Text(user.email),
            trailing: Text('Rating: ${user.tennisRating}'),
            onTap: () {
              // Handle user selection
              debugPrint('Selected user: ${user.name}');
            },
          );
        },
      ),
    );
  }
}
