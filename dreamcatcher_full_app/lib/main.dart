
import 'package:flutter/material.dart';
import 'screens/journal_screen.dart';

void main() {
  runApp(DreamCatcherApp());
}

class DreamCatcherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DreamCatcher',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: JournalScreen(),
    );
  }
}
