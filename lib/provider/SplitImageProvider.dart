import 'package:flutter/material.dart';
import 'package:master_piece_puzzle/data/ImageData.dart';
import 'package:master_piece_puzzle/util/util.dart';
import 'package:master_piece_puzzle/widget/BottomSplitImage.dart';
import 'package:master_piece_puzzle/widget/SplitImage.dart';

enum GameStatus { loading, ready, correct }

class SplitImageProvider extends ChangeNotifier {
  late ImageObject imageObject =
      ImageObject(imgDisplayName: 'cat', imgResourceName: 'cat');

  GameStatus gameStatus = GameStatus.loading;

  List<SplitImage> imgList = [];
  List<BottomSplitImage> bottomImgList = [];

  bool isSelected = false;
  bool isAllCorrect = false;
  int seletedNumber = -1;

  void initGame() async {
    gameStatus = GameStatus.loading;
    Util util = Util();
    isAllCorrect = false;
    imgList =
        await util.loadSplitImageWidget(imageObject.imgResourceName, 3, 3);
    bottomImgList = await util.loadBottomSplitImageWidget(
        imageObject.imgResourceName, 3, 3);
    bottomImgList.shuffle();

    gameStatus = GameStatus.ready;
    notifyListeners();
  }

  void onPuzzleClickFn(int imageNumber) {
    isSelected = true;
    if (seletedNumber != -1) {
      imgList[seletedNumber].isClicked = false;
    }
    imgList[imageNumber].isClicked = true;
    seletedNumber = imageNumber;

    notifyListeners();
  }

  void onBottomClickFn(int imageNumber) {
    if (!isSelected) return;

    if (seletedNumber == imageNumber) {
      imgList[seletedNumber].isCorrect = true;
      isSelected = false;
      seletedNumber = -1;

      bottomImgList
          .firstWhere((bottomImg) => bottomImg.imageNumber == imageNumber)
          .isCorrect = true;

      onAllCorrectFn();
      notifyListeners();
    }
  }

  void onRefreshPuzzle() {
    for (SplitImage img in imgList) {
      img.isCorrect = false;
      img.isClicked = false;
    }
    for (BottomSplitImage img in bottomImgList) {
      img.isCorrect = false;
    }
    notifyListeners();
  }

  void onAllCorrectFn() {
    if (imgList.every((element) => element.isCorrect == true)) {
      gameStatus = GameStatus.correct;
    }
  }
}
