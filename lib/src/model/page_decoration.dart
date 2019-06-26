import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_web/material.dart';

class PageDecoration {
  /// Background page color
  final Color pageColor;

  /// Dots decorator to custom dots color, size and spacing
  final DotsDecorator dotsDecorator;

  /// TextStyle for title
  ///
  /// @Default style `fontSize: 20.0, fontWeight: FontWeight.bold`
  final TextStyle titleTextStyle;

  /// TextStyle for title
  ///
  /// @Default style `fontSize: 18.0, fontWeight: FontWeight.normal`
  final TextStyle bodyTextStyle;

  /// BoxDecoration for page
  final BoxDecoration boxDecoration;

  /// Flex ratio of the image
  final int imageFlex;

  /// Flex ratio of the body
  final int bodyFlex;

  const PageDecoration({
    this.pageColor,
    this.dotsDecorator = const DotsDecorator(),
    this.titleTextStyle = const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    this.bodyTextStyle = const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.normal,
    ),
    this.boxDecoration,
    this.imageFlex = 1,
    this.bodyFlex = 1,
  }) : assert(pageColor == null || boxDecoration == null,
            'Cannot provide both a Color and a BoxDecoration\n');
}
