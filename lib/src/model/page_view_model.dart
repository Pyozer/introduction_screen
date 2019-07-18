import 'package:flutter/material.dart';
import 'package:introduction_screen/src/model/page_decoration.dart';

class PageViewModel {
  /// Title of page
  final String title;

  /// Title of page
  final Widget titleWidget;

  /// Text of page (description)
  final String body;

  /// Widget content of page (description)
  final Widget bodyWidget;

  /// Image of page
  /// Tips: Wrap your image with an alignment widget like Align or Center
  final Widget image;

  /// Footer widget, you can add a button for example
  final Widget footer;

  /// Page decoration
  /// Contain all page customizations, like page color, text styles
  final PageDecoration decoration;

  PageViewModel({
    this.title,
    this.titleWidget,
    this.body,
    this.bodyWidget,
    this.image,
    this.footer,
    this.decoration = const PageDecoration(),
  })  : assert(
          title != null || titleWidget != null,
          "You must provide either title (String) or titleWidget (Widget).",
        ),
        assert(
          (title == null) != (titleWidget == null),
          "You can not provide both title and titleWidget.",
        ),
        assert(
          body != null || bodyWidget != null,
          "You must provide either body (String) or bodyWidget (Widget).",
        ),
        assert(
          (body == null) != (bodyWidget == null),
          "You can not provide both body and bodyWidget.",
        );
}
