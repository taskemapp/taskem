import 'package:flutter_test/flutter_test.dart';
import 'package:taskem/src/i18n/translations.g.dart';

void main() {
  group('Validation messages', () {
    test('Should return correct email format error message', () {
      expect(
        AppLocale.ru.build().validator.email,
        'Не правильный формат почты',
      );
    });

    test('Should return correct empty field error message', () {
      expect(
        AppLocale.ru.build().validator.empty,
        'Поле не может быть пустым',
      );
    });

    test('Should return correct password match error message', () {
      expect(
        AppLocale.ru.build().validator.passwordMatch,
        'Пароли не совпадают',
      );
    });

    test('Should return correct username format error message', () {
      expect(
        AppLocale.ru.build().validator.userName,
        'Не правильный формат',
      );
    });
  });
}
