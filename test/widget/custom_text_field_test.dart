import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taskem/src/core/widgets/custom_text_field.dart';
import 'package:taskem/src/i18n/translations.g.dart';

import 'wrapper.dart';

void main() {
  testWidgets('CustomTextField displays title', (WidgetTester tester) async {
    const titleText = 'Test Title';
    await tester.pumpWidget(
      const Wrapper(
        child: CustomTextField(
          title: titleText,
        ),
      ),
    );
    expect(find.text(titleText), findsOneWidget);
  });

  testWidgets('CustomTextField validates empty field',
      (WidgetTester tester) async {
    final key = GlobalKey<FormState>();
    await tester.pumpWidget(
      Wrapper(
        child: Form(
          key: key,
          child: const CustomTextField(),
        ),
      ),
    );

    key.currentState!.validate();

    await tester.enterText(find.byType(TextFormField), '');
    await tester.pump();

    expect(find.text(AppLocale.ru.build().validator.empty), findsOneWidget);
  });

  testWidgets('CustomTextField toggles password visibility',
      (WidgetTester tester) async {
    final isCupertino = Platform.isMacOS || Platform.isIOS;

    await tester.pumpWidget(
      Wrapper(
        child: CustomTextField.password(
          title: 'Password',
        ),
      ),
    );

    expect(find.byType(TextFormField), findsOneWidget);

    await tester.tap(find.byType(TextFormField));
    await tester.pump();

    expect(
      find.widgetWithIcon(
        GestureDetector,
        isCupertino ? CupertinoIcons.eye : Icons.visibility,
      ),
      findsOneWidget,
    );

    await tester.tap(
      find.byIcon(
        isCupertino ? CupertinoIcons.eye : Icons.visibility,
      ),
    );
    await tester.pump();

    expect(
      find.byIcon(
        isCupertino ? CupertinoIcons.eye_slash : Icons.visibility_off,
      ),
      findsOneWidget,
    );
  });

  testWidgets('CustomTextField reacts to tap', (WidgetTester tester) async {
    var tapped = false;
    await tester.pumpWidget(
      Wrapper(
        child: CustomTextField(
          onTap: () => tapped = true,
        ),
      ),
    );
    await tester.tap(find.byType(TextFormField));
    expect(tapped, isTrue);
  });
}
