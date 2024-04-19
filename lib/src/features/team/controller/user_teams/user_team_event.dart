part of 'user_team_bloc.dart';

@immutable
sealed class UserTeamEvent {
  const UserTeamEvent();

  const factory UserTeamEvent.getUserTeams() = _GetUserTeamsEvent;
}

class _GetUserTeamsEvent extends UserTeamEvent {
  const _GetUserTeamsEvent();
}
