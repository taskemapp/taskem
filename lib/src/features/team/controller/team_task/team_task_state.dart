part of 'team_task_bloc.dart';

@immutable
sealed class TeamTaskState {
  const TeamTaskState();

  const factory TeamTaskState.init() = TeamTaskInitial;

  const factory TeamTaskState.error() = TeamTaskError;

  const factory TeamTaskState.loaded({required List<TaskModel> tasks}) =
      TeamTaskLoaded;
}

final class TeamTaskInitial extends TeamTaskState {
  const TeamTaskInitial();
}

final class TeamTaskError extends TeamTaskState {
  const TeamTaskError();
}

final class TeamTaskLoaded extends TeamTaskState {
  const TeamTaskLoaded({required this.tasks});

  final List<TaskModel> tasks;
}
