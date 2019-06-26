import 'package:flutter_web/material.dart';
import 'package:introduction_screen/src/model/page_decoration.dart';

class PageViewModel {
  /// Title of page
  final String title;

  /// Text of page (description)
  final String body;

  /// Image of page
  /// Tips: Wrap your image with an alignment widget like Align or Center
  final Widget image;

  /// Footer widget, you can add a button for example
  final Widget footer;

  /// Page decoration
  /// Contain all page customizations, like page color, text styles
  final PageDecoration decoration;

  PageViewModel(
    this.title,
    this.body, {
    this.image,
    this.footer,
    this.decoration = const PageDecoration(),
  })  : assert(title != null, "You can not provide a null title text"),
        assert(body != null, "You can not provide a null body text");
}
