import 'package:flutter/material.dart';
import 'package:master_piece_puzzle/common/wrapper/WrapScaffold.dart';
import 'package:master_piece_puzzle/page/IndexPage.dart';

class NavPage extends StatefulWidget {
  static const routeName = '/';

  final int? initIndex;
  const NavPage({Key? key, this.initIndex = 0}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _currentIndex = 0;

  final screens = [
    const IndexPage(),
    const Text('fjdsklf'),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initIndex!;
  }

  @override
  Widget build(BuildContext context) {
    return WrapScaffold(
      isAppBar: false,
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}