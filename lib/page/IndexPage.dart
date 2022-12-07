import 'package:flutter/material.dart';
import 'package:master_piece_puzzle/common/wrapper/WrapScaffold.dart';

import '../Ads/BannerAds.dart';

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
      isBottom: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Container(),
          ),
          Flexible(
            flex: 8,
            child: Container(
              child: Center(
                child: ElevatedButton(
                  child: Text('START'),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: BannerAds(),
          ),
        ],
      ),
    );
  }
}
