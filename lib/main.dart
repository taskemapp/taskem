import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:taskem/src/app.dart';
import 'package:taskem/src/features/initialization/logic/initialization_processor.dart';
import 'package:taskem/src/features/initialization/model/environment_store.dart';
import 'package:taskem/src/i18n/translations.g.dart';

Future<void> main() async {
  final talker = Talker(logger: TalkerLogger(output: log));
  Bloc.observer = TalkerBlocObserver();

  FlutterError.onError = (FlutterErrorDetails details) {
    talker.handle(details.exception, details.stack);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    talker.handle(error, stack);
    return true;
  };

  await runZonedGuarded(
    () async {
      // LocaleSettings.setLocale(AppLocale.en);

      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized()
        ..deferFirstFrame();

      final processor = InitializationProcessor(
        environmentStore: const EnvironmentStore(),
        talker: talker,
      );

      final result = await processor.initialize();

      await GoogleFonts.pendingFonts();
      WidgetsFlutterBinding.ensureInitialized();
      LocaleSettings.useDeviceLocale();
      Intl.defaultLocale = 'ru';
      await initializeDateFormatting('ru');
      GoogleFonts.config.allowRuntimeFetching = true;
      // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      Animate.restartOnHotReload = true;

      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      widgetsBinding.allowFirstFrame();
      runApp(
        TranslationProvider(
          child: MyApp(
            result: result,
          ),
        ),
      );
    },
    talker.handle,
  );
}
