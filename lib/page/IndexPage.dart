import 'package:flutter/material.dart';
import 'package:master_piece_puzzle/common/wrapper/WrapScaffold.dart';

class IndexPage extends StatefulWidget {
  static const routeName = '/';

  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return WrapScaffold(
      isBottomBannerAds: true,
      body: Center(
        child: ElevatedButton(
          child: Text('START'),
          onPressed: () {},
        ),
      ),
    );
  }
}
