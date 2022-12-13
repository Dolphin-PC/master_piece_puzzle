import 'package:flutter/material.dart';

class MyPuzzle extends StatefulWidget {
  const MyPuzzle({Key? key}) : super(key: key);

  @override
  State<MyPuzzle> createState() => _MyPuzzleState();
}

class _MyPuzzleState extends State<MyPuzzle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('My Puzzle'),
    );
  }
}
