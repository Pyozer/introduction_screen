import 'package:flutter/material.dart';

class PageDecoration {
  /// Background page color
  final Color? pageColor;

  /// TextStyle for title
  ///
  /// @Default style `fontSize: 20.0, fontWeight: FontWeight.bold`
  final TextStyle titleTextStyle;

  /// TextStyle for title
  ///
  /// @Default style `fontSize: 18.0, fontWeight: FontWeight.normal`
  final TextStyle bodyTextStyle;

  /// BoxDecoration for page
  final BoxDecoration? boxDecoration;

  /// Flex ratio of the image
  final int imageFlex;

  /// Flex ratio of the body
  final int bodyFlex;

  /// Flex ratio of the footer
  final int footerFlex;

  /// FlexFit of the footer
  final FlexFit footerFit;

  /// Padding of image
  ///
  /// @Default `EdgeInsets.only(bottom: 24.0)`
  final EdgeInsets imagePadding;

  /// Margin of content (title + description + footer)
  ///
  /// @Default `EdgeInsets.all(16.0)`
  final EdgeInsets contentMargin;

  /// Padding of title
  ///
  /// @Default `EdgeInsets.only(top: 16.0, bottom: 24.0)`
  final EdgeInsets titlePadding;

  /// Padding of body
  final EdgeInsets? bodyPadding;

  /// Padding of footer
  ///
  /// @Default `EdgeInsets.symmetric(vertical: 24.0)`
  final EdgeInsets footerPadding;

  /// Body alignment
  ///
  /// @Default `Alignment.topCenter`
  final Alignment bodyAlignment;

  /// Image alignment
  ///
  /// @Default `Alignment.bottomCenter`
  final Alignment imageAlignment;

  /// Layout the page using the full screen with the image behind the text.
  ///
  /// @Default: `false`
  final bool fullScreen;

  /// Safe area of the content. Change to avoid the overlap between the dots and the content
  ///
  /// @Default 60
  final double safeArea;

  const PageDecoration({
    this.pageColor,
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
    this.footerFlex = 1,
    this.footerFit = FlexFit.loose,
    this.imagePadding = const EdgeInsets.only(bottom: 24.0),
    this.contentMargin = const EdgeInsets.all(16.0),
    this.titlePadding = const EdgeInsets.only(top: 16.0, bottom: 24.0),
    this.bodyPadding,
    this.footerPadding = const EdgeInsets.symmetric(vertical: 24.0),
    this.bodyAlignment = Alignment.topCenter,
    this.imageAlignment = Alignment.bottomCenter,
    this.fullScreen = false,
    this.safeArea = 60,
  }) : assert(pageColor == null || boxDecoration == null,
            'Cannot provide both a Color and a BoxDecoration\n');

  PageDecoration copyWith({
    Color? pageColor,
    TextStyle? titleTextStyle,
    TextStyle? bodyTextStyle,
    BoxDecoration? boxDecoration,
    int? imageFlex,
    int? bodyFlex,
    int? footerFlex,
    FlexFit? footerFit,
    EdgeInsets? imagePadding,
    EdgeInsets? contentMargin,
    EdgeInsets? titlePadding,
    EdgeInsets? descriptionPadding,
    EdgeInsets? footerPadding,
    Alignment? bodyAlignment,
    Alignment? imageAlignment,
    bool? fullScreen,
    double? safeArea,
  }) {
    assert(
      pageColor == null || boxDecoration == null,
      'Cannot provide both a Color and a BoxDecoration\n',
    );

    return PageDecoration(
      pageColor: pageColor ?? this.pageColor,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      bodyTextStyle: bodyTextStyle ?? this.bodyTextStyle,
      boxDecoration: boxDecoration ?? this.boxDecoration,
      imageFlex: imageFlex ?? this.imageFlex,
      bodyFlex: bodyFlex ?? this.bodyFlex,
      footerFlex: footerFlex ?? this.footerFlex,
      footerFit: footerFit ?? this.footerFit,
      imagePadding: imagePadding ?? this.imagePadding,
      contentMargin: contentMargin ?? this.contentMargin,
      titlePadding: titlePadding ?? this.titlePadding,
      bodyPadding: descriptionPadding ?? this.bodyPadding,
      footerPadding: footerPadding ?? this.footerPadding,
      bodyAlignment: bodyAlignment ?? this.bodyAlignment,
      imageAlignment: imageAlignment ?? this.imageAlignment,
      fullScreen: fullScreen ?? this.fullScreen,
      safeArea: safeArea ?? this.safeArea,
    );
  }
}
