import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as imglib;
import 'package:master_piece_puzzle/widget/BottomSplitImage.dart';
import 'package:master_piece_puzzle/widget/SplitImage.dart';

class Util {
  List<Image> splitList = [];

  /// 단순 이미지 가져오기
  static Image loadImage(String img) {
    return Image(
      fit: BoxFit.cover,
      image: AssetImage('images/$img.jpg'),
    );
  }

  /// 분할된 이미지 widget 가져오기
  Future<List<SplitImage>> loadSplitImageWidget(String img, [int widthCnt = 3, int heightCnt = 3]) async {
    if (splitList.isEmpty) {
      splitList = await loadSplitImage(img, widthCnt, heightCnt);
    }
    List<SplitImage> resultList = [];

    for (int i = 0; i < heightCnt; i++) {
      for (int j = 0; j < widthCnt; j++) {
        resultList.add(SplitImage(
          image: splitList[heightCnt * i + j],
          imageNumber: heightCnt * i + j,
        ));
      }
    }
    return resultList;
  }

  /// 분할된 [바닥]이미지 widget 가져오기
  Future<List<BottomSplitImage>> loadBottomSplitImageWidget(String img, [int widthCnt = 3, int heightCnt = 3]) async {
    if (splitList.isEmpty) {
      splitList = await loadSplitImage(img, widthCnt, heightCnt);
    }
    List<BottomSplitImage> resultList = [];

    for (int i = 0; i < heightCnt; i++) {
      for (int j = 0; j < widthCnt; j++) {
        resultList.add(BottomSplitImage(
          image: splitList[heightCnt * i + j],
          imageNumber: heightCnt * i + j,
        ));
      }
    }
    return resultList;
  }

  /// 분할된 이미지 가져오기
  Future<List<Image>> loadSplitImage(String img, [int widthCnt = 3, int heightCnt = 3]) async {
    var loadData = await rootBundle.load('images/$img.jpg');

    return splitImage(loadData.buffer.asUint8List(), widthCnt, heightCnt);
  }

  /// 이미지 분할 메소드
  List<Image> splitImage(List<int> input, [int widthCnt = 3, int heightCnt = 3]) {
    // convert image to image from image package
    imglib.Image image = imglib.decodeImage(input) as imglib.Image;

    int x = 0, y = 0;
    int width = (image.width / widthCnt).round();
    int height = (image.height / heightCnt).round();

    // split image to parts
    List<imglib.Image> parts = <imglib.Image>[];
    for (int i = 0; i < widthCnt; i++) {
      for (int j = 0; j < heightCnt; j++) {
        parts.add(imglib.copyCrop(image, x, y, width, height));
        x += width;
      }
      x = 0;
      y += height;
    }

    // convert image from image package to Image Widget to display
    List<Image> output = <Image>[];
    for (var img in parts) {
      output.add(Image.memory(imglib.encodeJpg(img) as Uint8List));
    }
    // output.shuffle();

    return output;
  }
}
