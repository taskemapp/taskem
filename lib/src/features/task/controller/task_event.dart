part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {
  const TaskEvent();

  const factory TaskEvent.getTasks() = _GetUserTasksEvent;

  const factory TaskEvent.assign({
    required String taskId,
    required UserInfoModel userInfoModel,
  }) = _AssignTasksEvent;

  const factory TaskEvent.create({required CreateTaskModel taskModel}) =
      _CreateTaskEvent;
}

class _CreateTaskEvent extends TaskEvent {
  const _CreateTaskEvent({required this.taskModel});

  final CreateTaskModel taskModel;
}

class _AssignTasksEvent extends TaskEvent {
  const _AssignTasksEvent({
    required this.taskId,
    required this.userInfoModel,
  });

  final String taskId;
  final UserInfoModel userInfoModel;
}

class _GetUserTasksEvent extends TaskEvent {
  const _GetUserTasksEvent();
}
