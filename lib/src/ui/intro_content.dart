import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroContent extends StatelessWidget {
  final PageViewModel page;

  const IntroContent({Key key, @required this.page}) : super(key: key);

  Widget _buildWidget(Widget widget, String text, TextStyle style) {
    return widget ?? Text(text, style: style, textAlign: TextAlign.center);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 24.0),
          _buildWidget(
            page.titleWidget,
            page.title,
            page.decoration.titleTextStyle,
          ),
          const SizedBox(height: 24.0),
          _buildWidget(
            page.bodyWidget,
            page.body,
            page.decoration.bodyTextStyle,
          ),
          if (page.footer != null) const SizedBox(height: 24.0),
          if (page.footer != null) page.footer,
        ],
      ),
    );
  }
}
