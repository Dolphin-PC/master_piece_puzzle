class ImageData {
  List<ImageObject> imageObjectList = [];
}

class ImageObject {
  static String path = "images/";
  static String imageExt = "jpg";

  late String imgResourceName;
  late String imgDisplayName;

  ImageObject({required this.imgResourceName, required this.imgDisplayName});
}
