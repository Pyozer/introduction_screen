import 'package:material_ui/material_ui.dart';

class IntroButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final String? semanticLabel;

  const IntroButton({
    super.key,
    required this.child,
    this.onPressed,
    this.style,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    final defaultStyle = TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    );

    return MergeSemantics(
      child: Semantics(
        label: semanticLabel,
        button: true,
        child: TextButton(
          onPressed: onPressed,
          style: style?.merge(defaultStyle) ?? defaultStyle,
          child: child,
        ),
      ),
    );
  }
}
