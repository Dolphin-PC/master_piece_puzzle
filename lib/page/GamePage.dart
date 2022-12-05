import 'package:flutter/material.dart';
import 'package:master_piece_puzzle/provider/SplitImageProvider.dart';
import 'package:master_piece_puzzle/widget/BottomSplitImage.dart';
import 'package:master_piece_puzzle/widget/GamePageBottom.dart';
import 'package:master_piece_puzzle/widget/SplitImage.dart';
import 'package:master_piece_puzzle/widget/WrapScaffold.dart';
import 'package:provider/provider.dart';

import '../util/util.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key, required this.imgName}) : super(key: key);

  final String imgName;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Util util = Util();
  late SplitImageProvider splitImageProvider;

  List<SplitImage> imgList = [];
  List<BottomSplitImage> bottomImgList = [];

  Future<List<SplitImage>> loadSplitImg() async {
    // await Future.delayed(const Duration(seconds: 1));
    imgList = await util.loadSplitImageWidget(widget.imgName, 3, 3);
    splitImageProvider.imgList = imgList;
    await getBottomSplitImg();
    return imgList;
  }

  Future<void> getBottomSplitImg() async {
    bottomImgList = await util.loadBottomSplitImageWidget(widget.imgName, 3, 3);
    splitImageProvider.bottomImgList = bottomImgList;
    bottomImgList.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    splitImageProvider =
        Provider.of<SplitImageProvider>(context, listen: false);

    return WrapScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                future: loadSplitImg(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData == false) {
                    return util.loadImage(widget.imgName);
                  } else {
                    return GridView.builder(
                      itemCount: 9,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1 / 1,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (BuildContext ctx, int index) {
                        return imgList[index];
                      },
                    );
                  }
                },
              ),
            ),
          ),
          const Flexible(
            flex: 1,
            child: GamePageBottom(),
          )
        ],
      ),
    );
  }
}
