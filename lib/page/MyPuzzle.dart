import 'package:flutter/material.dart';
import 'package:master_piece_puzzle/common/CommUtil.dart';
import 'package:master_piece_puzzle/common/widget/ImageCard.dart';
import 'package:master_piece_puzzle/common/wrapper/WrapScaffold.dart';
import 'package:master_piece_puzzle/data/ImageData.dart';

class MyPuzzle extends StatefulWidget {
  const MyPuzzle({Key? key}) : super(key: key);

  @override
  State<MyPuzzle> createState() => _MyPuzzleState();
}

class _MyPuzzleState extends State<MyPuzzle> {
  List<String> correctedList = [];
  List<ImageObject> imgList = [];

  @override
  void initState() {
    super.initState();
    getCorrectedList();
  }

  void getCorrectedList() async {
    correctedList = await CommUtil.getSharedData('correctPuzzleList') ?? [];
    for (String imgName in correctedList) {
      imgList.add(ImageObject(imgResourceName: imgName, imgDisplayName: imgName));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WrapScaffold(
      isBottomBannerAds: true,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: imgList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1 / 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext ctx, int index) {
            return ImageCard(
              imageObject: imgList[index],
            );
          },
        ),
      ),
    );
  }
}
