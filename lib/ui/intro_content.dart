import 'package:flutter/material.dart';

class IntroContent extends StatelessWidget {
  final String title;
  final String body;
  final TextStyle titleStyle;
  final TextStyle bodyStyle;

  const IntroContent(
      {Key key,
      @required this.title,
      this.body,
      this.titleStyle,
      this.bodyStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        const SizedBox(height: 24.0),
        Text(title, style: titleStyle, textAlign: TextAlign.center),
        const SizedBox(height: 24.0),
        Text(body, style: bodyStyle, textAlign: TextAlign.center)
      ],
    );
  }
}
