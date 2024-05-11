import 'dart:async';
import 'dart:convert';

import 'package:animations/animations.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taskem/src/common/behaviours/scroll_without_splash.dart';
import 'package:taskem/src/common/theme/app_theme.dart';
import 'package:taskem/src/common/theme/theme_provider.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';
import 'package:taskem/src/features/authorization/screens/sign_in_screen.dart';
import 'package:taskem/src/features/authorization/screens/sign_up_screen.dart';
import 'package:taskem/src/features/home/screens/home_screen.dart';
import 'package:taskem/src/features/initialization/model/dependencies.dart';
import 'package:taskem/src/features/root_screen.dart';
import 'package:taskem/src/features/shared/model/user_info_model.dart';
import 'package:taskem/src/features/task/screens/create_task_screen.dart';
import 'package:taskem/src/features/team/screens/root_teams_screen.dart';
import 'package:taskem/src/features/team/screens/team_screen.dart';
import 'package:taskem/src/i18n/translations.g.dart';
import 'package:taskem/src/routes/go_router_refresh_stream.dart';
import 'package:taskem/src/routes/routes.dart';
import 'package:taskem/src/routes/screen_route_builder.dart';

class App extends StatefulWidget {
  const App({
    required this.result,
    super.key,
  });

  final InitializationResult result;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late GoRouter _router;
  late LoggedInState loggedInState;

