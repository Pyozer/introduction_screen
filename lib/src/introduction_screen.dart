library introduction_screen;

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:introduction_screen/src/model/page_view_model.dart';
import 'package:introduction_screen/src/ui/intro_button.dart';
import 'package:introduction_screen/src/ui/intro_page.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({
    Key key,
    @required this.pages,
    @required this.onDone,
    @required this.done,
    this.onSkip,
    this.onChange,
    this.skip,
    this.next,
    this.showSkipButton = false,
    this.showNextButton = true,
    this.isProgress = true,
    this.freeze = false,
    this.globalBackgroundColor,
    this.dotsDecorator = const DotsDecorator(),
    this.animationDuration = 350,
    this.initialPage = 0,
    this.skipFlex = 1,
    this.dotsFlex = 1,
    this.nextFlex = 1,
    this.curve = Curves.easeIn,
    this.captions,
  })  : assert(pages != null),
        assert(
        pages.length > 0,
        'You provide at least one page on introduction screen !',
        ),
        assert(onDone != null),
        assert(done != null),
        assert((showSkipButton && skip != null) || !showSkipButton),
        assert(skipFlex >= 0 && dotsFlex >= 0 && nextFlex >= 0),
        assert(initialPage == null || initialPage >= 0),
        super(key: key);

  /// All pages of the onboarding
  final List<PageViewModel> pages;

  /// Callback when Done button is pressed
  final VoidCallback onDone;

  /// Done button
  final Widget done;

  /// Callback when Skip button is pressed
  final VoidCallback onSkip;

  /// Callback when page change
  final ValueChanged<int> onChange;

  /// Skip button
  final Widget skip;

  /// Next button
  final Widget next;

  /// Is the Skip button should be display
  ///
  /// @Default `false`
  final bool showSkipButton;

  /// Is the Next button should be display
  ///
  /// @Default `true`
  final bool showNextButton;

  /// Is the progress indicator should be display
  ///
  /// @Default `true`
  final bool isProgress;

  /// Is the user is allow to change page
  ///
  /// @Default `false`
  final bool freeze;

  /// Global background color
  /// (only visible when a page has a transparent background color)
  final Color globalBackgroundColor;

  /// Dots decorator to custom dots color, size and spacing
  final DotsDecorator dotsDecorator;

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

  /// Captions area widget
  final Widget captions;

  @override
  IntroductionScreenState createState() => IntroductionScreenState();
}

class IntroductionScreenState extends State<IntroductionScreen> {
  PageController _pageController;
  double _currentPage = 0;
  bool _isScrolling = false;

  PageController get controller => _pageController;

  @override
  void initState() {
    super.initState();
    final initialPage = min(widget.initialPage, widget.pages.length - 1);
    _currentPage = initialPage.toDouble();
    _pageController = PageController(initialPage: initialPage);
  }

  void _onNext() {
    animateScroll(min(_currentPage.round() + 1, widget.pages.length - 1));
  }

  Future<void> skipToEnd() async {
    await animateScroll(widget.pages.length - 1);
  }

  Future<void> animateScroll(int page) async {
    setState(() => _isScrolling = true);
    await _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: widget.animationDuration),
      curve: widget.curve,
    );
    setState(() => _isScrolling = false);
  }

  bool _onScroll(ScrollNotification notification) {
    final metrics = notification.metrics;
    if (metrics is PageMetrics) {
      setState(() => _currentPage = metrics.page);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = (_currentPage.round() == widget.pages.length - 1);

    final nextBtn = IntroButton(
      child: widget.next,
      onPressed: widget.showNextButton && !_isScrolling ? _onNext : null,
    );

    final doneBtn = IntroButton(
      child: widget.done,
      onPressed: widget.onDone,
    );

    final captionsWidget = Container(
      child: widget.captions,
    );

    return Scaffold(
      backgroundColor: widget.globalBackgroundColor,
      body: Column(
        children: [
          SizedBox(
            width: context.deviceWidth,
            height: context.deviceHeight / 1.8,
            child: NotificationListener<ScrollNotification>(
              onNotification: _onScroll,
              child: PageView(
                controller: _pageController,
                physics: widget.freeze
                    ? const NeverScrollableScrollPhysics()
                    : const BouncingScrollPhysics(),
                children: widget.pages.map((p) => IntroPage(page: p)).toList(),
                onPageChanged: widget.onChange,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    flex: widget.dotsFlex,
                    child: Center(
                      child: widget.isProgress
                          ? DotsIndicator(
                        dotsCount: widget.pages.length,
                        position: _currentPage,
                        decorator: const DotsDecorator(
                          activeColor: kGoogleRedBright,
                          size: Size.fromRadius(5),
                          activeSize: Size.fromRadius(5),
                        ),
                      )
                          : const SizedBox(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Center(
                child: isLastPage
                    ? doneBtn
                    : widget.showNextButton
                    ? nextBtn
                    : Opacity(opacity: 10, child: nextBtn),
              ),
              const SizedBox(height: 24),
              captionsWidget,
              const SizedBox(height: 24),
            ],
          ),
        ],
      ),
    );
  }
}
