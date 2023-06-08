library introduction_screen;

import 'dart:async';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter/material.dart';
import '/src/helper.dart';
import '/src/model/page_view_model.dart';
import '/src/model/position.dart';
import '/src/ui/intro_button.dart';
import '/src/ui/intro_page.dart';

bool defaultCanProgressFunction(int page) {
  return true;
}

class IntroductionScreen extends StatefulWidget {
  /// All pages of the onboarding
  final List<PageViewModel>? pages;

  /// All pages of the onboarding, as a complete widget instead of a PageViewModel
  final List<Widget>? rawPages;

  /// Callback when Done button is pressed
  final VoidCallback? onDone;

  /// Callback when Skip button is pressed
  final VoidCallback? onSkip;

  /// Callback when page change
  final ValueChanged<int>? onChange;

  /// Done button child for the pre-made TextButton
  final Widget? done;

  /// Override pre-made done button.
  /// You can what you want (button, text, image, ...)
  final Widget? overrideDone;

  /// Skip button child for the pre-made TextButton
  final Widget? skip;

  /// Override pre-made skip button.
  /// You can what you want (button, text, image, ...)
  final Widget? overrideSkip;

  /// Next button child for the pre-made TextButton
  final Widget? next;

  /// Override pre-made next button.
  /// You can what you want (button, text, image, ...)
  final Widget? overrideNext;

  /// Back button child for the pre-made TextButton
  final Widget? back;

  /// Override pre-made back button.
  /// You can what you want (button, text, image, ...)
  final Widget? overrideBack;

  /// Is the Skip button should be display
  ///
  /// @Default `false`
  final bool showSkipButton;

  /// Is the Next button should be display
  ///
  /// @Default `true`
  final bool showNextButton;

  /// If the 'Done' button should be rendered at all the end
  ///
  /// @Default `true`
  final bool showDoneButton;

  /// Show the bottom part of the page, that's include skip, next, done buttons
  /// as well as dotsDecorator.
  ///
  /// @Default `true`
  final bool showBottomPart;

  /// If the bottom part of the page should be displayed when the keyboard is opened
  ///
  /// @Default `false`
  final bool hideBottomOnKeyboard;

  /// If the Back button should be display
  ///
  /// @Default `false`
  final bool showBackButton;

  /// If a custom Widget should be used instead of the default progress indicator
  ///
  /// @Default `null`
  final Widget? customProgress;

  /// If the progress indicator should be display
  ///
  /// @Default `true`
  final bool isProgress;

  /// Enable or not onTap feature on progress indicator
  ///
  /// @Default `true`
  final bool isProgressTap;

  /// If the user is allow to change page
  ///
  /// @Default `false`
  final bool freeze;

  /// Global background color (only visible when a page has a transparent background color)
  final Color? globalBackgroundColor;

  /// Dots decorator to custom dots color, size and spacing
  final DotsDecorator dotsDecorator;

  /// Decorator to customize the appearance of the progress dots container.
  /// This is useful when the background image is full screen.
  final Decoration? dotsContainerDecorator;

  /// Animation duration in milliseconds
  ///
  /// @Default `350`
  final int animationDuration;

  /// Auto scroll duration in milliseconds
  ///
  /// @Default `null`
  ///
  /// @Note `null` means no auto scroll
  ///
  /// Once the value of `autoScrollDuration` is set, auto scroll will be activated and it will scroll to the next page automatically after the specified duration.
  final int? autoScrollDuration;

  /// Defines if the autoScroll should be infinite, returning to the first page after it reaches the last one.
  ///
  /// @Default `false`
  ///
  /// it can only be `true` if `autoScrollDuration` is not `null`
  final bool infiniteAutoScroll;

  /// Index of the initial page
  ///
  /// @Default `0`
  final int initialPage;

  /// Flex ratio of the skip or back button
  ///
  /// @Default `1`
  final int skipOrBackFlex;

