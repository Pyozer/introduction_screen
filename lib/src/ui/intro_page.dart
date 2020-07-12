import 'package:flutter/material.dart';
import 'package:introduction_screen/src/model/page_view_model.dart';
import 'package:introduction_screen/src/ui/intro_content.dart';

class IntroPage extends StatelessWidget {
  final PageViewModel page;

  const IntroPage({Key key, @required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (page.decoration.fullScreen) {
      return _buildStack(context);
    } else {
      return _buildFlex(context);
    }
  }

  Widget _buildStack(BuildContext context) {
    return Container(
      child: SafeArea(
        top: false,
        child: Stack(
          fit: StackFit.loose,
          alignment: Alignment.bottomCenter,
          children: [
            if (page.image != null) page.image,
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  flex: page.decoration.imageFlex,
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
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
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlex(BuildContext context) {
    return Container(
      color: page.decoration.pageColor,
      decoration: page.decoration.boxDecoration,
      child: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
              child: Padding(
                padding: const EdgeInsets.only(bottom: 70.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: IntroContent(page: page),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
