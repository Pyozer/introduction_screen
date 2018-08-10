import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  final Color bgColor;
  final Widget image;
  final Widget content;

  const IntroPage({Key key, this.image, @required this.content, this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      padding: const EdgeInsets.all(32.0),
      child: SafeArea(
          child: Column(children: [
        Expanded(child: image ?? Container(), flex: 1),
        Expanded(child: content, flex: 1),
      ])),
    );
  }
}
