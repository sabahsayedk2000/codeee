import 'package:flutter/material.dart';

class TrainerDashboardScreen extends StatelessWidget {
  const TrainerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trainer Portal')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Assigned schools'),
            Text('Daily attendance and absent student entries'),
            Text('Session photos and daily remarks'),
          ],
        ),
      ),
    );
  }
}
