import 'package:flutter/material.dart';

class IntroButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final Color? color;
  final ButtonStyle? style;

  const IntroButton({
    Key? key,
    this.onPressed,
    this.child,
    this.color,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child ?? const SizedBox(),
      style: style?.merge(TextButton.styleFrom(primary: color))
          ?? TextButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
    );
  }
}
