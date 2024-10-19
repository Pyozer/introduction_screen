import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:introduction_screen/src/ui/intro_page.dart';
import 'package:introduction_screen/testable_widget.dart';

import 'package:introduction_screen/src/ui/intro_button.dart';
import 'package:introduction_screen/src/ui/intro_content.dart';

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

    testWidgets('Intro Content renders full screen with decoration',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: IntroContent(
              page: PageViewModel(
                title: 'Test Title',
                body: 'Test Body',
                footer: const Text('Test Footer'),
              ),
              isFullScreen: true),
        ),
      ));

      // Find the IntroContent widget
      final introContentFinder = find.byType(IntroContent);
      expect(introContentFinder, findsOneWidget);

      // Check if the container has a decoration when isFullScreen is true
      final introContent = tester.widget<IntroContent>(introContentFinder);
      expect(introContent.isFullScreen, isTrue);
    });

    testWidgets('renders IntroPage with full screen stack',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: IntroPage(
            page: PageViewModel(
              title: 'Test Title',
              body: 'Test Body',
              footer: const Text('Test Footer'),
              decoration: PageDecoration(fullScreen: true),
              // useScrollView: false,
            ),
          ),
        ),
      ));

      // Check that the IntroContent is rendered in a Stack
      expect(find.byType(Stack), findsWidgets);
      expect(find.byType(IntroContent), findsOneWidget);
      expect(find.byType(SingleChildScrollView),
          findsOneWidget); // No scroll view if useScrollView is false
    });

    testWidgets('renders IntroPage with Flex layout',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: IntroPage(
            page: PageViewModel(
              title: 'Test Title',
              body: 'Test Body',
              footer: const Text('Test Footer'),
              useScrollView: false,
            ),
          ),
        ),
      ));

      // Check that the IntroContent is rendered in a Flex layout
      expect(find.byType(Flex), findsOneWidget);
      expect(find.byType(IntroContent), findsOneWidget);
      expect(find.byType(SingleChildScrollView),
          findsNothing); // No scroll view if useScrollView is false
    });

    testWidgets('renders IntroPage with image when provided',
        (WidgetTester tester) async {
      // Create a mock image widget
      final mockImage = Container(
        color: Colors.blue,
        width: 100,
        height: 100,
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: IntroPage(
            page: PageViewModel(
              title: 'Test Title',
              body: 'Test Body',
              image: mockImage, // Set the page image to the mock image
              footer: const Text('Test Footer'),
              useScrollView: false,
            ),
          ),
        ),
      ));

      // Check that the image is rendered
      expect(find.byWidget(mockImage), findsOneWidget);
    });
  });
}
