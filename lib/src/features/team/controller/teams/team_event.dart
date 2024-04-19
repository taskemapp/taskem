part of 'team_bloc.dart';

@immutable
sealed class TeamEvent {
  const TeamEvent();

  const factory TeamEvent.getTeams() = _GetTeamsEvent;

  const factory TeamEvent.create({
    required String name,
    required String description,
  }) = _CreateTeamEvent;

  const factory TeamEvent.join({
    required String teamId,
    required String creator,
  }) = _JoinTeamEvent;
}

class _GetTeamsEvent extends TeamEvent {
  const _GetTeamsEvent();
}

class _CreateTeamEvent extends TeamEvent {
  const _CreateTeamEvent({
    required this.name,
    required this.description,
  });

  final String name;
  final String description;
}

class _JoinTeamEvent extends TeamEvent {
  const _JoinTeamEvent({
    required this.teamId,
    required this.creator,
  });

  final String teamId;
  final String creator;
}
