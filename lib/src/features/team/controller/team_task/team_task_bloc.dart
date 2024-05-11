import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskem/src/features/task/models/task_model.dart';
import 'package:taskem/src/features/task/repositories/error.dart';
import 'package:taskem/src/features/task/repositories/task_repository.dart';

part 'team_task_event.dart';
part 'team_task_state.dart';

class TeamTaskBloc extends Bloc<TeamTaskEvent, TeamTaskState> {
  TeamTaskBloc({required TaskRepository taskRepository})
      : _taskRepository = taskRepository,
        super(const TeamTaskInitial()) {
    on<TeamTaskEvent>(
      (event, emit) => switch (event) {
        _GetTeamTasksEvent() => _onGetTeamTasksEvent(event, emit),
        _AssignTeamTasksEvent() => _onAssignTeamTask(event, emit),
        _CompleteTaskEvent() => _onCompleteTeamTask(event, emit),
      },
    );
  }

  final TaskRepository _taskRepository;

  Future<void> _onGetTeamTasksEvent(
    _GetTeamTasksEvent event,
    Emitter<TeamTaskState> emit,
  ) async {
    try {
      emit(
        const TeamTaskState.init(),
      );
      final response = await _taskRepository.getAllForTeam(
        event.teamId,
      );
      emit(
        TeamTaskState.loaded(tasks: response),
      );
    } catch (e) {
      emit(const TeamTaskState.error());
    }
  }

  Future<void> _onCompleteTeamTask(
    _CompleteTaskEvent event,
    Emitter<TeamTaskState> emit,
  ) async {
    try {
      await _taskRepository.complete(
        event.taskId,
      );
      emit(
        const TeamTaskState.completed(),
      );
    } catch (_) {
      emit(const TeamTaskState.error());
      rethrow;
    }
  }

  Future<void> _onAssignTeamTask(
    _AssignTeamTasksEvent event,
    Emitter<TeamTaskState> emit,
  ) async {
    try {
      await _taskRepository.assign(
        event.taskId,
        event.userId,
      );
      emit(
        const TeamTaskState.assign(),
      );
      final response = await _taskRepository.getAllForTeam(event.teamId);
      emit(
        TeamTaskState.loaded(tasks: response),
      );
    } on TaskRepositoryPermissionDeniedError catch (_) {
      emit(const TeamTaskState.error());
      rethrow;
    } on TaskRepositoryGetAllForTeamError catch (_) {
      emit(const TeamTaskState.assignPermissionDeniedError());
      rethrow;
    } catch (_) {
      emit(const TeamTaskState.assignError());
      rethrow;
    }
  }
}
