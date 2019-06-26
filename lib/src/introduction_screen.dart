library introduction_screen;

import 'dart:async';
import 'dart:math';

import 'package:flutter_web/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:introduction_screen/src/model/page_view_model.dart';
import 'package:introduction_screen/src/ui/intro_button.dart';
import 'package:introduction_screen/src/ui/intro_page.dart';

class IntroductionScreen extends StatefulWidget {
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
  final bool showSkipButton;

  /// Is the Next button should be display
  final bool showNextButton;

  /// Is the progress indicator should be display
  final bool isProgress;

  /// Is the user is allow to change page
  final bool freeze;

  /// Global background color (only visible when a page has a transparent background color)
  final Color globalBackgroundColor;

  /// Animation duration in millisecondes
  final int animationDuration;

  /// Index of the initial page
  final int initialPage;

  /// Flex ratio of the skip button
  final int skipFlex;

  /// Flex ratio of the progress indicator
  final int dotsFlex;

  /// Flex ratio of the next/done button
  final int nextFlex;

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
    this.animationDuration = 350,
    this.initialPage = 0,
    this.skipFlex = 1,
    this.dotsFlex = 1,
    this.nextFlex = 1,
  })  : assert(pages != null),
        assert(onDone != null),
        assert(done != null),
        assert((skip != null && showSkipButton) || !showSkipButton),
        assert(skipFlex >= 0 && dotsFlex >= 0 && nextFlex >= 0),
        super(key: key);

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  PageController _pageController;
  int _currentPage = 0;
  bool _isSkipPressed = false;
  bool _isScrolling = false;

  @override
  void initState() {
    super.initState();
    if (widget.pages.length < 1)
      throw Exception("You provide at least one page on introduction screen !");
    _currentPage = min(widget.initialPage, widget.pages.length - 1);
    _pageController = PageController(initialPage: _currentPage);
  }

  void _onNext() {
    animateScroll(min(_currentPage + 1, widget.pages.length - 1));
  }

  Future<void> _onSkip() async {
    if (widget.onSkip != null) return widget.onSkip();

    setState(() => _isSkipPressed = true);
    await animateScroll(widget.pages.length - 1);
    setState(() => _isSkipPressed = false);
  }

  Future<void> animateScroll(int page) async {
    setState(() => _isScrolling = true);
    await _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: widget.animationDuration),
      curve: Curves.easeIn,
    );
    setState(() => _isScrolling = false);
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = (_currentPage == widget.pages.length - 1);
    bool isSkipBtn = (!_isSkipPressed && !isLastPage && widget.showSkipButton);
    final page = widget.pages[_currentPage];

    final skipBtn = IntroButton(
      child: widget.skip,
      onPressed: isSkipBtn ? _onSkip : null,
    );

    final nextBtn = IntroButton(
      child: widget.next,
      onPressed: widget.showNextButton && !_isScrolling ? _onNext : null,
    );

    final doneBtn = IntroButton(
      child: widget.done,
      onPressed: widget.onDone,
    );

    return Scaffold(
      backgroundColor: widget.globalBackgroundColor,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: widget.freeze
                ? const NeverScrollableScrollPhysics()
                : const BouncingScrollPhysics(),
            children: widget.pages.map((p) => IntroPage(page: p)).toList(),
            onPageChanged: (index) {
              setState(() => _currentPage = index);
              if (widget.onChange != null) widget.onChange(index);
            },
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    flex: widget.skipFlex,
                    child: isSkipBtn
                        ? skipBtn
                        : Opacity(opacity: 0.0, child: skipBtn),
                  ),
                  Expanded(
                    flex: widget.dotsFlex,
                    child: Center(
                      child: widget.isProgress
                          ? DotsIndicator(
                              dotsCount: widget.pages.length,
                              position: _currentPage,
                              decorator: page.decoration.dotsDecorator,
                            )
                          : const SizedBox(),
                    ),
                  ),
                  Expanded(
                    flex: widget.nextFlex,
                    child: isLastPage
                        ? doneBtn
                        : widget.showNextButton
                            ? nextBtn
                            : Opacity(opacity: 0.0, child: nextBtn),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
