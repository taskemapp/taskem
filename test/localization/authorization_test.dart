import 'package:flutter_test/flutter_test.dart';
import 'package:taskem/src/i18n/translations.g.dart';

void main() {
  group('Authorization messages', () {
    test('Field labels are correct', () {
      expect(
        AppLocale.ru.build().authorization.field.email,
        'Эл. почта',
      );
      expect(
        AppLocale.ru.build().authorization.field.userName,
        'Имя пользователя',
      );
      expect(
        AppLocale.ru.build().authorization.field.password,
        'Пароль',
      );
      expect(
        AppLocale.ru.build().authorization.field.repeatPassword,
        'Повторите пароль',
      );
    });

    test('Should return correct account creation message', () {
      expect(
        AppLocale.ru.build().authorization.accountCreated,
        'Аккаунт создан успешно',
      );
    });

    test('Should return correct login and registration prompts', () {
      expect(
        AppLocale.ru.build().authorization.login,
        'Войти',
      );
      expect(
        AppLocale.ru.build().authorization.noAccount,
        'Нет аккаунта?',
      );
      expect(
        AppLocale.ru.build().authorization.haveAccount,
        'Есть аккаунт?',
      );
      expect(
        AppLocale.ru.build().authorization.registration,
        'Зарегистрироваться',
      );
    });
  });
}
