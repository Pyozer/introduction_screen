import 'package:flutter/material.dart';
import 'package:introduction_screen/src/model/page_view_model.dart';
import 'package:introduction_screen/src/ui/intro_content.dart';

extension ReversedList<T> on List<T> {
  List<T> asReversed(bool reverse) {
    return reverse ? this.reversed.toList() : this;
  }
}

class IntroPage extends StatelessWidget {
  final PageViewModel page;

  const IntroPage({Key? key, required this.page}) : super(key: key);

  Widget _buildStack() {
    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.bottomCenter,
      children: [
        if (page.image != null) page.image!,
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Spacer(flex: page.decoration.imageFlex),
            Expanded(
              flex: page.decoration.bodyFlex,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 70.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    child: IntroContent(page: page),
                    decoration: BoxDecoration(
                      color: page.decoration.pageColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
            ),
          ].asReversed(page.reverse),
        ),
      ],
    );
  }

  Widget _buildFlex() {
    return Container(
      color: page.decoration.pageColor,
      decoration: page.decoration.boxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...[
            if (page.image != null)
              Expanded(
                flex: page.decoration.imageFlex,
                child: Align(
                  alignment: page.decoration.imageAlignment,
                  child: Padding(
                    padding: page.decoration.imagePadding,
                    child: page.image,
                  ),
                ),
              ),
            Expanded(
              flex: page.decoration.bodyFlex,
              child: Align(
                alignment: page.decoration.bodyAlignment,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: IntroContent(page: page),
                ),
              ),
            ),
          ].asReversed(page.reverse),
          const SizedBox(height: 70),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: page.decoration.fullScreen ? _buildStack() : _buildFlex(),
    );
  }
}
