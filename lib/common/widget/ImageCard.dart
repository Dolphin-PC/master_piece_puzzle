import 'package:flutter/material.dart';
import 'package:master_piece_puzzle/data/ImageData.dart';
import 'package:master_piece_puzzle/provider/SplitImageProvider.dart';
import 'package:master_piece_puzzle/util/util.dart';
import 'package:provider/provider.dart';

class ImageCard extends StatefulWidget {
  final ImageObject imageObject;

  const ImageCard({Key? key, required this.imageObject}) : super(key: key);

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    SplitImageProvider splitImageProvider = Provider.of<SplitImageProvider>(context, listen:false);
    return InkWell(
      child: Card(
        child: Util.loadImage(widget.imageObject.imgResourceName)
      ),
      onTap: () {
        splitImageProvider.imageObject = widget.imageObject;
        Navigator.pushNamed(context, '/game');
      },
    );
  }
}
