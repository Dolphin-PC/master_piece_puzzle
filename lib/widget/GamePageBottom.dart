import 'package:flutter/material.dart';
import 'package:master_piece_puzzle/provider/SplitImageProvider.dart';
import 'package:provider/provider.dart';

class GamePageBottom extends StatefulWidget {
  const GamePageBottom({Key? key}) : super(key: key);

  @override
  State<GamePageBottom> createState() => _GamePageBottomState();
}

class _GamePageBottomState extends State<GamePageBottom> {
  late SplitImageProvider splitImageProvider;

  @override
  Widget build(BuildContext context) {
    splitImageProvider = Provider.of<SplitImageProvider>(context, listen: true);

    return splitImageProvider.gameStatus == GameStatus.loading
        ? Container()
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: splitImageProvider.bottomImgList,
            ),
          );
  }
}
