import 'package:flutter/material.dart';
import 'package:introduction_screen/src/helper.dart';

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

  /// Background image of a page.
  /// Spans all over the screen.
  ///
  /// Tips: can be used alone or as a background image together with the "image" parameter.
  final String? backgroundImage;

  /// Background image widget of a page.
  /// Spans all over the screen.
  ///
  /// Tips: can be used alone or as a background image together with the "image" parameter. Use this instead of backgroundImage for more flexibility
  final Widget? backgroundImageWidget;

  /// Footer widget, you can add a button for example
  final Widget? footer;

  /// Page decoration
  /// Contain all page customizations, like page color, text styles
  final PageDecoration decoration;

  /// If widget Order is reverse - body before image
  final bool reverse;

  /// Wrap content in scrollView
  final bool useScrollView;

  /// Keyboard dismiss behavious for scrollView
  final ScrollViewKeyboardDismissBehavior scrollViewKeyboardDismissBehavior;

  /// Use Row instead of Column when in landscape to place image next to the content.
  final bool useRowInLandscape;

  PageViewModel({
    this.title,
    this.titleWidget,
    this.body,
    this.bodyWidget,
    this.image,
    this.backgroundImage,
    this.backgroundImageWidget,
    this.footer,
    this.reverse = false,
    this.decoration = const PageDecoration(),
    this.useScrollView = true,
    this.scrollViewKeyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
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
        ),
        assert(
            backgroundImage == null ||
                isBackgroundImageAssetPathValid(backgroundImage),
            "You must provide a valid image asset path"),
        assert(
          backgroundImageWidget == null || backgroundImage == null,
          "You can not provide both backgroundImage and backgroundImageWidget.",
        );
}
