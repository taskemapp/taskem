part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();

  const factory AuthEvent.signIn({
    required String email,
    required String password,
  }) = _AuthEventSignIn;

  const factory AuthEvent.signUp({
    required String userName,
    required String email,
    required String password,
  }) = _AuthEventSignUp;
}

class _AuthEventSignIn extends AuthEvent {
  const _AuthEventSignIn({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class _AuthEventSignUp extends AuthEvent {
  const _AuthEventSignUp({
    required this.userName,
    required this.email,
    required this.password,
  });

  final String userName;

  final String email;
  final String password;
}
