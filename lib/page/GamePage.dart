import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:master_piece_puzzle/Common/CommUtil.dart';
import 'package:master_piece_puzzle/Common/Wrapper/WrapScaffold.dart';
import 'package:master_piece_puzzle/common/widget/CustomDialog.dart';
import 'package:master_piece_puzzle/provider/SplitImageProvider.dart';
import 'package:master_piece_puzzle/widget/GamePageBottom.dart';
import 'package:provider/provider.dart';

import '../util/util.dart';

class GamePage extends StatefulWidget {
  static const routeName = '/game';

  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Util util = Util();
  late SplitImageProvider splitImageProvider;

  @override
  void initState() {
    super.initState();

    CommUtil.execAfterOnlyBinding(() {
      splitImageProvider.setGameStatus(GameStatus.loading);
      selectDialog();
    });
  }

  /// 레벨 선택 창
  void selectDialog() {
    List<int> lvlList = [3, 4, 5, 6];
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        List<Widget> btnList = [];
        for (int lvl in lvlList) {
          btnList.add(
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
              child: ElevatedButton(
                child: Text('lvl $lvl'),
                onPressed: () {
                  splitImageProvider.initGame(lvl);
                  Navigator.pop(context);
                },
              ),
            ),
          );
        }

        return CustomDialog(
          context: context,
          title: '난이도 선택',
          msgWidget: Row(
            children: btnList,
          ),
          fn: () => Navigator.pop(context),
          btnList: {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    splitImageProvider = Provider.of<SplitImageProvider>(context, listen: true);

    Widget getWidgetByGameStatus() {
      switch (splitImageProvider.gameStatus) {
        case GameStatus.loading:
          return Util.loadImage(splitImageProvider.imageObject.imgResourceName);
        case GameStatus.ready:
          return GridView.builder(
            itemCount: splitImageProvider.level * splitImageProvider.level,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: splitImageProvider.level,
              childAspectRatio: 1 / 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext ctx, int index) {
              return splitImageProvider.imgList[index];
            },
          );
        case GameStatus.correct:
          return splitImageProvider.imageObject.getImageWidget();
      }
    }

    return WrapScaffold(
      title: Text(splitImageProvider.imageObject.imgDisplayName),
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
              child: getWidgetByGameStatus(),
            ),
          ),
          kReleaseMode
              ? Container()
              : ElevatedButton(
                  onPressed: splitImageProvider.test_AllCorrectFn,
                  child: const Text('test_완료처리'),
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
