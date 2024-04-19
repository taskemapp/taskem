part of 'team_bloc.dart';

@immutable
sealed class TeamState {
  const TeamState();

  const factory TeamState.init() = TeamInitial;

  const factory TeamState.empty() = TeamsEmpty;

  const factory TeamState.loaded(List<TeamModel> teams) = TeamsLoaded;

  const factory TeamState.error(String message) = TeamError;

  const factory TeamState.created(String message) = TeamCreated;

  const factory TeamState.joined(String message) = TeamError;
}

final class TeamInitial extends TeamState {
  const TeamInitial();
}

final class TeamsEmpty extends TeamState {
  const TeamsEmpty();
}

final class TeamsLoaded extends TeamState {
  const TeamsLoaded(this.teams);

  final List<TeamModel> teams;
}

final class TeamError extends TeamState {
  const TeamError(this.message);

  final String message;
}

final class TeamCreated extends TeamState {
  const TeamCreated(this.message);

  final String message;
}

final class TeamJoined extends TeamState {
  const TeamJoined(this.message);

  final String message;
}
