import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:master_piece_puzzle/provider/SplitImageProvider.dart';
import 'package:master_piece_puzzle/widget/GamePageBottom.dart';
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

  @override
  void initState() {
    super.initState();

    Util.execAfterOnlyBinding(() {
      loadSplitImg();
    });
  }

  Future<void> loadSplitImg() async {
    // await Future.delayed(const Duration(seconds: 1));
    splitImageProvider.imgList =
        await util.loadSplitImageWidget(widget.imgName, 3, 3);

    await getBottomSplitImg();
  }

  Future<void> getBottomSplitImg() async {
    splitImageProvider.bottomImgList =
        await util.loadBottomSplitImageWidget(widget.imgName, 3, 3);
    splitImageProvider.bottomImgList.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    splitImageProvider = Provider.of<SplitImageProvider>(context, listen: true);

    return WrapScaffold(
      actions: [
        IconButton(
          onPressed: splitImageProvider.onRefreshPuzzle,
          icon: const Icon(Icons.refresh),
        )
      ],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: splitImageProvider.imgList.isEmpty
                  ? Text('loading...')
                  : GridView.builder(
                      itemCount: 9,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1 / 1,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (BuildContext ctx, int index) {
                        return splitImageProvider.imgList[index];
                      },
                    ),
            ),
          ),
          const Flexible(
            flex: 1,
            child: GamePageBottom(),
          ),
        ],
      ),
    );
  }
}
