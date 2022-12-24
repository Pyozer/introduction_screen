import 'package:flutter/material.dart';

class IntroButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final String? semanticLabel;

  const IntroButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.style,
    this.semanticLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Semantics(
        label: semanticLabel,
        button: true,
        child: TextButton(
          onPressed: onPressed,
          child: child,
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ).merge(style),
        ),
      ),
    );
  }
}
