import 'package:flutter/material.dart';

class IntroButton extends StatelessWidget {
  const IntroButton({Key key, this.onPressed, @required this.child})
      : super(key: key);

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: child,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      minWidth: 300,
    );
  }
}
