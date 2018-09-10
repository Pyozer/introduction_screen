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
      child: OrientationBuilder(
        builder: (context, orientation) {
          final isVertical = orientation == Orientation.portrait;

          return SafeArea(
            child: Column(
              children: [
                Expanded(child: image ?? Container(), flex: isVertical ? 5 : 4),
                Expanded(child: content, flex: isVertical ? 5 : 6),
              ],
            ),
          );
        },
      ),
    );
  }
}
