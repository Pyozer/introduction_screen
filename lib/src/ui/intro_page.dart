import 'package:flutter/material.dart';
import 'package:introduction_screen/src/model/page_view_model.dart';
import 'package:introduction_screen/src/ui/intro_content.dart';

class IntroPage extends StatelessWidget {
  final PageViewModel page;

  const IntroPage({Key key, @required this.page}) : super(key: key);

  List<Widget> _buildWidgetList(bool reverse) {
    List<Widget> list = [
      if (page.image != null)
        Expanded(
          flex: page.decoration.imageFlex,
          child: Padding(
            padding: page.decoration.imagePadding,
            child: page.image,
          ),
        ),
      Expanded(
        flex: page.decoration.bodyFlex,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: IntroContent(page: page),
        ),
      ),
    ];
    return reverse ? list.reversed.toList() : list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: page.decoration.pageColor,
      decoration: page.decoration.boxDecoration,
      child: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var i in _buildWidgetList(page.reverse)) i,
            SizedBox(height: 70)
          ],
        ),
      ),
    );
  }
}
