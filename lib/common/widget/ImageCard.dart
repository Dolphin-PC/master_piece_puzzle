import 'package:flutter/material.dart';
import 'package:master_piece_puzzle/data/ImageData.dart';
import 'package:master_piece_puzzle/util/util.dart';

class ImageCard extends StatefulWidget {
  final ImageObject imageObject;

  const ImageCard({Key? key, required this.imageObject}) : super(key: key);

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Util.loadImage(widget.imageObject.imgResourceName),
    );
  }
}
