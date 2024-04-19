part of 'specific_team_bloc.dart';

@immutable
sealed class SpecificTeamEvent {
  const SpecificTeamEvent();

  const factory SpecificTeamEvent.getTeam({
    required String teamId,
  }) = _GetSpecificTeam;
}

class _GetSpecificTeam extends SpecificTeamEvent {
  const _GetSpecificTeam({required this.teamId});

  final String teamId;
}