  /// Flex ratio of the progress indicator
  ///
  /// @Default `1`
  final int dotsFlex;

  /// Flex ratio of the next/done button
  ///
  /// @Default `1`
  final int nextFlex;

  /// Type of animation between pages
  ///
  /// @Default `Curves.easeIn`
  final Curve curve;

  /// Base style for all buttons
  final ButtonStyle? baseBtnStyle;

  /// Done button style
  final ButtonStyle? doneStyle;

  /// Skip button style
  final ButtonStyle? skipStyle;

  /// Next button style
  final ButtonStyle? nextStyle;

  /// Back button style
  final ButtonStyle? backStyle;

  /// Done button semantic label
  final String? doneSemantic;

  /// Skip button semantic label
  final String? skipSemantic;

  /// Next button semantic label
  final String? nextSemantic;

  /// Back button semantic label
  final String? backSemantic;

  /// Enable or disable content resizing for bottom inset (e.g. keyboard)
  ///
  /// @Default `true`
  final bool resizeToAvoidBottomInset;

  /// Controls position
  ///
  /// @Default `Position(left: 0, right: 0, bottom: 0)`
  final Position controlsPosition;

  /// Margin for controls
  ///
  /// @Default `EdgeInsets.zero`
  final EdgeInsets controlsMargin;

  /// Margin for controls
  ///
  /// @Default `EdgeInsets.zero`
  final EdgeInsets bodyPadding;

  /// Padding for controls
  ///
  /// @Default `EdgeInsets.all(16.0)`
  final EdgeInsets controlsPadding;

  /// A header widget to be shown on every screen
  final Widget? globalHeader;

  /// A footer widget to be shown on every screen
  final Widget? globalFooter;

  /// ScrollController of vertical SingleChildScrollView for every single page
  final List<ScrollController?>? scrollControllers;

  /// Scroll/Axis direction of pages, can he horizontal or vertical
  ///
  /// @Default `Axis.horizontal`
  final Axis pagesAxis;

  /// PageView scroll physics (only when freeze is set to false)
  ///
  /// @Default `BouncingScrollPhysics()`
  final ScrollPhysics scrollPhysics;

  /// If is right to left behaviour
  ///
  /// @Default `false`
  final bool rtl;

  /// Corresponds to PageView's parameter of the same name.
  /// More details can be found
  /// [here](https://api.flutter.dev/flutter/widgets/PageView/PageView.html).
  ///
  /// @Default `false`
  final bool allowImplicitScrolling;

  /// PageView's bool safe area list.
  /// the list defines if the safe area will be active on left, right, top and bottom, respectively.
  ///
  /// @Default `[false,false,false,false]`
  final List<bool> safeAreaList;

  /// A handler to check if the user is allowed to progress to the next page.
  /// If returned value is true, the page will progress to the next page, otherwise the page will not progress.
  /// In order to make it work properly with TextFormField, you should place setState in the onChanged callback of the TextFormField.
  ///
  /// @Default `true`
  /// ```dart
  /// canProgress: (page) {
  ///     int _currentPage = page.round();
  ///     if (_currentPage == 0 && _textFieldController1.text.isEmpty) {
  ///       return false;
  ///     } else if (_currentPage == 1 && _textFieldController2.text.isEmpty) {
  ///       return false;
  ///     } else {
  ///       return true;
  ///    }
  /// }
  /// ```
  final Function canProgress;

