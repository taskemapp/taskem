sealed class SessionRepositoryError implements Exception {
  SessionRepositoryError({this.message});

  factory SessionRepositoryError.saveSession({String? message}) =
      SessionRepositorySaveSessionError;

  factory SessionRepositoryError.getSession({String? message}) =
      SessionRepositoryGetSessionError;

  final String? message;
}

class SessionRepositorySaveSessionError extends SessionRepositoryError {
  SessionRepositorySaveSessionError({super.message});
}

class SessionRepositoryGetSessionError extends SessionRepositoryError {
  SessionRepositoryGetSessionError({super.message});
}
