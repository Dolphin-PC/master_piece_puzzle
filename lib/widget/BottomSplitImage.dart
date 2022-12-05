import 'package:flutter/material.dart';
import 'package:master_piece_puzzle/provider/SplitImageProvider.dart';
import 'package:provider/provider.dart';

class BottomSplitImage extends StatefulWidget {
  final Image image;
  final int imageNumber;
  const BottomSplitImage(
      {Key? key, required this.image, required this.imageNumber})
      : super(key: key);

  @override
  State<BottomSplitImage> createState() => _BottomSplitImageState();
}

class _BottomSplitImageState extends State<BottomSplitImage> {
  late SplitImageProvider splitImageProvider;
  @override
  void initState() {
    super.initState();
  }

  void onBottomClickFn() {
    splitImageProvider.onBottomClickFn(widget.imageNumber);
  }

  @override
  Widget build(BuildContext context) {
    splitImageProvider = Provider.of<SplitImageProvider>(context, listen: true);
    return InkWell(
      onTap: onBottomClickFn,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            image: widget.image.image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
