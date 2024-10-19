import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  Widget createIntroductionScreen({
    required List<PageViewModel> pages,
    VoidCallback? onDone,
    VoidCallback? onSkip,
    bool showSkipButton = false,
    bool showDoneButton = false,
    bool showNextButton = true,
    int? autoScrollDuration,
  }) {
    return MaterialApp(
      home: IntroductionScreen(
        pages: pages,
        done: showDoneButton ? Text("Done") : null,
        onDone: onDone,
        skip: showSkipButton ? Text("Skip") : null,
        onSkip: onSkip,
        next: showNextButton ? Text("Next") : null,
        showSkipButton: showSkipButton,
        showDoneButton: showDoneButton,
        showNextButton: showNextButton,
        autoScrollDuration: autoScrollDuration,
        // infiniteAutoScroll: autoScrollDuration != null,
      ),
    );
  }

  group('IntroductionScreen Widget Tests', () {
    testWidgets('Initial page is rendered and buttons are displayed',
        (tester) async {
      // Act
      final pages = [
        PageViewModel(title: 'Page 1', body: 'Introduction 1'),
        PageViewModel(title: 'Page 2', body: 'Introduction 2'),
      ];

      await tester.pumpWidget(
          createIntroductionScreen(pages: pages, showSkipButton: true));

      // Assert
      expect(find.text('Page 1'), findsOneWidget);
      expect(find.text('Skip'), findsOneWidget);
      expect(find.text('Next'), findsOneWidget);
    });

    testWidgets('Next button advances the page', (tester) async {
      // Arrange
      final pages = [
        PageViewModel(title: 'Page 1', body: 'Introduction 1'),
        PageViewModel(title: 'Page 2', body: 'Introduction 2'),
      ];
      await tester.pumpWidget(createIntroductionScreen(pages: pages));

      // Act
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Page 2'), findsOneWidget);
    });

    testWidgets('Skip button triggers onSkip callback', (tester) async {
      // Arrange
      var skipTapped = false;

      final pages = [
        PageViewModel(title: 'Page 1', body: 'Introduction 1'),
        PageViewModel(title: 'Page 2', body: 'Introduction 2'),
        PageViewModel(title: 'Page 3', body: 'Introduction 3'),
      ];

      await tester.pumpWidget(
        createIntroductionScreen(
          pages: pages,
          onSkip: () {
            skipTapped = true;
          },
          showSkipButton: true,
        ),
      );

      // Act
      await tester.tap(find.text('Skip'));
      await tester.pumpAndSettle();

      // Assert
      expect(skipTapped, isTrue);
    });

    testWidgets('Skip to end navigates to the last page',
        (WidgetTester tester) async {
      // Arrange
      final pages = [
        PageViewModel(title: 'Page 1', body: 'Introduction 1'),
        PageViewModel(title: 'Page 2', body: 'Introduction 2'),
        PageViewModel(title: 'Page 3', body: 'Introduction 3'),
      ];
      await tester.pumpWidget(
        createIntroductionScreen(
          pages: pages,
          showSkipButton: true,
        ),
      );

      // Initially, the first page should be visible
      expect(find.text('Page 1'), findsOneWidget);

      // Tap the skip button to skip to the end
      await tester.tap(find.text('Skip'));
      await tester.pumpAndSettle();

      // Verify that we are now on the last page
      expect(find.text('Page 3'), findsOneWidget);
    });

    testWidgets('Done button triggers onDone callback', (tester) async {
      // Arrange
      var doneTapped = false;
      final pages = [
        PageViewModel(title: 'Page 1', body: 'Introduction 1'),
        PageViewModel(title: 'Page 2', body: 'Introduction 2'),
      ];

      await tester.pumpWidget(
        createIntroductionScreen(
          pages: pages,
          onDone: () {
            doneTapped = true;
          },
          showDoneButton: true,
        ),
      );

      // Act
      // Navigate to the last page
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Done'));
      await tester.pumpAndSettle();

      // Assert
      expect(doneTapped, isTrue);
    });

    testWidgets('Progress indicator updates with page change', (tester) async {
      // Arrange
      final pages = [
        PageViewModel(title: 'Page 1', body: 'Introduction 1'),
        PageViewModel(title: 'Page 2', body: 'Introduction 2'),
      ];

      await tester.pumpWidget(createIntroductionScreen(pages: pages));

      // Assert initial page
      expect(find.byType(DotsIndicator), findsOneWidget);
      DotsIndicator indicator = tester.widget(find.byType(DotsIndicator));
      expect(indicator.position, 0.0);

      // Act - Move to the next page
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();

      // Assert updated indicator
      indicator = tester.widget(find.byType(DotsIndicator));
      expect(indicator.position, 1.0);
    });
  });

  testWidgets('Auto-scroll works as expected', (WidgetTester tester) async {
    // Arrange
    final pages = [
      PageViewModel(title: 'Page 1', body: 'Introduction 1'),
      PageViewModel(title: 'Page 2', body: 'Introduction 2'),
    ];

    await tester.pumpWidget(
        createIntroductionScreen(pages: pages, autoScrollDuration: 5));

    // Initial page should be Page 1
    expect(find.text('Page 1'), findsOneWidget);

    // Simulate time passing to trigger auto-scroll
    await tester.pump(const Duration(milliseconds: 10));
    await tester.pumpAndSettle();

    // The auto-scroll should have moved to the next page
    expect(find.text('Page 2'), findsOneWidget);
  });
}
