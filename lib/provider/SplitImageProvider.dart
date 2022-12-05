import 'package:flutter/material.dart';
import 'package:master_piece_puzzle/main.dart';
import 'package:master_piece_puzzle/widget/BottomSplitImage.dart';
import 'package:master_piece_puzzle/widget/SplitImage.dart';

class SplitImageProvider extends ChangeNotifier {
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

    logger.d(imageNumber);

    notifyListeners();
  }

  void onBottomClickFn(int imageNumber) {
    if (!isSelected) return;

    if (seletedNumber == imageNumber) {
      imgList[seletedNumber].isCorrect = true;
      isSelected = false;
      seletedNumber = -1;

      bottomImgList.removeWhere(
          (BottomSplitImage bottomImg) => bottomImg.imageNumber == imageNumber);
      notifyListeners();
    }
  }
}
