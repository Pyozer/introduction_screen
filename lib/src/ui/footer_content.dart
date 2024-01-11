import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class FooterContent extends StatelessWidget {
  final PageViewModel page;
  final bool isFullScreen;

  const FooterContent({
    super.key,
    required this.page,
    this.isFullScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: page.decoration.contentMargin,
      decoration: isFullScreen
          ? page.decoration.boxDecoration ??
              BoxDecoration(
                color: page.decoration.pageColor,
                borderRadius: BorderRadius.circular(8.0),
              )
          : null,
      child: Padding(
        padding: page.decoration.footerPadding,
        child: page.footer,
      ),
    );
  }
}
