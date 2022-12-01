import 'package:flutter/material.dart';

class SplitImage extends StatefulWidget {
  final Image image;
  final int imageNumber;

  const SplitImage({Key? key, required this.image, required this.imageNumber})
      : super(key: key);

  @override
  State<SplitImage> createState() => _SplitImageState();
}

class _SplitImageState extends State<SplitImage> {
  bool isCorrect = false;
  bool isClicked = false;

  void onClickFn() {
    if (isCorrect) return;

    setState(() {
      isClicked = !isClicked;
    });
    // print(widget.imageNumber);
    // widget.image.width
  }

  dynamic cardStatus(String key) {
    Map<String, dynamic> CardObj = {
      'color': Colors.white,
    };

    if (!isCorrect && isClicked) {
      CardObj['color'] = Colors.indigo;
    }

    return CardObj[key];
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClickFn,
      child: Card(
        color: cardStatus('color'),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: isCorrect
              ? Image(
                  image: widget.image.image,
                  fit: BoxFit.fill,
                )
              : Center(
                  child: Container(
                    child: Text(
                      widget.imageNumber.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
