import 'package:flutter/material.dart';
import 'package:master_piece_puzzle/common/CommUtil.dart';
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
  late List<ImageObject> imgList = [];

  @override
  void initState() {
    super.initState();
    CommUtil.getDataFromJson("data").then((list) {
      for (var obj in list) {
        imgList.add(ImageObject(imgResourceName: obj['imgResourceName'], imgDisplayName: obj['imgDisplayName']));
      }
      initSharedData();
    });
  }

  void initSharedData() async {
    List<String> correctList = await CommUtil.getSharedData<List<String>>('correctPuzzleList') ?? [];

    imgList.removeWhere((img) => correctList.contains(img.imgResourceName));
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
              afterFn: () => initSharedData(),
            );
          },
        ),
      ),
    );
  }
}
