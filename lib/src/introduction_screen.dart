library introduction_screen;

import 'dart:math';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/src/model/page_view_model.dart';
import 'package:introduction_screen/src/ui/intro_button.dart';
import 'package:introduction_screen/src/ui/intro_page.dart';

class IntroductionScreen extends StatefulWidget {
  /// All pages of the onboarding
  final List<PageViewModel>? pages;

  /// All pages of the onboarding, as a complete widget instead of a PageViewModel
  final List<Widget>? rawPages;

  /// Callback when Done button is pressed
  final VoidCallback? onDone;

  /// Done button
  final Widget? done;

  /// Callback when Skip button is pressed
  final VoidCallback? onSkip;

  /// Callback when page change
  final ValueChanged<int>? onChange;

  /// Skip button
  final Widget? skip;

  /// Next button
  final Widget? next;

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

  /// Is the progress indicator should be display
  ///
  /// @Default `true`
  final bool isProgress;

  /// Enable or not onTap feature on progress indicator
  ///
  /// @Default `true`
  final bool isProgressTap;

  /// Is the user is allow to change page
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

  /// Animation duration in millisecondes
  ///
  /// @Default `350`
  final int animationDuration;

  /// Index of the initial page
  ///
  /// @Default `0`
  final int initialPage;

  /// Flex ratio of the skip button
  ///
  /// @Default `1`
  final int skipFlex;

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

  /// Color of buttons
  final Color? color;

  /// Color of skip button
  final Color? skipColor;

  /// Color of next button
  final Color? nextColor;

  /// Color of done button
  final Color? doneColor;

  /// Enable or disabled top SafeArea
  ///
  /// @Default `false`
  final bool isTopSafeArea;

  /// Enable or disabled bottom SafeArea
  ///
  /// @Default `false`
  final bool isBottomSafeArea;

  /// Margin for controls
  ///
  /// @Default `EdgeInsets.zero`
  final EdgeInsets controlsMargin;

  /// Padding for controls
  ///
  /// @Default `EdgeInsets.all(16.0)`
  final EdgeInsets controlsPadding;

  /// A header widget to be shown on every screen
  final Widget? globalHeader;

  /// A footer widget to be shown on every screen
  final Widget? globalFooter;

  /// ScrollController of vertical SingleChildScrollView
  final ScrollController? scrollController;

  /// Scroll/Axis direction of pages, can he horizontal or vertical
  ///
  /// @Default `Axis.horizontal`
  final Axis pagesAxis;

  /// PageView scroll physics (only when freeze is set to false)
  ///
  /// @Default `BouncingScrollPhysics()`
  final ScrollPhysics scrollPhysics;

  /// Is right to left behaviour
  ///
  /// @Default `false`
  final bool rtl;

  const IntroductionScreen({
    Key? key,
    this.pages,
    this.rawPages,
    this.onDone,
    this.done,
    this.onSkip,
    this.onChange,
    this.skip,
    this.next,
    this.showSkipButton = false,
    this.showNextButton = true,
    this.showDoneButton = true,
    this.isProgress = true,
    this.isProgressTap = true,
    this.freeze = false,
    this.globalBackgroundColor,
    this.dotsDecorator = const DotsDecorator(),
    this.dotsContainerDecorator,
    this.animationDuration = 350,
    this.initialPage = 0,
    this.skipFlex = 1,
    this.dotsFlex = 1,
    this.nextFlex = 1,
    this.curve = Curves.easeIn,
    this.color,
    this.skipColor,
    this.nextColor,
    this.doneColor,
    this.isTopSafeArea = false,
    this.isBottomSafeArea = false,
    this.controlsMargin = EdgeInsets.zero,
    this.controlsPadding = const EdgeInsets.all(16.0),
    this.globalHeader,
    this.globalFooter,
    this.scrollController,
    this.pagesAxis = Axis.horizontal,
    this.scrollPhysics = const BouncingScrollPhysics(),
    this.rtl = false,
  })  : assert(pages != null || rawPages != null),
        assert(
          (pages != null && pages.length > 0) ||
              (rawPages != null && rawPages.length > 0),
          "You provide at least one page on introduction screen !",
        ),
        assert(!showDoneButton || (done != null && onDone != null)),
        assert((showSkipButton && skip != null) || !showSkipButton),
        assert((showNextButton && next != null) || !showNextButton),
        assert(skipFlex >= 0 && dotsFlex >= 0 && nextFlex >= 0),
        assert(initialPage >= 0),
        super(key: key);

