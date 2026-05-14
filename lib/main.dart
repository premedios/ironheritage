import 'package:flutter/material.dart';
import 'navigation/app_shell.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iron Heritage',
      theme: AppTheme.lightTheme,
      home: const AppShell(),
    );
  }
}
