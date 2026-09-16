import 'package:flutter_test/flutter_test.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  group('PageViewModel', () {
    test('constructs with title and body', () {
      final page = PageViewModel(title: 'Title', body: 'Body');

      expect(page.title, 'Title');
      expect(page.body, 'Body');
      expect(page.reverse, isFalse);
      expect(page.useScrollView, isTrue);
    });

    test('throws when neither title nor titleWidget is provided', () {
      expect(
        () => PageViewModel(titleWidget: null, body: 'Body'),
        throwsA(isA<AssertionError>()),
      );
    });

    test('throws when both title and titleWidget are provided', () {
      expect(
        () => PageViewModel(
          title: 'Title',
          titleWidget: const Text('Title'),
          body: 'Body',
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('throws when neither body nor bodyWidget is provided', () {
      expect(
        () => PageViewModel(title: 'Title'),
        throwsA(isA<AssertionError>()),
      );
    });

    test('throws when both body and bodyWidget are provided', () {
      expect(
        () => PageViewModel(
          title: 'Title',
          body: 'Body',
          bodyWidget: const Text('Body'),
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('throws when backgroundImage has an invalid extension', () {
      expect(
        () => PageViewModel(
          title: 'Title',
          body: 'Body',
          backgroundImage: 'assets/background.svg',
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('accepts a valid backgroundImage extension', () {
      final page = PageViewModel(
        title: 'Title',
        body: 'Body',
        backgroundImage: 'assets/background.png',
      );

      expect(page.backgroundImage, 'assets/background.png');
    });
  });
}
