import 'package:flutter/material.dart';
import 'game_screen.dart';

/// Entry point of the 8 Puzzle Game application
void main() {
  runApp(const PuzzleApp());
}

/// Root widget of the application
class PuzzleApp extends StatelessWidget {
  const PuzzleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '8 Puzzle Game',
      theme: ThemeData(
        // Use a blue color scheme
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const GameScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
