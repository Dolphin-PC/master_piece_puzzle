import 'package:flutter/material.dart';
import 'package:master_piece_puzzle/widget/WrapScaffold.dart';

import '../util/util.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key, required this.imgName}) : super(key: key);

  final String imgName;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Util util = Util();
  List<Image> imgList = [];

  Future<List<Widget>> loadSplitImg() async {
    // await Future.delayed(const Duration(seconds: 1));
    return await util.loadSplitImageWidget(widget.imgName, 3, 3);
  }

  @override
  Widget build(BuildContext context) {
    return WrapScaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: loadSplitImg(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData == false) {
                return util.loadImage(widget.imgName);
              } else {
                List<Widget> list = snapshot.data;
                return GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1 / 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext ctx, int index) {
                    return list[index];
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
