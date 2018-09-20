library introduction_screen;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:introduction_screen/model/page_view_model.dart';
import 'package:introduction_screen/ui/intro_button.dart';
import 'package:introduction_screen/ui/intro_content.dart';
import 'package:introduction_screen/ui/intro_page.dart';

class IntroductionScreen extends StatefulWidget {
  static const String kDefaultSkipText = "SKIP";
  static const String kDefaultNextText = "NEXT";
  static const String kDefaultDoneText = "DONE";

  final List<PageViewModel> pages;
  final bool showSkipButton;
  final VoidCallback onDone;
  final String skipText;
  final String nextText;
  final String doneText;

  const IntroductionScreen({
    Key key,
    @required this.pages,
    this.showSkipButton = false,
    this.onDone,
    this.skipText = kDefaultSkipText,
    this.nextText = kDefaultNextText,
    this.doneText = kDefaultDoneText,
  })  : assert(pages != null),
        assert(onDone != null),
        assert(skipText != null),
        assert(nextText != null),
        assert(doneText != null),
        super(key: key);

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

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
    final page =
        (_currentPage + 1 < widget.pages.length) ? _currentPage + 1 : 0;
    animateScroll(page).then((value) {
      setState(() {
        _currentPage = page;
      });
    });
  }

  void _onSkip() {
    animateScroll(widget.pages.length - 1).then((value) {
      setState(() {
        _currentPage = widget.pages.length - 1;
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

  @override
  Widget build(BuildContext context) {
    final isLastPage = (_currentPage == widget.pages.length - 1);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: (!isLastPage && widget.showSkipButton)
                      ? Center(
                          child: IntroButton(
                            text: widget.skipText,
                            onPressed: _onSkip,
                          ),
                        )
                      : Container(),
                ),
                const SizedBox(width: 8.0),
                DotsIndicator(
                  numberOfDot: widget.pages.length,
                  position: _currentPage,
                  dotActiveColor: widget.pages[_currentPage].progressColor,
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Center(
                    child: (!isLastPage)
                        ? IntroButton(
                            text: widget.nextText,
                            onPressed: _onNext,
                          )
                        : IntroButton(
                            text: widget.doneText,
                            onPressed: widget.onDone,
                          ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
