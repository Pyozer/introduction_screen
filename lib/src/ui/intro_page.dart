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
  final bool isTopSafeArea;
  final bool isBottomSafeArea;

  const IntroPage({
    Key? key,
    required this.page,
    this.scrollController,
    required this.isTopSafeArea,
    required this.isBottomSafeArea,
  }) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  Widget _buildStack() {
    final content = IntroContent(page: widget.page, isFullScreen: true);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        if (widget.page.image != null) widget.page.image!,
        Positioned.fill(
          child: Column(
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
              SafeArea(top: false, child: const SizedBox(height: 60.0)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFlex() {
    return Container(
      color: widget.page.decoration.pageColor,
      decoration: widget.page.decoration.boxDecoration,
      margin: const EdgeInsets.only(bottom: 60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (widget.page.decoration.fullScreen) {
      return _buildStack();
    }
    return SafeArea(
      top: widget.isTopSafeArea,
      bottom: widget.isBottomSafeArea,
      child: _buildFlex(),
    );
  }
}
