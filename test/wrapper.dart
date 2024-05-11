import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskem/src/common/theme/app_theme.dart';
import 'package:taskem/src/i18n/translations.g.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TranslationProvider(
      child: Builder(
        builder: (context) {
          return MaterialApp(
            locale: TranslationProvider.of(context).flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            theme: ThemeData.from(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.green,
              ),
              textTheme: GoogleFonts.notoSansTextTheme().copyWith(
                headlineSmall: GoogleFonts.inconsolata(),
                bodyLarge: GoogleFonts.notoSans(),
                bodyMedium: GoogleFonts.notoSans(),
                bodySmall: GoogleFonts.notoSans(),
                labelLarge: GoogleFonts.notoSans(),
                labelMedium: GoogleFonts.notoSans(),
                labelSmall: GoogleFonts.notoSans(),
              ),
            ).copyWith(
              iconTheme: AppTheme.iconThemeData,
              pageTransitionsTheme: AppTheme.pageTransitionTheme,
              textButtonTheme: AppTheme.textButtonThemeData,
              outlinedButtonTheme: AppTheme.outlinedButtonThemeData,
              filledButtonTheme: AppTheme.filledButtonThemeData,
              elevatedButtonTheme: AppTheme.elevatedButtonThemeData,
            ),
            home: Scaffold(body: child),
          );
        },
      ),
    );
  }
}
