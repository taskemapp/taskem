import 'package:flutter_test/flutter_test.dart';
import 'package:taskem/src/i18n/translations.g.dart';

void main() {
  group('Team messages', () {
    test('Should return correct team not found message', () {
      expect(
        AppLocale.ru.build().team.notFound,
        'Вы пока не присоединились ни к одной команде',
      );
    });

    test('Should return correct create team message', () {
      expect(
        AppLocale.ru.build().team.create,
        'Создать команду',
      );
    });

    test('Should return correct join team message', () {
      expect(
        AppLocale.ru.build().team.join,
        'Присоединиться к уже существующей',
      );
    });
  });
}
