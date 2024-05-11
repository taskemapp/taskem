import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskem/src/features/shared/model/user_info_model.dart';
import 'package:taskem/src/features/task/models/create_task_model.dart';
import 'package:taskem/src/features/task/models/task_model.dart';
import 'package:taskem/src/features/task/repositories/error.dart';
import 'package:taskem/src/features/task/repositories/task_repository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc({required TaskRepository taskRepository})
      : _taskRepository = taskRepository,
        super(const TaskInitial()) {
    on<TaskEvent>(
      (event, emit) => switch (event) {
        _CreateTaskEvent() => _onCreateTask(event, emit),
        _GetUserTasksEvent() => _onGetUserTasksEvent(event, emit),
        _AssignTasksEvent() => _onAssignTask(event, emit),
      },
    );
  }

  final TaskRepository _taskRepository;

  Future<void> _onGetUserTasksEvent(
    _GetUserTasksEvent event,
    Emitter<TaskState> emit,
  ) async {
    try {
      emit(const TaskState.init());
      final response = await _taskRepository.getAllForUser();
      emit(TaskState.loaded(tasks: response));
    } catch (_) {
      emit(const TaskState.error());
      rethrow;
    }
  }

  Future<void> _onAssignTask(
    _AssignTasksEvent event,
    Emitter<TaskState> emit,
  ) async {
    try {
      await _taskRepository.assign(
        event.taskId,
        event.userInfoModel.id,
      );
      emit(const TaskState.created());
    } catch (_) {
      emit(const TaskState.error());
      rethrow;
    }
  }

  Future<void> _onCreateTask(
    _CreateTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    try {
      emit(const TaskState.init());
      await _taskRepository.create(
        event.taskModel,
      );
      emit(const TaskState.created());
    } on TaskRepositoryPermissionDeniedError catch (_) {
      emit(const TaskState.permissionDenied());
      rethrow;
    } catch (_) {
      emit(const TaskState.error());
      rethrow;
    }
  }
}
