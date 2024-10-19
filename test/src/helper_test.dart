import 'package:flutter_test/flutter_test.dart';
import 'package:introduction_screen/src/helper.dart';

void main() {
  // Global variables
  final originalList = [1, 2, 3, 4, 5];
  final list = ['a', 'b', 'c'];

  group('CustomList', () {
    test('asReversed returns reversed list when isReverse is true', () {
      final reversedList = originalList.asReversed(true);

      expect(reversedList, [5, 4, 3, 2, 1]);
    });

    test('asReversed returns original list when isReverse is false', () {
      final originalCopy = originalList.asReversed(false);

      expect(originalCopy, originalList);
    });

    test('elementAtOrNull returns the correct element for valid index', () {
      expect(list.elementAtOrNull(1), 'b');
    });

    test('elementAtOrNull returns null for out of bounds index', () {
      expect(list.elementAtOrNull(5), isNull);
    });

    test('elementAtOrNull returns null for negative index', () {
      expect(list.elementAtOrNull(-1), isNull);
    });
  });
}
