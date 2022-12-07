import 'package:flutter/material.dart';
import 'package:master_piece_puzzle/widget/BottomSplitImage.dart';
import 'package:master_piece_puzzle/widget/SplitImage.dart';

class SplitImageProvider extends ChangeNotifier {
  String imgName = "";

  List<SplitImage> imgList = [];
  List<BottomSplitImage> bottomImgList = [];

  bool isSelected = false;
  int seletedNumber = -1;

  void onPuzzleClickFn(int imageNumber) {
    isSelected = true;
    if (seletedNumber != -1) {
      imgList[seletedNumber].isClicked = false;
    }
    imgList[imageNumber].isClicked = true;
    seletedNumber = imageNumber;

    // logger.d(imageNumber);

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
    // imgList.setAll(index, iterable)
  }
}
