import 'package:flutter_test/flutter_test.dart';
import 'package:introduction_screen/src/model/position.dart';

void main() {
  group('Position', () {
    test('default constructor initializes with null values', () {
      final position = Position();

      expect(position.left, isNull);
      expect(position.right, isNull);
      expect(position.top, isNull);
      expect(position.bottom, isNull);
    });

    test('constructor initializes with specified values', () {
      final position =
          Position(left: 10.0, top: 20.0, right: 30.0, bottom: 40.0);

      expect(position.left, 10.0);
      expect(position.top, 20.0);
      expect(position.right, 30.0);
      expect(position.bottom, 40.0);
    });

    test('fromLTRB constructor initializes with specified values', () {
      final position = Position.fromLTRB(10.0, 20.0, 30.0, 40.0);

      expect(position.left, 10.0);
      expect(position.top, 20.0);
      expect(position.right, 30.0);
      expect(position.bottom, 40.0);
    });

    test('fromLTRB constructor with null values', () {
      final position = Position.fromLTRB(null, null, null, null);

      expect(position.left, isNull);
      expect(position.top, isNull);
      expect(position.right, isNull);
      expect(position.bottom, isNull);
    });
  });
}
