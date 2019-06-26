import 'package:flutter_web/material.dart';
import 'package:introduction_screen/src/model/page_view_model.dart';
import 'package:introduction_screen/src/ui/intro_content.dart';

class IntroPage extends StatelessWidget {
  final PageViewModel page;

  const IntroPage({Key key, @required this.page}) : super(key: key);

  List<Widget> _buildPage() {
    List<Widget> elements = [];
    if (page.image != null) {
      elements.add(Expanded(
        flex: page.decoration.imageFlex,
        child: Padding(
          child: page.image,
          padding: const EdgeInsets.only(bottom: 24.0),
        ),
      ));
    }

    elements.add(Expanded(
      flex: page.decoration.bodyFlex,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 70.0),
        child: SingleChildScrollView(
          child: IntroContent(
            title: page.title,
            body: page.body,
            footer: page.footer,
            titleStyle: page.decoration.titleTextStyle,
            bodyStyle: page.decoration.bodyTextStyle,
          ),
          physics: const BouncingScrollPhysics(),
        ),
      ),
    ));
    return elements;
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
          children: _buildPage(),
        ),
      ),
    );
  }
}
