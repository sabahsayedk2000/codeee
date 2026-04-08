import 'package:flutter/material.dart';

class WalkroDashboardScreen extends StatelessWidget {
  const WalkroDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Walkro Portal')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('District and school monitoring'),
            Text('Attendance statistics dashboard'),
            Text('Exportable reports'),
          ],
        ),
      ),
    );
  }
}
