import 'package:flutter/material.dart';
import 'package:master_piece_puzzle/provider/SplitImageProvider.dart';
import 'package:provider/provider.dart';

class SplitImage extends StatefulWidget {
  final Image image;
  final int imageNumber;
  bool isCorrect = false;
  bool isClicked = false;

  SplitImage({Key? key, required this.image, required this.imageNumber})
      : super(key: key);

  @override
  State<SplitImage> createState() => _SplitImageState();
}

class _SplitImageState extends State<SplitImage> {
  late SplitImageProvider splitImageProvider;

  @override
  void initState() {
    super.initState();
  }

  void onClickFn() {
    splitImageProvider.onPuzzleClickFn(widget.imageNumber);
  }

  dynamic cardStatus(String key) {
    Map<String, dynamic> cardObj = {
      'color': Colors.white,
    };

    if (!widget.isCorrect && widget.isClicked) {
      cardObj['color'] = Colors.indigo;
    }

    return cardObj[key];
  }

  @override
  Widget build(BuildContext context) {
    splitImageProvider = Provider.of<SplitImageProvider>(context, listen: true);
    return InkWell(
      onTap: onClickFn,
      child: Card(
        color: cardStatus('color'),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.isCorrect
              ? Image(
                  image: widget.image.image,
                  fit: BoxFit.fill,
                )
              : Center(
                  child: Text(
                    widget.imageNumber.toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
        ),
      ),
    );
  }
}
