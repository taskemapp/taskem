part of 'specific_team_bloc.dart';

@immutable
sealed class SpecificTeamState {
  const SpecificTeamState();

  const factory SpecificTeamState.init() = SpecificTeamInitial;

  const factory SpecificTeamState.error({required String message}) =
      SpecificTeamError;

  const factory SpecificTeamState.loaded({
    required TeamModel team,
  }) = SpecificTeamLoaded;
}

final class SpecificTeamInitial extends SpecificTeamState {
  const SpecificTeamInitial();
}

final class SpecificTeamError extends SpecificTeamState {
  const SpecificTeamError({
    required this.message,
  });

  final String message;
}

final class SpecificTeamLoaded extends SpecificTeamState {
  const SpecificTeamLoaded({
    required this.team,
  });

  final TeamModel team;
}
