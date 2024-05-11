part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState();

  const factory AuthState.idle() = AuthIdle;

  const factory AuthState.loading() = AuthLoading;

  const factory AuthState.successLogin({
    required UserData userData,
  }) = AuthSuccessLogin;

  const factory AuthState.successSignUp({
    required String message,
  }) = AuthSuccessSignUp;

  const factory AuthState.error({
    required String errorMessage,
  }) = AuthError;
}

class AuthIdle extends AuthState {
  const AuthIdle();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthSuccessLogin extends AuthState {
  const AuthSuccessLogin({
    required this.userData,
  });

  final UserData userData;
}

class AuthSuccessSignUp extends AuthState {
  const AuthSuccessSignUp({
    required this.message,
  });

  final String message;

  @override
  String toString() {
    return 'AuthSuccessSignUp {message: $message}';
  }
}

class AuthError extends AuthState {
  const AuthError({
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  String toString() {
    return 'AuthError {errorMessage: $errorMessage}';
  }
}
