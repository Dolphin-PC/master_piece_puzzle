import 'package:flutter/material.dart';
import 'package:master_piece_puzzle/Ads/BannerAds.dart';
import 'package:master_piece_puzzle/common/widget/CustomDialog.dart';

class WrapScaffold extends StatefulWidget {
  late final bool isAppBar;
  late final Widget? _title;
  final List<Widget>? actions;

  late final Widget body;

  late final bool isFloating;
  late final bool isBottomBannerAds;
  final BottomNavigationBar? bottomNavigationBar;

  WrapScaffold(
      {Key? key,
      this.isAppBar = true,
      Widget? title,
      required this.body,
      this.actions,
      this.isFloating = false,
      this.isBottomBannerAds = false,
      this.bottomNavigationBar})
      : super(key: key) {
    title == null ? _title = const Text('명화 퍼즐') : _title = title;
  }

  @override
  State<WrapScaffold> createState() => _WrapScaffoldState();
}

class _WrapScaffoldState extends State<WrapScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.isAppBar
            ? AppBar(
                title: widget._title,
                actions: widget.actions ?? [],
              )
            : null,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: widget.body,
            ),
            widget.isBottomBannerAds ? const BannerAds() : Container()
          ],
        ),
        floatingActionButton: widget.isFloating
            ? FloatingActionButton(
                child: const Icon(Icons.question_mark),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return CustomDialog(
                        context: context,
                        title: '개인정보처리방침',
                        msg: '',
                        msgWidget: Text('rodls'),
                        fn: () {},
                        btnList: {'닫기': () => Navigator.pop(context)},
                      );
                    },
                  );
                },
              )
            : null,
        bottomNavigationBar: widget.bottomNavigationBar);
  }
}
