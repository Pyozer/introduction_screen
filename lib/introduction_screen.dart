library introduction_screen;

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:introduction_screen/model/page_view_model.dart';
import 'package:introduction_screen/ui/intro_button.dart';
import 'package:introduction_screen/ui/intro_content.dart';
import 'package:introduction_screen/ui/intro_page.dart';

class IntroductionScreen extends StatefulWidget {
  static const Size kProgressSize = const Size.fromRadius(5.0);
  static const EdgeInsets kDotsSpacing = const EdgeInsets.all(4.0);

  final List<PageViewModel> pages;
  final bool showSkipButton;
  final VoidCallback onDone;
  final Size progressSizes;
  final EdgeInsets dotsSpacing;
  final bool isProgress;
  final Widget next;
  final Widget done;
  final Widget skip;

  const IntroductionScreen({
    Key key,
    @required this.pages,
    this.showSkipButton = false,
    this.onDone,
    this.progressSizes = kProgressSize,
    this.dotsSpacing = kDotsSpacing,
    this.isProgress = true,
    this.next,
    this.done,
    this.skip,
  })  : assert(pages != null),
        assert(onDone != null),
        super(key: key);

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  bool isSkipPressed = false;

  List<Widget> _buildPages() {
    List<Widget> pages = [];

    for (final page in widget.pages) {
      pages.add(
        IntroPage(
          bgColor: page.pageColor,
          image: Center(child: page.image),
          content: IntroContent(
            title: page.title,
            body: page.body,
            titleStyle: page.titleTextStyle,
            bodyStyle: page.bodyTextStyle,
          ),
        ),
      );
    }

    return pages;
  }

  void _onNext() {
    final page = min(_currentPage + 1, widget.pages.length);
    animateScroll(page).then((value) {
      setState(() {
        _currentPage = page;
      });
    });
  }

  void _onSkip() {
    setState(() {
      isSkipPressed = true;
    });
    animateScroll(widget.pages.length - 1).then((value) {
      setState(() {
        _currentPage = widget.pages.length - 1;
        isSkipPressed = false;
      });
    });
  }

  Future<Null> animateScroll(int page) {
    return _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  Widget _defBtnTxt(String text) {
    TextStyle style = const TextStyle(fontWeight: FontWeight.w700);
    return Text(text, style: style, textAlign: TextAlign.center);
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = (_currentPage == widget.pages.length - 1);
    bool isSkipBtn = (!isSkipPressed && !isLastPage && widget.showSkipButton);
    final page = widget.pages[_currentPage];

    final skipButton = Opacity(
      opacity: isSkipBtn ? 1.0 : 0.0,
      child: IntroButton(
        child: widget.skip ?? _defBtnTxt("SKIP"),
        onPressed: _onSkip,
      ),
    );

    final nextButton = IntroButton(
      child: widget.next ?? _defBtnTxt("NEXT"),
      onPressed: _onNext,
    );

    final doneButton = IntroButton(
      child: widget.done ?? _defBtnTxt("DONE"),
      onPressed: widget.onDone,
    );

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: _buildPages(),
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              child: Row(
                children: [
                  skipButton,
                  Expanded(
                    child: Center(
                      child: (widget.isProgress)
                          ? DotsIndicator(
                              numberOfDot: widget.pages.length,
                              position: _currentPage,
                              dotSpacing: widget.dotsSpacing,
                              dotActiveSize: page.progressSize,
                              dotSize: widget.progressSizes,
                              dotActiveColor: page.progressColor,
                            )
                          : const SizedBox(),
                    ),
                    flex: 36,
                  ),
                  (!isLastPage) ? nextButton : doneButton,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
