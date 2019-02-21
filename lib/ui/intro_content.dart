import 'package:flutter/material.dart';

class IntroContent extends StatelessWidget {
  final String title;
  final String body;
  final Widget footer;
  final TextStyle titleStyle;
  final TextStyle bodyStyle;

  const IntroContent(
      {Key key,
      @required this.title,
      this.body,
      this.footer,
      this.titleStyle,
      this.bodyStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> footerWidgets = [];
    if (footer != null)
      footerWidgets.addAll([const SizedBox(height: 24.0), footer]);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 24.0),
          Text(title, style: titleStyle, textAlign: TextAlign.center),
          const SizedBox(height: 24.0),
          Text(body, style: bodyStyle, textAlign: TextAlign.center),
        ]..addAll(footerWidgets),
      ),
    );
  }
}
