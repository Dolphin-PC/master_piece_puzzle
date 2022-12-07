import 'package:flutter/material.dart';
import 'package:master_piece_puzzle/common/widget/CustomDialog.dart';

class WrapScaffold extends StatefulWidget {
  late final Widget? _title;
  late final List<Widget>? actions;

  late final Widget body;

  late final bool isFloating;
  late final bool isBottom;

  WrapScaffold(
      {Key? key,
      Widget? title,
      required this.body,
      this.actions,
      this.isFloating = false,
      this.isBottom = false})
      : super(key: key) {
    title == null ? _title = const Text('명화 퍼즐') : _title = title;
  }

  @override
  State<WrapScaffold> createState() => _WrapScaffoldState();
}

class _WrapScaffoldState extends State<WrapScaffold> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: widget._title,
          actions: widget.actions ?? [],
        ),
        body: widget.body,
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
        bottomNavigationBar: widget.isBottom
            ? BottomNavigationBar(
                items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: 'HOME'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.settings), label: 'SETTING'),
                  ],
                currentIndex: _selectedIndex,
                onTap: (int index) {
                  setState(() => _selectedIndex = index);
                })
            : null);
  }
}
