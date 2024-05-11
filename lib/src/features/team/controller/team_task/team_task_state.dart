part of 'team_task_bloc.dart';

@immutable
sealed class TeamTaskState {
  const TeamTaskState();

  const factory TeamTaskState.init() = TeamTaskInitial;

  const factory TeamTaskState.error() = TeamTaskError;

  const factory TeamTaskState.assignError() = TeamTaskAssignError;

  const factory TeamTaskState.assignPermissionDeniedError() =
      TeamTaskAssignPermissionDeniedError;

  const factory TeamTaskState.loaded({required List<TaskModel> tasks}) =
      TeamTaskLoaded;

  const factory TeamTaskState.completed() = TeamTaskCompleted;
  const factory TeamTaskState.assign() = TeamTaskAssigned;
}

final class TeamTaskInitial extends TeamTaskState {
  const TeamTaskInitial();
}

final class TeamTaskError extends TeamTaskState {
  const TeamTaskError();
}

final class TeamTaskAssignPermissionDeniedError extends TeamTaskState {
  const TeamTaskAssignPermissionDeniedError();
}

final class TeamTaskAssignError extends TeamTaskState {
  const TeamTaskAssignError();
}

final class TeamTaskLoaded extends TeamTaskState {
  const TeamTaskLoaded({required this.tasks});

  final List<TaskModel> tasks;
}

final class TeamTaskCompleted extends TeamTaskState {
  const TeamTaskCompleted();
}

final class TeamTaskAssigned extends TeamTaskState {
  const TeamTaskAssigned();
}
