sealed class TeamRepositoryError implements Exception {
  TeamRepositoryError(this.message);

  factory TeamRepositoryError.join({String? message}) =>
      TeamRepositoryJoinError(
        message ?? 'Error join in team',
      );

  final String? message;

  @override
  String toString() => 'TaskRepositoryError: $message';
}

final class TeamRepositoryJoinError extends TeamRepositoryError {
  TeamRepositoryJoinError(super.message);
}
