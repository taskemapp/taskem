import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:taskem/src/features/authorization/screens/sign_in_screen.dart';
import 'package:taskem/src/features/authorization/screens/sign_up_screen.dart';
import 'package:taskem/src/features/home/screens/home_screen.dart';
import 'package:taskem/src/features/initialization/model/dependencies.dart';
import 'package:taskem/src/features/root_screen.dart';
import 'package:taskem/src/features/shared/model/user_info_model.dart';
import 'package:taskem/src/features/task/screens/create_task_screen.dart';
import 'package:taskem/src/features/team/screens/root_teams_screen.dart';
import 'package:taskem/src/features/team/screens/team_screen.dart';

/// [ScreenRoutes] class defines static getters to retrieve instances
/// of the [ScreenRoute].
/// Each method returns a unique route with
/// a specified 'name' and 'path'.
abstract final class ScreenRoutes {
  ///[SignInScreen] route
  static ScreenRoute get signIn => ScreenRoute(
        name: 'signIn',
        path: '/signIn',
        goPath: '/signIn',
      );

  ///[SignUpScreen] route
  static ScreenRoute get signUp => ScreenRoute(
        name: 'signUp',
        path: '/signUp',
        goPath: '/signUp',
      );

  ///[HomeScreen] route
  static ScreenRoute get home => ScreenRoute(
        name: 'home',
        path: '/home',
        goPath: '/home',
      );

  ///[RootTeamsScreen] route
  static ScreenRoute get teams => ScreenRoute(
        name: 'teams',
        path: '/teams',
        goPath: '/teams',
      );

  ///[TeamScreen] route
  static ScreenRoute get team => ScreenRoute(
        name: 'team',
        path: '/teams',
        goPath: ':id',
      );

  ///[CreateTaskScreen] route
  static ScreenRoute get createTask => ScreenRoute(
        name: 'createTask',
        path: '/team/:id/create',
        goPath: 'create',
      );

  static GoRouter get router => _router;

  ///todo сюда запихать демпенденси сеттером

  static final _router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: ScreenRoutes.signIn.path,
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) {
          return ScreenRoutes.home.path;
        },
      ),
      StatefulShellRoute.indexedStack(
        pageBuilder: (
          context,
          state,
          navigationShell,
        ) {
          return CustomTransitionPage(
            child: RootScreen(
              navigationShell: navigationShell,
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
                builder: (context, state) => MultiProvider(
                  providers: [
                    Provider(
                      create: (context) =>
                          context.read<Dependencies>().taskBloc,
                    ),
                  ],
                  child: const HomeScreen(),
                ),
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
                            transitionType: SharedAxisTransitionType.horizontal,
                            child: child,
                          );
                        },
                        child: MultiProvider(
                          providers: [
                            Provider(
                              create: (context) =>
                                  context.read<Dependencies>().specificTeamBloc,
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

/// The [ScreenRoute] class represents a model
/// for defining routes in the application.
final class ScreenRoute {
  ///Constructor
  ScreenRoute({
    required this.name,
    required this.path,
    required this.goPath,
  });

  ///Route name
  final String name;

  ///Route path
  final String path;

  ///Path in [GoRoute] path
  final String goPath;
}
