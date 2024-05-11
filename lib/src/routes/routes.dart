import 'package:taskem/src/features/authorization/screens/sign_in_screen.dart';
import 'package:taskem/src/features/authorization/screens/sign_up_screen.dart';
import 'package:taskem/src/features/home/screens/home_screen.dart';
import 'package:taskem/src/features/task/screens/create_task_screen.dart';
import 'package:taskem/src/features/team/screens/root_teams_screen.dart';
import 'package:taskem/src/features/team/screens/team_screen.dart';
import 'package:taskem/src/routes/screen_route.dart';

/// [ScreenRoutes] class defines static getters to retrieve instances
/// of the [ScreenRoute].
/// Each method returns a unique route with
/// a specified 'name' and 'path'.
abstract final class ScreenRoutes {
  ///[SignInScreen] route
  static ScreenRoute get signIn => ScreenRoute(
        name: 'signIn',
        path: 'signIn',
        goPath: '/signIn',
      );

  ///[SignUpScreen] route
  static ScreenRoute get signUp => ScreenRoute(
        name: 'signUp',
        path: 'signUp',
        goPath: '/signUp',
      );

  ///[HomeScreen] route
  static ScreenRoute get home => ScreenRoute(
        name: 'home',
        path: 'home',
        goPath: '/home',
      );

  ///[RootTeamsScreen] route
  static ScreenRoute get teams => ScreenRoute(
        name: 'teams',
        path: 'teams',
        goPath: '/teams',
      );

  ///[TeamScreen] route
  static ScreenRoute get team => ScreenRoute(
        name: 'team',
        path: 'teams',
        goPath: ':id',
      );

  ///[CreateTaskScreen] route
  static ScreenRoute get createTask => ScreenRoute(
        name: 'createTask',
        path: 'create',
        goPath: 'create',
      );

  ///[ProfileScreen] route
  static ScreenRoute get profile => ScreenRoute(
        name: 'profile',
        path: 'profile',
        goPath: 'profile',
      );
}