  IntroductionScreen(
      {Key? key,
      this.pages,
      this.rawPages,
      this.onDone,
      this.onSkip,
      this.onChange,
      this.done,
      this.overrideDone,
      this.skip,
      this.overrideSkip,
      this.next,
      this.overrideNext,
      this.back,
      this.overrideBack,
      this.showSkipButton = false,
      this.showNextButton = true,
      this.showDoneButton = true,
      this.showBottomPart = true,
      this.showBackButton = false,
      this.customProgress,
      this.isProgress = true,
      this.hideBottomOnKeyboard = false,
      this.isProgressTap = true,
      this.freeze = false,
      this.globalBackgroundColor,
      this.dotsDecorator = const DotsDecorator(),
      this.dotsContainerDecorator,
      this.animationDuration = 350,
      this.autoScrollDuration,
      this.infiniteAutoScroll = false,
      this.initialPage = 0,
      this.skipOrBackFlex = 1,
      this.dotsFlex = 1,
      this.nextFlex = 1,
      this.curve = Curves.easeIn,
      this.baseBtnStyle,
      this.skipStyle,
      this.nextStyle,
      this.doneStyle,
      this.backStyle,
      this.skipSemantic,
      this.nextSemantic,
      this.doneSemantic,
      this.backSemantic,
      this.resizeToAvoidBottomInset = true,
      this.controlsPosition = const Position(left: 0, right: 0, bottom: 0),
      this.controlsMargin = EdgeInsets.zero,
      this.controlsPadding = const EdgeInsets.all(16.0),
      this.bodyPadding = EdgeInsets.zero,
      this.globalHeader,
      this.globalFooter,
      this.scrollControllers,
      this.pagesAxis = Axis.horizontal,
      this.scrollPhysics = const BouncingScrollPhysics(),
      this.rtl = false,
      this.allowImplicitScrolling = false,
      this.canProgress = defaultCanProgressFunction,
      this.safeAreaList = const [false, false, false, false]})
      : assert(
          pages != null || rawPages != null,
          "You must set either 'pages' or 'rawPages' parameter",
        ),
        assert(
          (pages?.length ?? rawPages?.length ?? 0) > 0,
          "You must provide at least one page using 'pages' or 'rawPages' parameter !",
        ),
        assert(
          !showDoneButton || done != null || overrideDone != null,
          "You must set 'done' or 'overrideDone' parameter, or set 'showDoneButton' to false",
        ),
        assert(
          done == null || onDone != null,
          "If you set 'done' parameter, you must also set 'onDone' parameter",
        ),
        assert(
          !showSkipButton || skip != null || overrideSkip != null,
          "You must set 'skip' or 'overrideSkip' parameter, or set 'showSkipButton' to false",
        ),
        assert(
          !showNextButton || next != null || overrideNext != null,
          "You must set 'next' or 'overrideNext' parameter, or set 'showNextButton' to false",
        ),
        assert(
          !showBackButton || back != null || overrideBack != null,
          "You must set 'back' or 'overrideBack' parameter, or set 'showBackButton' to false",
        ),
        assert(
          !(showBackButton && showSkipButton),
          "You cannot set 'showBackButton' and 'showSkipButton' to true. Only one, or both false.",
        ),
        assert(
          skipOrBackFlex >= 0 && dotsFlex >= 0 && nextFlex >= 0,
          'Flex parameters must be >= 0',
        ),
        assert(
          initialPage >= 0,
          'Initial page parameter must by a positive number, >= 0.',
        ),
        assert(
          hideBottomOnKeyboard == isProgress || !hideBottomOnKeyboard,
          'hideBottomOnKeyboard can only be true if isProgress = true',
        ),
        assert(
          customProgress != null && isProgress || customProgress == null,
          'customProgress can only be used if isProgress = true',
        ),
        assert(
          (infiniteAutoScroll && autoScrollDuration != null) ||
              !infiniteAutoScroll,
          'infiniteAutoScroll can only be true if autoScrollDuration != null',
        ),
        super(key: key);

  @override
  IntroductionScreenState createState() => IntroductionScreenState();
}

