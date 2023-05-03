import 'package:flutter/material.dart';
import '/src/model/page_decoration.dart';

class PageViewModel {
  /// Title of page
  final String? title;

  /// Title of page
  final Widget? titleWidget;

  /// Text of page (description)
  final String? body;

  /// Widget content of page (description)
  final Widget? bodyWidget;

  /// Image of page
  /// Tips: Wrap your image with an alignment widget like Align or Center
  final Widget? image;

  /// Footer widget, you can add a button for example
  final Widget? footer;

  /// Page decoration
  /// Contain all page customizations, like page color, text styles
  final PageDecoration decoration;

  /// If widget Order is reverse - body before image
  final bool reverse;

  /// Wrap content in scrollView
  final bool useScrollView;

  /// Use Row instead of Column when in landscape to place image next to the content.
  final bool useRowInLandscape;

  PageViewModel({
    this.title,
    this.titleWidget,
    this.body,
    this.bodyWidget,
    this.image,
    this.footer,
    this.reverse = false,
    this.decoration = const PageDecoration(),
    this.useScrollView = true,
    this.useRowInLandscape = false,
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
