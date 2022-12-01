import 'package:flutter/material.dart';
import 'package:master_piece_puzzle/page/GamePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MasterPiece Puzzle',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const GamePage(imgName: 'cat'),
    );
  }
}
