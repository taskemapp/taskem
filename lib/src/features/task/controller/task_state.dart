part of 'task_bloc.dart';

@immutable
sealed class TaskState {
  const TaskState();

  const factory TaskState.init() = TaskInitial;

  const factory TaskState.error() = TaskError;

  const factory TaskState.created() = TaskCreated;

  const factory TaskState.assigned() = TaskAssigned;

  const factory TaskState.loaded({required List<TaskModel> tasks}) = TaskLoaded;
}

final class TaskInitial extends TaskState {
  const TaskInitial();
}

final class TaskError extends TaskState {
  const TaskError();
}

final class TaskCreated extends TaskState {
  const TaskCreated();
}

final class TaskAssigned extends TaskState {
  const TaskAssigned();
}

final class TaskLoaded extends TaskState {
  const TaskLoaded({required this.tasks});

  final List<TaskModel> tasks;
}
