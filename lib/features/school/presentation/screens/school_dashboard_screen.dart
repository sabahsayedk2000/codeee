import 'package:flutter/material.dart';

class SchoolDashboardScreen extends StatelessWidget {
  const SchoolDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('School Portal')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Trainer visits and attendance overview'),
            Text('Absentee list, session photos, and remarks'),
            Text('Session completion and attendance %'),
          ],
        ),
      ),
    );
  }
}
