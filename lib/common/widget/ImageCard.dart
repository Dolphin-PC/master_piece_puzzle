import 'package:flutter/material.dart';
import 'package:master_piece_puzzle/data/ImageData.dart';
import 'package:master_piece_puzzle/provider/SplitImageProvider.dart';
import 'package:master_piece_puzzle/util/util.dart';
import 'package:provider/provider.dart';

class ImageCard extends StatefulWidget {
  final ImageObject imageObject;
  final Function? afterFn;

  const ImageCard({Key? key, required this.imageObject, this.afterFn}) : super(key: key);

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    SplitImageProvider splitImageProvider = Provider.of<SplitImageProvider>(context, listen: false);
    return InkWell(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 8,
              fit: FlexFit.tight,
              child: Util.loadImage(widget.imageObject.imgResourceName),
            ),
            Flexible(
              child: Text(
                widget.imageObject.imgDisplayName,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        splitImageProvider.imageObject = widget.imageObject;
        Navigator.pushNamed(context, '/game').then(
          (value) {
            if (widget.afterFn != null) widget.afterFn!();
          },
        );
      },
    );
  }
}
