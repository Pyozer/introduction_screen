import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroContent extends StatelessWidget {
  const IntroContent({Key key, @required this.page}) : super(key: key);

  final PageViewModel page;

  Widget _buildWidget(Widget widget, String text, TextStyle style) {
    return widget ?? Text(text, style: style, textAlign: TextAlign.center);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: page.decoration.descriptionPadding,
          child: _buildWidget(
            page.bodyWidget,
            page.body,
            page.decoration.bodyTextStyle,
          ),
        ),
        Padding(
          padding: page.decoration.titlePadding,
          child: _buildWidget(
            page.titleWidget,
            page.title,
            page.decoration.titleTextStyle,
          ),
        ),
        if (page.footer != null)
          Padding(
            padding: page.decoration.footerPadding,
            child: page.footer,
          ),
      ],
    );
  }
}
