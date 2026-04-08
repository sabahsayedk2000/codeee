import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0A5ADB)),
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFF6F8FC),
    );
  }
}
