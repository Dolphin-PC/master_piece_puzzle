import 'package:flutter/material.dart';

class WrapScaffold extends StatelessWidget {
  late final Widget? _title;
  late final List<Widget>? _actions;
  late final Widget _body;

  WrapScaffold(
      {Key? key, Widget? title, List<Widget>? actions, required Widget body})
      : super(key: key) {
    title == null ? _title = const Text('명화 퍼즐') : _title = title;
    _actions = actions;
    _body = body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title,
        actions: _actions ?? [],
      ),
      body: _body,
    );
  }
}
