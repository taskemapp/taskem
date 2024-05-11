import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grpc/grpc.dart';
import 'package:taskem/src/core/helpers/session_mixin.dart';
import 'package:taskem/src/features/task/models/create_task_model.dart';
import 'package:taskem/src/features/task/models/task_model.dart';
import 'package:taskem/src/features/task/repositories/error.dart';
import 'package:taskem/src/generated/task/google/protobuf/empty.pb.dart';
import 'package:taskem/src/generated/task/google/protobuf/timestamp.pb.dart';
import 'package:taskem/src/generated/task/task.pbgrpc.dart';

class TaskRepository with Session {
  TaskRepository({
    required TaskClient channel,
    required FlutterSecureStorage storage,
    required String storageSessionKey,
  })  : _stub = channel,
        _storageSessionKey = storageSessionKey,
        _storage = storage;

  final TaskClient _stub;
  final FlutterSecureStorage _storage;
  final String _storageSessionKey;

  Future<void> create(CreateTaskModel model) async {
    try {
      final option = await getOption(
        _storage,
        _storageSessionKey,
      );
      final request = CreateTaskRequest(
        teamId: model.teamId,
        description: model.description,
        name: model.name,
        endTimestamp: Timestamp.fromDateTime(model.endDateTime),
      );

      await _stub.create(
        request,
        options: option,
      );
    } on GrpcError catch (e, st) {
      if (e.code == StatusCode.permissionDenied) {
        Error.throwWithStackTrace(
          TaskRepositoryError.permissionDenied(),
          st,
        );
      }
      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<TaskModel>> getAllForUser() async {
    try {
      final option = await getOption(
        _storage,
        _storageSessionKey,
      );
      final response = await _stub.getAllForUser(
        Empty(),
        options: option,
      );
      return response.tasks.map(TaskModel.from).toList();
    } catch (_) {
      rethrow;
    }
  }

  Future<List<TaskModel>> getAllForTeam(String teamId) async {
    try {
      final option = await getOption(
        _storage,
        _storageSessionKey,
      );
      final response = await _stub.getAllForTeam(
        GetTeamTasksRequest(
          teamId: teamId,
        ),
        options: option,
      );
      return response.tasks.map(TaskModel.from).toList();
    } on GrpcError catch (e, st) {
      if (e.code == StatusCode.permissionDenied) {
        Error.throwWithStackTrace(
          TaskRepositoryError.permissionDenied(),
          st,
        );
      }
      rethrow;
    } catch (e, st) {
      Error.throwWithStackTrace(
        TaskRepositoryError.getAllForTeam(),
        st,
      );
    }
  }

  Future<TaskModel> get(String taskId) async {
    try {
      final option = await getOption(
        _storage,
        _storageSessionKey,
      );
      final response = await _stub.get(
        GetTaskRequest(id: taskId),
        options: option,
      );
      return TaskModel.from(response);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> complete(String taskId) async {
    try {
      final option = await getOption(
        _storage,
        _storageSessionKey,
      );
      await _stub.complete(
        CompleteTaskRequest(
          taskId: taskId,
        ),
        options: option,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<TaskModel> assign(String taskId, String userId) async {
    try {
      final option = await getOption(
        _storage,
        _storageSessionKey,
      );
      final response = await _stub.assign(
        AssignTaskRequest(
          taskId: taskId,
          userId: userId,
        ),
        options: option,
      );
      return TaskModel.from(response);
    } catch (_) {
      rethrow;
    }
  }
}
