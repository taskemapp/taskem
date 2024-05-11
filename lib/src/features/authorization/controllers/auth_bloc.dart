import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';
import 'package:taskem/src/app.dart';
import 'package:taskem/src/core/helpers/session_mixin.dart';
import 'package:taskem/src/features/authorization/models/login_model.dart';
import 'package:taskem/src/features/authorization/models/sign_up_model.dart';
import 'package:taskem/src/features/authorization/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with Session {
  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthState.idle()) {
    on<AuthEvent>(
      (event, emit) => switch (event) {
        _AuthEventSignIn() => _onLogin(event, emit),
        _AuthEventSignUp() => _onSignUp(event, emit),
      },
    );
  }

  final AuthRepository _authRepository;

  Future<void> _onLogin(
    _AuthEventSignIn event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthState.loading());

      await Future<void>.delayed(
        const Duration(milliseconds: 300),
      );

      final email = event.email;
      final password = event.password;

      final userData = await _authRepository.login(
        LoginModel(
          email: email,
          password: password,
        ),
      );
      emit(
        AuthState.successLogin(
          userData: userData,
        ),
      );
    } on GrpcError catch (e) {
      emit(
        AuthState.error(
          errorMessage: e.message ?? 'Fetch error',
        ),
      );
      rethrow;
    } catch (e, _) {
      emit(
        AuthState.error(
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }

  Future<void> _onSignUp(
    _AuthEventSignUp event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthState.loading());

      await Future<void>.delayed(
        const Duration(milliseconds: 300),
      );

      final email = event.email;
      final userName = event.userName;
      final password = event.password;

      final message = await _authRepository.signUp(
        SignUpModel(
          email: email,
          userName: userName,
          password: password,
        ),
      );
      emit(
        AuthState.successSignUp(
          message: message,
        ),
      );
    } on GrpcError catch (e) {
      emit(
        AuthState.error(
          errorMessage: e.message ?? 'Fetch error',
        ),
      );
      rethrow;
    } catch (e) {
      emit(
        AuthState.error(
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }
}
