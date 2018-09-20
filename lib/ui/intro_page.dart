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
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(child: image ?? const SizedBox.shrink()),
          Expanded(child: content),
        ],
      ),
    );
  }
}
