import 'package:flutter_test/flutter_test.dart';
import 'package:heartsync/core/utils/validators.dart';

void main() {
  group('Email validation', () {
    test('accepts valid email addresses', () {
      expect(isValidEmail('user@example.com'), isTrue);
      expect(isValidEmail('user.name+tag@sub.domain.com'), isTrue);
    });

    test('rejects invalid email addresses', () {
      expect(isValidEmail(''), isFalse);
      expect(isValidEmail('plain-text'), isFalse);
      expect(isValidEmail('user@'), isFalse);
      expect(isValidEmail('@example.com'), isFalse);
    });
  });
}
