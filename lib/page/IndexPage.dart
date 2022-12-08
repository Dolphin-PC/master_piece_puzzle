import 'package:flutter/material.dart';
import 'package:master_piece_puzzle/common/CommUtil.dart';
import 'package:master_piece_puzzle/common/Logger.dart';
import 'package:master_piece_puzzle/common/widget/ImageCard.dart';
import 'package:master_piece_puzzle/common/wrapper/WrapScaffold.dart';
import 'package:master_piece_puzzle/data/ImageData.dart';

class IndexPage extends StatefulWidget {
  static const routeName = '/';

  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  ImageObject _imageObject =
      ImageObject(imgResourceName: 'cat', imgDisplayName: 'cat');

  @override
  void initState() {
    super.initState();
    CommUtil.getDataFromJson().then((res) {
      logger.d(res[0]['imgResourceName']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WrapScaffold(
      isBottomBannerAds: true,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1 / 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext ctx, int index) {
            return ImageCard(
              imageObject: _imageObject,
            );
          },
        ),
      ),
    );
  }
}
