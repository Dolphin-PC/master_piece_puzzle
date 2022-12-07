import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:master_piece_puzzle/page/GamePage.dart';
import 'package:master_piece_puzzle/page/NavPage.dart';
import 'package:master_piece_puzzle/provider/SplitImageProvider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    MobileAds.instance.initialize();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplitImageProvider()),
      ],
      child: MaterialApp(
        title: 'MasterPiece Puzzle',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.indigo),
        initialRoute: '/',
        routes: {
          NavPage.routeName: (context) => const NavPage(),
          GamePage.routeName: (context) => const GamePage(),
        },
        // home: const GamePage(imgName: 'cat'),
      ),
    );
  }
}
