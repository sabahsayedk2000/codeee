import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _PortalScaffold(
      title: 'Deled Portal (Admin)',
      points: [
        'Manage training sessions & assignments',
        'Manage schools and trainers',
        'View attendance and reports',
      ],
    );
  }
}

class _PortalScaffold extends StatelessWidget {
  const _PortalScaffold({required this.title, required this.points});

  final String title;
  final List<String> points;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: points.map((point) => ListTile(title: Text(point))).toList(),
      ),
    );
  }
}
