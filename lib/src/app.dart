import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taskem/src/common/behaviours/scroll_without_splash.dart';
import 'package:taskem/src/common/theme/app_theme.dart';
import 'package:taskem/src/common/theme/theme_provider.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';
import 'package:taskem/src/features/initialization/model/dependencies.dart';
import 'package:taskem/src/i18n/translations.g.dart';
import 'package:taskem/src/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    required this.result,
    super.key,
  });

  final InitializationResult result;

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;
        const seedColor = Colors.orange;

        if (lightDynamic != null && darkDynamic != null) {
          lightColorScheme = lightDynamic.harmonized();
          lightColorScheme = lightColorScheme.copyWith(
            surface: const Color(0xffebebeb),
          );

          darkColorScheme = darkDynamic.harmonized();
          darkColorScheme = darkColorScheme.copyWith(
            surface: const Color(0xff1a1a1a),
          );
        } else {
          lightColorScheme = ColorScheme.fromSeed(
            seedColor: seedColor,
          );
          darkColorScheme = ColorScheme.fromSeed(
            seedColor: seedColor,
            surface: const Color(0xff1a1a1a),
            brightness: Brightness.dark,
          );
        }

        return ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
          child: Consumer<ThemeProvider>(
            builder: (
              BuildContext context,
              ThemeProvider value,
              Widget? child,
            ) {
              final theme = context.theme;
              const labelColor = Color(0xFF8b8b8b);

              return Provider(
                create: (context) => result.dependencies,
                child: MaterialApp.router(
                  title: 'Flutter Demo',
                  scrollBehavior: ScrollWithoutSplash(),
                  routerConfig: ScreenRoutes.router,
                  locale: TranslationProvider.of(context).flutterLocale,
                  supportedLocales: AppLocaleUtils.supportedLocales,
                  localizationsDelegates: GlobalMaterialLocalizations.delegates,
                  themeMode: value.themeMode,
                  theme: ThemeData(
                    colorScheme: lightColorScheme,
                    iconTheme: AppTheme.iconThemeData,
                    textTheme: GoogleFonts.notoSansTextTheme().copyWith(
                      headlineLarge: GoogleFonts.inconsolata(),
                      headlineMedium: GoogleFonts.inconsolata(),
                      headlineSmall: GoogleFonts.inconsolata(),
                    ),
                    textButtonTheme: AppTheme.textButtonThemeData,
                    outlinedButtonTheme: AppTheme.outlinedButtonThemeData,
                    filledButtonTheme: AppTheme.filledButtonThemeData,
                    elevatedButtonTheme: AppTheme.elevatedButtonThemeData,
                  ),
                  darkTheme: ThemeData(
                    colorScheme: darkColorScheme,
                    textTheme: GoogleFonts.notoSansTextTheme().copyWith(
                      headlineSmall: GoogleFonts.inconsolata().copyWith(),
                      bodyLarge: GoogleFonts.notoSans().copyWith(),
                      bodyMedium: GoogleFonts.notoSans().copyWith(),
                      bodySmall: GoogleFonts.notoSans().copyWith(),
                      labelLarge: GoogleFonts.notoSans().copyWith(
                        color: labelColor,
                      ),
                      labelMedium: GoogleFonts.notoSans().copyWith(
                        color: labelColor,
                      ),
                      labelSmall: GoogleFonts.notoSans().copyWith(
                        color: labelColor,
                      ),
                    ),
                    iconTheme: AppTheme.iconThemeData.copyWith(
                      color: theme.colorScheme.surface,
                    ),
                    pageTransitionsTheme: AppTheme.pageTransitionTheme,
                    textButtonTheme: AppTheme.textButtonThemeData,
                    outlinedButtonTheme: AppTheme.outlinedButtonThemeData,
                    filledButtonTheme: AppTheme.filledButtonThemeData,
                    elevatedButtonTheme: AppTheme.elevatedButtonThemeData,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