class IntroductionScreenState extends State<IntroductionScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  bool _isSkipPressed = false;
  bool _isScrolling = false;
  late bool _showBottom;
  StreamSubscription<bool>? keyboardSubscription;

  PageController get controller => _pageController;

  @override
  void initState() {
    super.initState();
    final int initialPage = min(widget.initialPage, getPagesLength() - 1);
    _pageController = PageController(initialPage: initialPage);
    _showBottom = widget.showBottomPart;
    _currentPage = initialPage;
    _autoScroll(widget.autoScrollDuration);
    if (widget.hideBottomOnKeyboard) {
      final keyboardVisibilityController = KeyboardVisibilityController();
      keyboardSubscription =
          keyboardVisibilityController.onChange.listen((bool visible) {
        setState(() {
          _showBottom = !visible;
        });
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    if (keyboardSubscription != null) {
      keyboardSubscription!.cancel();
    }
    super.dispose();
  }

  int getPagesLength() {
    return (widget.pages ?? widget.rawPages!).length;
  }

  Future<void> _autoScroll(int? _durationInt) async {
    if (_durationInt != null) {
      final Duration _autoscrollDuration = Duration(milliseconds: _durationInt);
      final _animationDuration =
          Duration(milliseconds: widget.animationDuration);
      final int pagesLenght = widget.pages!.length - 1;
      if (widget.infiniteAutoScroll) {
        while (true) {
          if (!mounted) {
            break;
          }
          await _movePage(
            _autoscrollDuration,
            _animationDuration,
            _currentPage < pagesLenght,
          );
        }
      } else {
        while (_currentPage < pagesLenght) {
          if (!mounted) {
            break;
          }
          await _movePage(
            _autoscrollDuration,
            _animationDuration,
            true,
          );
        }
      }
    }
  }

  Future<void> _movePage(Duration autoscrollDuration,
      Duration animationDuration, bool forward) async {
    await Future.delayed(autoscrollDuration);
    if (!_isSkipPressed && !_isScrolling) {
      if (forward) {
        await _pageController.nextPage(
          duration: animationDuration,
          curve: widget.curve,
        );
      } else {
        await _pageController.animateToPage(
          0,
          duration: animationDuration,
          curve: widget.curve,
        );
      }
    }
  }

  void next() =>
      {animateScroll(_currentPage + 1), FocusScope.of(context).unfocus()};

  void previous() =>
      {animateScroll(_currentPage - 1), FocusScope.of(context).unfocus()};

  Future<void> _onSkip() async {
    if (widget.onSkip != null) {
      widget.onSkip!();
    } else {
      await skipToEnd();
    }
  }

  Future<void> skipToEnd() async {
    setState(() => _isSkipPressed = true);
    await animateScroll(getPagesLength() - 1);
    if (mounted) {
      setState(() => _isSkipPressed = false);
    }
  }

  Future<void> animateScroll(int page) async {
    bool isValidToProgress = widget.canProgress(_currentPage);
    if (isValidToProgress) {
      _isScrolling = true;
      await _pageController.animateToPage(
        max(min(page, getPagesLength() - 1), 0),
        duration: Duration(milliseconds: widget.animationDuration),
        curve: widget.curve,
      );
      if (mounted) {
        _isScrolling = false;
      }
    }
  }

  bool _onScroll(ScrollNotification notification) {
    final metrics = notification.metrics;
    if (metrics is PageMetrics && metrics.page != null) {
      if (mounted) {
        setState(() => _currentPage = metrics.page!.round());
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = (_currentPage == getPagesLength() - 1);

    Widget? leftBtn;
    if (widget.showSkipButton) {
      leftBtn = Visibility(
        visible: !isLastPage && !_isSkipPressed,
        maintainState: true,
        // Needs to be true to maintain animation
        maintainAnimation: true,
        // Needs to be true to maintain size
        maintainSize: true,
        child: widget.overrideSkip ??
            IntroButton(
              child: widget.skip!,
              style: widget.baseBtnStyle?.merge(widget.skipStyle) ??
                  widget.skipStyle,
              semanticLabel: widget.skipSemantic,
              onPressed: _onSkip,
            ),
      );
    } else if (widget.showBackButton && _currentPage.round() > 0) {
      leftBtn = widget.overrideBack ??
          IntroButton(
            child: widget.back!,
            style: widget.baseBtnStyle?.merge(widget.backStyle) ??
                widget.backStyle,
            semanticLabel: widget.backSemantic,
            onPressed: !_isScrolling ? previous : null,
          );
    }

    Widget? rightBtn;
    if (isLastPage && widget.showDoneButton) {
      rightBtn = widget.overrideDone ??
          IntroButton(
            child: widget.done!,
            style: widget.baseBtnStyle?.merge(widget.doneStyle) ??
                widget.doneStyle,
            semanticLabel: widget.doneSemantic,
            onPressed: !_isScrolling ? widget.onDone : null,
          );
    } else if (!isLastPage && widget.showNextButton) {
      rightBtn = widget.overrideNext ??
          IntroButton(
            child: widget.next!,
            style: widget.baseBtnStyle?.merge(widget.nextStyle) ??
                widget.nextStyle,
            semanticLabel: widget.nextSemantic,
            onPressed: !_isScrolling ? next : null,
          );
    }

    return SafeArea(
      left: widget.safeAreaList[0],
      right: widget.safeAreaList[1],
      top: widget.safeAreaList[2],
      bottom: widget.safeAreaList[3],
      child: Scaffold(
        backgroundColor: widget.globalBackgroundColor,
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        body: Stack(
          children: [
            Positioned.fill(
              top: widget.bodyPadding.top,
              left: widget.bodyPadding.left,
              right: widget.bodyPadding.right,
              bottom: widget.bodyPadding.bottom,
              child: NotificationListener<ScrollNotification>(
                onNotification: _onScroll,
                child: PageView(
                  reverse: widget.rtl,
                  scrollDirection: widget.pagesAxis,
                  controller: _pageController,
                  onPageChanged: widget.onChange,
                  allowImplicitScrolling: widget.allowImplicitScrolling,
                  physics: widget.freeze
                      ? const NeverScrollableScrollPhysics()
                      : !widget.canProgress(_currentPage)
                          ? const NeverScrollableScrollPhysics()
                          : widget.scrollPhysics,
                  children: widget.pages
                          ?.mapIndexed(
                            (index, page) => IntroPage(
                              page: page,
                              scrollController:
                                  (CustomList(widget.scrollControllers)
                                      ?.elementAtOrNull(index)),
                            ),
                          )
                          .toList() ??
                      widget.rawPages!,
                ),
              ),
            ),
            if (widget.globalHeader != null)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: widget.globalHeader!,
              ),
            if (_showBottom)
              Positioned(
                left: widget.controlsPosition.left,
                top: widget.controlsPosition.top,
                right: widget.controlsPosition.right,
                bottom: widget.controlsPosition.bottom,
                child: Column(
                  children: [
                    Container(
                      padding: widget.controlsPadding,
                      margin: widget.controlsMargin,
                      decoration: widget.dotsContainerDecorator,
                      child: Row(
                        children: [
                          Expanded(
                            flex: widget.skipOrBackFlex,
                            child: leftBtn ?? const SizedBox(),
                          ),
                          Expanded(
                            flex: widget.dotsFlex,
                            child: Center(
                              child: widget.isProgress
                                  ? widget.customProgress ??
                                      Semantics(
                                        label:
                                            "Page ${_currentPage.round() + 1} of ${getPagesLength()}",
                                        excludeSemantics: true,
                                        child: DotsIndicator(
                                          reversed: widget.rtl,
                                          dotsCount: getPagesLength(),
                                          position: _currentPage,
                                          decorator: widget.dotsDecorator,
                                          onTap: widget.isProgressTap &&
                                                  !widget.freeze
                                              ? (pos) =>
                                                  animateScroll(pos.toInt())
                                              : null,
                                        ),
                                      )
                                  : const SizedBox(),
                            ),
                          ),
                          Expanded(
                            flex: widget.nextFlex,
                            child: rightBtn ?? const SizedBox(),
                          ),
                        ].asReversed(widget.rtl),
                      ),
                    ),
                    if (widget.globalFooter != null) widget.globalFooter!
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
