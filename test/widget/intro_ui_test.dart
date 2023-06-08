import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:introduction_screen/testable_widget.dart';

import 'package:introduction_screen/src/ui/intro_button.dart';
import 'package:introduction_screen/src/ui/intro_content.dart';
import 'package:introduction_screen/src/ui/intro_page.dart';

void main() {
  group("Intro UI widget tests", () {
    final titleFinder = find.text('Test Title');
    final bodyFinder = find.text('Test Body');
    final footerFinder = find.text('Test Footer');

    testWidgets('IntroButton has text', (tester) async {
      await tester.pumpWidget(testableWidget(
        child: IntroButton(child: const Text('Test Text')),
      ));

      final textFinder = find.text('Test Text');
      expect(textFinder, findsOneWidget);
    });

    testWidgets('IntroContent is rendered', (tester) async {
      await tester.pumpWidget(testableWidget(
        child: IntroContent(
          page: PageViewModel(
            title: 'Test Title',
            body: 'Test Body',
            footer: const Text('Test Footer'),
          ),
        ),
      ));

      expect(titleFinder, findsOneWidget);
      expect(bodyFinder, findsOneWidget);
      expect(footerFinder, findsNothing);
    });

    testWidgets('IntroPage is rendered', (tester) async {
      await tester.pumpWidget(testableWidget(
        child: IntroPage(
          page: PageViewModel(
            title: 'Test Title',
            body: 'Test Body',
            footer: const Text('Test Footer'),
          ),
        ),
      ));

      expect(titleFinder, findsOneWidget);
      expect(bodyFinder, findsOneWidget);
      expect(footerFinder, findsOneWidget);
    });
  });
}
