import 'package:flutter/src/widgets/image.dart';
import 'package:master_piece_puzzle/util/util.dart';

class ImageData {
  List<ImageObject> imageObjectList = [];
}

class ImageObject {
  static String path = "images/";
  static String imageExt = "jpg";

  late String imgResourceName;
  late String imgDisplayName;
  bool isCorrect = false;

  ImageObject({required this.imgResourceName, required this.imgDisplayName});

  Image getImageWidget() {
    return Util.loadImage(imgResourceName);
  }
}
