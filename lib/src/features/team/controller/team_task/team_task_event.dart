part of 'team_task_bloc.dart';

@immutable
sealed class TeamTaskEvent {
  const TeamTaskEvent();

  const factory TeamTaskEvent.getTasks({required String teamId}) =
      _GetTeamTasksEvent;

  const factory TeamTaskEvent.complete({required String taskId}) =
      _CompleteTaskEvent;

  const factory TeamTaskEvent.assign({
    required String taskId,
    required String teamId,
    required String userId,
  }) = _AssignTeamTasksEvent;
}

final class _AssignTeamTasksEvent extends TeamTaskEvent {
  const _AssignTeamTasksEvent({
    required this.taskId,
    required this.teamId,
    required this.userId,
  });

  final String taskId;
  final String teamId;
  final String userId;
}

final class _GetTeamTasksEvent extends TeamTaskEvent {
  const _GetTeamTasksEvent({required this.teamId});

  final String teamId;
}

final class _CompleteTaskEvent extends TeamTaskEvent {
  const _CompleteTaskEvent({required this.taskId});

  final String taskId;
}
