import 'package:taskem/src/features/authorization/controllers/auth_bloc.dart';
import 'package:taskem/src/features/profile/controller/profile_bloc.dart';
import 'package:taskem/src/features/task/controller/task_bloc.dart';
import 'package:taskem/src/features/team/controller/specific_team/specific_team_bloc.dart';
import 'package:taskem/src/features/team/controller/team_task/team_task_bloc.dart';
import 'package:taskem/src/features/team/controller/teams/team_bloc.dart';
import 'package:taskem/src/features/team/controller/user_teams/user_team_bloc.dart';

/// {@template dependencies}
/// Dependencies container
/// {@endtemplate}
base class Dependencies {
  /// {@macro dependencies}
  const Dependencies({
    required this.authBloc,
    required this.teamBloc,
    required this.taskBloc,
    required this.userTeamBloc,
    required this.specificTeamBloc,
    required this.teamTaskBloc,
    required this.profileBloc,
  });

  /// [AuthBloc] instance, used to manage auth.
  final AuthBloc authBloc;
  final TeamBloc teamBloc;
  final TaskBloc taskBloc;
  final UserTeamBloc userTeamBloc;
  final SpecificTeamBloc specificTeamBloc;
  final TeamTaskBloc teamTaskBloc;
  final ProfileBloc profileBloc;
}

/// {@template initialization_result}
/// Result of initialization
/// {@endtemplate}
final class InitializationResult {
  /// {@macro initialization_result}
  const InitializationResult({
    required this.dependencies,
    required this.msSpent,
  });

  /// The dependencies
  final Dependencies dependencies;

  /// The number of milliseconds spent
  final int msSpent;

  @override
  String toString() => '$InitializationResult('
      'dependencies: $dependencies, '
      'msSpent: $msSpent'
      ')';
}