  @override
  void initState() {
    super.initState();
    loggedInState = LoggedInState.seeded(null);
    _router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: ScreenRoutes.signIn.goPath,
      refreshListenable: GoRouterRefreshStream(loggedInState.stream),
      redirect: (context, state) {
        if (state.uri.path.contains(ScreenRoutes.signIn.path) ||
            state.uri.path.contains(ScreenRoutes.signUp.path)) {
          return null;
        }
        if (loggedInState.state != null) {
          return null;
        }
        return ScreenRouteBuilder().path(ScreenRoutes.signIn).build();
      },
      routes: [
        GoRoute(
          path: '/',
          redirect: (context, state) {
            return ScreenRouteBuilder().path(ScreenRoutes.home).build();
          },
        ),
        StatefulShellRoute.indexedStack(
          pageBuilder: (
            context,
            state,
            navigationShell,
          ) {
            return CustomTransitionPage(
              child: MultiProvider(
                providers: [
                  Provider(
                    create: (context) =>
                        context.read<Dependencies>().profileBloc,
                  ),
                ],
                child: RootScreen(
                  navigationShell: navigationShell,
                ),
              ),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: ScreenRoutes.home.goPath,
                  pageBuilder: (context, state) {
                    return CustomTransitionPage(
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        return SharedAxisTransition(
                          animation: animation,
                          secondaryAnimation: secondaryAnimation,
                          transitionType: SharedAxisTransitionType.horizontal,
                          child: child,
                        );
                      },
                      child: MultiProvider(
                        providers: [
                          Provider(
                            create: (context) =>
                                context.read<Dependencies>().taskBloc,
                          ),
                        ],
                        child: const HomeScreen(),
                      ),
                    );
                  },
                  // routes: [
                  //   GoRoute(
                  //     name: ScreenRoutes.profile.name,
                  //     path: ScreenRoutes.profile.goPath,
                  //     pageBuilder: (context, state) {
                  //       return CustomTransitionPage(
                  //         transitionsBuilder: (
                  //           context,
                  //           animation,
                  //           secondaryAnimation,
                  //           child,
                  //         ) {
                  //           return SharedAxisTransition(
                  //             animation: animation,
                  //             secondaryAnimation: secondaryAnimation,
                  //             transitionType: SharedAxisTransitionType.horizontal,
                  //             child: child,
                  //           );
                  //         },
                  //         child: MultiProvider(
                  //           providers: [
                  //             Provider(
                  //               create: (context) => context
                  //                   .read<Dependencies>()
                  //                   .profileAvatarCubit,
                  //             ),
                  //           ],
                  //           child: const ProfileScreen(),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: ScreenRoutes.teams.goPath,
                  routes: [
                    GoRoute(
                      path: ScreenRoutes.team.goPath,
                      routes: [
                        GoRoute(
                          path: ScreenRoutes.createTask.goPath,
                          name: ScreenRoutes.createTask.name,
                          pageBuilder: (context, state) {
                            final id = state.pathParameters['id'];
                            final members = state.extra! as List<UserInfoModel>;
                            return CustomTransitionPage(
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) {
                                return SharedAxisTransition(
                                  animation: animation,
                                  secondaryAnimation: secondaryAnimation,
                                  transitionType:
                                      SharedAxisTransitionType.horizontal,
                                  child: child,
                                );
                              },
                              child: Provider(
                                create: (context) =>
                                    context.read<Dependencies>().taskBloc,
                                child: CreateTaskScreen(
                                  teamId: id ?? '',
                                  members: members,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                      pageBuilder: (context, state) {
                        final id = state.pathParameters['id'];
                        return CustomTransitionPage(
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) {
                            return SharedAxisTransition(
                              animation: animation,
                              secondaryAnimation: secondaryAnimation,
                              transitionType:
                                  SharedAxisTransitionType.horizontal,
                              child: child,
                            );
                          },
                          child: MultiProvider(
                            providers: [
                              Provider(
                                create: (context) => context
                                    .read<Dependencies>()
                                    .specificTeamBloc,
                              ),
                              Provider(
                                create: (context) =>
                                    context.read<Dependencies>().teamTaskBloc,
                              ),
                            ],
                            child: TeamScreen(id: id ?? ''),
                          ),
                        );
                      },
                    ),
                  ],
                  pageBuilder: (context, state) {
                    return CustomTransitionPage(
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        return SharedAxisTransition(
                          animation: animation,
                          secondaryAnimation: secondaryAnimation,
                          transitionType: SharedAxisTransitionType.horizontal,
                          child: child,
                        );
                      },
                      child: MultiProvider(
                        providers: [
                          Provider(
                            create: (context) =>
                                context.read<Dependencies>().teamBloc,
                          ),
                          Provider(
                            create: (context) =>
                                context.read<Dependencies>().userTeamBloc,
                          ),
                        ],
                        child: const RootTeamsScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          name: ScreenRoutes.signIn.name,
          path: ScreenRoutes.signIn.goPath,
          builder: (context, state) => Provider(
            create: (context) => context.read<Dependencies>().authBloc,
            child: const SignInScreen(),
          ),
        ),
        GoRoute(
          name: ScreenRoutes.signUp.name,
          path: ScreenRoutes.signUp.goPath,
          builder: (context, state) => Provider(
            create: (context) => context.read<Dependencies>().authBloc,
            child: const SignUpScreen(),
          ),
        ),
      ],
    );
  }

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
          darkColorScheme = darkColorScheme.copyWith();
        } else {
          lightColorScheme = ColorScheme.fromSeed(
            seedColor: seedColor,
          );
          darkColorScheme = ColorScheme.fromSeed(
            seedColor: seedColor,
            // surface: const Color(0xff1a1a1a),
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

              return MultiProvider(
                providers: [
                  Provider.value(
                    value: widget.result.dependencies,
                  ),
                  Provider.value(
                    value: loggedInState,
                  ),
                ],
                child: MaterialApp.router(
                  title: 'Flutter Demo',
                  scrollBehavior: ScrollWithoutSplash(),
                  themeAnimationCurve: Curves.easeInOutExpo,
                  routerConfig: _router,
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

abstract class StateStream<T> {
  StateStream();

  StateStream.seeded(T value) : state = value {
    _controller.add(value);
  }

  final StreamController<T> _controller = StreamController<T>();
  late T state;

  Stream<T> get stream => _controller.stream;

  void emit(T state) {
    this.state = state;
    _controller.add(state);
  }

  void dispose() {
    _controller.close();
  }
}

class LoggedInState extends StateStream<UserData?> {
  LoggedInState();

  LoggedInState.seeded(super.value) : super.seeded();
}

final class UserData {
  UserData({
    required this.name,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'] as String,
      token: json['token'] as String,
    );
  }

  String toJson() {
    return jsonEncode({
      'name': name,
      'token': token,
    });
  }

  final String name;
  final String token;
}
