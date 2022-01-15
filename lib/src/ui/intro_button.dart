import 'package:flutter/material.dart';

class IntroButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final ButtonStyle? style;

  const IntroButton({
    Key? key,
    this.onPressed,
    this.child,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child ?? const SizedBox(),
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ).merge(style),
    );
  }
}
