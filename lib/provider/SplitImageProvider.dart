import 'package:flutter/material.dart';
import 'package:master_piece_puzzle/common/CommUtil.dart';
import 'package:master_piece_puzzle/data/ImageData.dart';
import 'package:master_piece_puzzle/util/util.dart';
import 'package:master_piece_puzzle/widget/BottomSplitImage.dart';
import 'package:master_piece_puzzle/widget/SplitImage.dart';

enum GameStatus { loading, ready, correct }

class SplitImageProvider extends ChangeNotifier {
  late ImageObject imageObject = ImageObject(imgDisplayName: 'Bacchantin1862', imgResourceName: 'Bacchantin1862');

  GameStatus gameStatus = GameStatus.loading;

  List<SplitImage> imgList = [];
  List<BottomSplitImage> bottomImgList = [];

  bool isSelected = false;
  bool isAllCorrect = false;
  int seletedNumber = -1;
  late int level;

  /// 게임 초기화
  void initGame(int lvl) async {
    level = lvl;
    gameStatus = GameStatus.loading;
    Util util = Util();
    isAllCorrect = false;
    imgList = await util.loadSplitImageWidget(imageObject.imgResourceName, level, level);
    bottomImgList = await util.loadBottomSplitImageWidget(imageObject.imgResourceName, level, level);
    bottomImgList.shuffle();

    gameStatus = GameStatus.ready;
    notifyListeners();
  }

  /// 상단 퍼즐 선택 이벤트
  void onPuzzleClickFn(int imageNumber) {
    isSelected = true;
    if (seletedNumber != -1) {
      imgList[seletedNumber].isClicked = false;
    }
    imgList[imageNumber].isClicked = true;
    seletedNumber = imageNumber;

    notifyListeners();
  }

  /// 하단 정답 퍼즐 선택 이벤트
  void onBottomClickFn(int imageNumber) {
    if (!isSelected) return;

    if (seletedNumber == imageNumber) {
      imgList[seletedNumber].isCorrect = true;
      isSelected = false;
      seletedNumber = -1;

      bottomImgList.firstWhere((bottomImg) => bottomImg.imageNumber == imageNumber).isCorrect = true;

      onAllCorrectFn();
      notifyListeners();
    }
  }

  /// 퍼즐 새로고침
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

  /// 퍼즐 정답 시, 이벤트
  void onAllCorrectFn() {
    if (imgList.every((element) => element.isCorrect == true)) {
      gameStatus = GameStatus.correct;
      CommUtil.addSharedData('correctPuzzleList', imageObject.imgResourceName);
    }
  }

  /// SET 게임 상태
  void setGameStatus(GameStatus status) {
    gameStatus = status;
    notifyListeners();
  }

  /// test용 정답
  void test_AllCorrectFn() {
    for (var img in imgList) {
      img.isCorrect = true;
    }
    onAllCorrectFn();
    notifyListeners();
  }
}