  @override
  IntroductionScreenState createState() => IntroductionScreenState();
}

class IntroductionScreenState extends State<IntroductionScreen> {
  late PageController _pageController;
  double _currentPage = 0.0;
  bool _isSkipPressed = false;
  bool _isScrolling = false;

  PageController get controller => _pageController;

  @override
  void initState() {
    super.initState();
    int initialPage = min(widget.initialPage, getPagesLength() - 1);
    _currentPage = initialPage.toDouble();
    _pageController = PageController(initialPage: initialPage);
  }

  int getPagesLength() {
    return (widget.pages ?? widget.rawPages!).length;
  }

  void next() => animateScroll(_currentPage.round() + 1);

  void previous() => animateScroll(_currentPage.round() - 1);

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
    setState(() => _isScrolling = true);
    await _pageController.animateToPage(
      max(min(page, getPagesLength() - 1), 0),
      duration: Duration(milliseconds: widget.animationDuration),
      curve: widget.curve,
    );
    if (mounted) {
      setState(() => _isScrolling = false);
    }
  }

  bool _onScroll(ScrollNotification notification) {
    final metrics = notification.metrics;
    if (metrics is PageMetrics && metrics.page != null) {
      if (mounted) {
        setState(() => _currentPage = metrics.page!);
      }
    }
    return false;
  }

  Widget _toggleBtn(Widget btn, bool isShow) {
    return isShow
        ? btn
        : Opacity(opacity: 0.0, child: IgnorePointer(child: btn));
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = (_currentPage.round() == getPagesLength() - 1);
    bool isSkipBtn = (!_isSkipPressed && !isLastPage && widget.showSkipButton);

    final skipBtn = IntroButton(
      child: widget.skip,
      color: widget.skipColor ?? widget.color,
      onPressed: isSkipBtn ? _onSkip : null,
    );

    final nextBtn = IntroButton(
      child: widget.next,
      color: widget.nextColor ?? widget.color,
      onPressed: widget.showNextButton && !_isScrolling ? next : null,
    );

    final doneBtn = IntroButton(
      child: widget.done,
      color: widget.doneColor ?? widget.color,
      onPressed: widget.showDoneButton && !_isScrolling ? widget.onDone : null,
    );

    return Scaffold(
      backgroundColor: widget.globalBackgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: NotificationListener<ScrollNotification>(
              onNotification: _onScroll,
              child: PageView(
                reverse: widget.rtl,
                scrollDirection: widget.pagesAxis,
                controller: _pageController,
                onPageChanged: widget.onChange,
                physics: widget.freeze
                    ? const NeverScrollableScrollPhysics()
                    : widget.scrollPhysics,
                children: widget.pages != null
                    ? widget.pages!
                        .map((p) => IntroPage(
                              page: p,
                              scrollController: widget.scrollController,
                              isTopSafeArea: widget.isTopSafeArea,
                              isBottomSafeArea: widget.isBottomSafeArea,
                            ))
                        .toList()
                    : widget.rawPages!,
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  padding: widget.controlsPadding,
                  margin: widget.controlsMargin,
                  decoration: widget.dotsContainerDecorator,
                  child: Row(
                    children: [
                      Expanded(
                        flex: widget.skipFlex,
                        child: _toggleBtn(skipBtn, isSkipBtn),
                      ),
                      Expanded(
                        flex: widget.dotsFlex,
                        child: Center(
                          child: widget.isProgress
                              ? DotsIndicator(
                                  reversed: widget.rtl,
                                  dotsCount: getPagesLength(),
                                  position: _currentPage,
                                  decorator: widget.dotsDecorator,
                                  onTap: widget.isProgressTap && !widget.freeze
                                      ? (pos) => animateScroll(pos.toInt())
                                      : null,
                                )
                              : const SizedBox(),
                        ),
                      ),
                      Expanded(
                        flex: widget.nextFlex,
                        child: isLastPage
                            ? _toggleBtn(doneBtn, widget.showDoneButton)
                            : _toggleBtn(nextBtn, widget.showNextButton),
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
    );
  }
}
