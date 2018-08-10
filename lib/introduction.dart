library introduction_screen;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:introduction_screen/model/page_view_model.dart';
import 'package:introduction_screen/ui/intro_button.dart';
import 'package:introduction_screen/ui/intro_content.dart';
import 'package:introduction_screen/ui/intro_page.dart';

class IntroScreen extends StatefulWidget {
  static const String kDefaultSkipText = "SKIP";
  static const String kDefaultNextText = "NEXT";
  static const String kDefaultDoneText = "GOT IT";

  final List<PageViewModel> pages;
  final bool showSkipButton;
  final VoidCallback onDone;
  final String skipText;
  final String nextText;
  final String doneText;

  const IntroScreen(
      {Key key,
      @required this.pages,
      this.showSkipButton = false,
      this.onDone,
      this.skipText = kDefaultSkipText,
      this.nextText = kDefaultNextText,
      this.doneText = kDefaultDoneText})
      : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController pageController = PageController();
  int currentPage = 0;

  List<Widget> _buildPages() {
    List<Widget> pages = [];

    for (final page in widget.pages) {
      pages.add(IntroPage(
          bgColor: page.pageColor,
          image: Center(child: page.image),
          content: IntroContent(
              title: page.title,
              body: page.body,
              titleStyle: page.titleTextStyle,
              bodyStyle: page.bodyTextStyle)));
    }

    return pages;
  }

  void _onNext() {
    final page = (currentPage + 1 < widget.pages.length) ? currentPage + 1 : 0;
    animateScroll(page).then((value) {
      setState(() {
        currentPage = page;
      });
    });
  }

  void _onSkip() {
    animateScroll(widget.pages.length - 1).then((value) {
      setState(() {
        currentPage = widget.pages.length - 1;
      });
    });
  }

  Future<Null> animateScroll(int page) {
    return pageController.animateToPage(page,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = (currentPage == widget.pages.length - 1);

    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
          Expanded(
              child: PageView(
                  controller: pageController,
                  children: _buildPages(),
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  })),
          Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: (!isLastPage && widget.showSkipButton)
                            ? IntroButton(
                                text: widget.skipText, onPressed: _onSkip)
                            : Container(),
                        flex: 3),
                    DotsIndicator(
                      numberOfDot: widget.pages.length,
                      position: currentPage,
                      dotActiveColor: widget.pages[currentPage].progressColor,
                    ),
                    Expanded(
                        child: (!isLastPage)
                            ? IntroButton(
                                text: widget.nextText, onPressed: _onNext)
                            : IntroButton(
                                text: widget.doneText,
                                onPressed: widget.onDone),
                        flex: 3)
                  ]))
        ]));
  }
}
