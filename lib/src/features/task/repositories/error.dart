sealed class TaskRepositoryError implements Exception {
  TaskRepositoryError(this.message);

  factory TaskRepositoryError.getAllForTeam({String? message}) =>
      TaskRepositoryGetAllForTeamError(
        message ?? 'Error fetching tasks for team',
      );

  factory TaskRepositoryError.permissionDenied({String? message}) =>
      TaskRepositoryPermissionDeniedError(
        message ?? 'Permission denied',
      );

  final String? message;

  @override
  String toString() => 'TaskRepositoryError: $message';
}

final class TaskRepositoryGetAllForTeamError extends TaskRepositoryError {
  TaskRepositoryGetAllForTeamError(super.message);
}

final class TaskRepositoryPermissionDeniedError extends TaskRepositoryError {
  TaskRepositoryPermissionDeniedError(super.message);
}
