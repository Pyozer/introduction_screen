import 'package:flutter/material.dart';

class IntroButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;

  const IntroButton({Key key, this.onPressed, @required this.child, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: child,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    );
  }
}
