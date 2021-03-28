import 'package:flutter/material.dart';
import 'package:introduction_screen/src/model/page_view_model.dart';
import 'package:introduction_screen/src/ui/intro_content.dart';

extension ReversedList<T> on List<T> {
  List<T> asReversed(bool reverse) {
    return reverse ? this.reversed.toList() : this;
  }
}

class IntroPage extends StatefulWidget {
  final PageViewModel page;
  final ScrollController? scrollController;

  const IntroPage({Key? key, required this.page, this.scrollController})
      : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  Widget _buildStack() {
    final content = Container(
      child: IntroContent(page: widget.page),
      decoration: BoxDecoration(
        color: widget.page.decoration.pageColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    );

    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.bottomCenter,
      children: [
        if (widget.page.image != null) widget.page.image!,
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ...[
              Spacer(flex: widget.page.decoration.imageFlex),
              Expanded(
                flex: widget.page.decoration.bodyFlex,
                child: widget.page.useScrollView
                    ? SingleChildScrollView(
                        controller: widget.scrollController,
                        physics: const BouncingScrollPhysics(),
                        child: content,
                      )
                    : content,
              ),
            ].asReversed(widget.page.reverse),
            const SizedBox(height: 70.0),
          ],
        ),
      ],
    );
  }

  Widget _buildFlex() {
    return Container(
      color: widget.page.decoration.pageColor,
      decoration: widget.page.decoration.boxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...[
            if (widget.page.image != null)
              Expanded(
                flex: widget.page.decoration.imageFlex,
                child: Align(
                  alignment: widget.page.decoration.imageAlignment,
                  child: Padding(
                    padding: widget.page.decoration.imagePadding,
                    child: widget.page.image,
                  ),
                ),
              ),
            Expanded(
              flex: widget.page.decoration.bodyFlex,
              child: Align(
                alignment: widget.page.decoration.bodyAlignment,
                child: widget.page.useScrollView
                    ? SingleChildScrollView(
                        controller: widget.scrollController,
                        physics: const BouncingScrollPhysics(),
                        child: IntroContent(page: widget.page),
                      )
                    : IntroContent(page: widget.page),
              ),
            ),
          ].asReversed(widget.page.reverse),
          const SizedBox(height: 70),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SafeArea(
      top: false,
      child: widget.page.decoration.fullScreen ? _buildStack() : _buildFlex(),
    );
  }
}
