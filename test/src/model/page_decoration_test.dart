import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:introduction_screen/src/model/page_decoration.dart';

void main() {
  group('PageDecoration', () {
    test('default constructor initializes with correct default values', () {
      final decoration = PageDecoration();

      expect(decoration.pageColor, isNull);
      expect(decoration.titleTextStyle.fontSize, 20.0);
      expect(decoration.titleTextStyle.fontWeight, FontWeight.bold);
      expect(decoration.bodyTextStyle.fontSize, 18.0);
      expect(decoration.bodyTextStyle.fontWeight, FontWeight.normal);
      expect(decoration.imageFlex, 1);
      expect(decoration.bodyFlex, 1);
      expect(decoration.footerFlex, 1);
      expect(decoration.footerFit, FlexFit.loose);
      expect(decoration.imagePadding, EdgeInsets.only(bottom: 24.0));
      expect(decoration.contentMargin, EdgeInsets.all(16.0));
      expect(decoration.pageMargin, EdgeInsets.only(bottom: 60.0));
      expect(decoration.titlePadding, EdgeInsets.only(top: 16.0, bottom: 24.0));
      expect(decoration.footerPadding, EdgeInsets.symmetric(vertical: 24.0));
      expect(decoration.bodyAlignment, Alignment.topCenter);
      expect(decoration.imageAlignment, Alignment.bottomCenter);
      expect(decoration.fullScreen, isFalse);
      expect(decoration.safeArea, 60);
    });

    test('cannot provide both pageColor and boxDecoration', () {
      expect(
        () => PageDecoration(
            pageColor: Colors.white, boxDecoration: BoxDecoration()),
        throwsA(isA<AssertionError>()),
      );
    });

    test('copyWith returns a new instance with updated values', () {
      final decoration = PageDecoration(
        pageColor: Colors.white,
        titleTextStyle: TextStyle(fontSize: 22.0),
      );

      final newDecoration = decoration.copyWith(
        bodyTextStyle: TextStyle(fontSize: 20.0),
        footerFlex: 2,
      );

      expect(newDecoration.pageColor, Colors.white);
      expect(newDecoration.titleTextStyle.fontSize, 22.0);
      expect(newDecoration.bodyTextStyle.fontSize, 20.0);
      expect(newDecoration.footerFlex, 2);
      expect(newDecoration.imageFlex,
          decoration.imageFlex); // Should remain the same
    });

    test('copyWith does not modify original instance', () {
      final decoration = PageDecoration(pageColor: Colors.white);
      decoration.copyWith(titleTextStyle: TextStyle(fontSize: 22.0));

      expect(decoration.titleTextStyle.fontSize,
          20.0); // Original should remain unchanged
    });
  });
}
