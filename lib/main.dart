import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:master_piece_puzzle/page/GamePage.dart';
import 'package:master_piece_puzzle/provider/SplitImageProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplitImageProvider()),
      ],
      child: MaterialApp(
        title: 'MasterPiece Puzzle',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const GamePage(imgName: 'cat'),
      ),
    );
  }
}
