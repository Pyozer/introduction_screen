import 'package:flutter/material.dart';

class IntroButton extends StatelessWidget {
  static const TextStyle style = const TextStyle(fontWeight: FontWeight.w700);

  final VoidCallback onPressed;
  final String text;

  const IntroButton({Key key, this.onPressed, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: onPressed,
        child: Text(text.toUpperCase(),
            style: style, textAlign: TextAlign.center));
  }
}
