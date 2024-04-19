part of 'user_team_bloc.dart';

@immutable
sealed class UserTeamState {
  const UserTeamState();

  const factory UserTeamState.init() = UserTeamInitial;

  const factory UserTeamState.userTeamsEmpty() = UserTeamsEmpty;

  const factory UserTeamState.error(String message) = UserTeamError;

  const factory UserTeamState.userLoaded(List<TeamModel> teams) =
      UserTeamsLoaded;
}

final class UserTeamInitial extends UserTeamState {
  const UserTeamInitial();
}

final class UserTeamsEmpty extends UserTeamState {
  const UserTeamsEmpty();
}

final class UserTeamsLoaded extends UserTeamState {
  const UserTeamsLoaded(this.teams);

  final List<TeamModel> teams;
}

final class UserTeamError extends UserTeamState {
  const UserTeamError(this.message);

  final String message;
}
