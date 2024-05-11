import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taskem/src/app.dart';
import 'package:taskem/src/features/authorization/models/login_model.dart';
import 'package:taskem/src/features/authorization/models/sign_up_model.dart';
import 'package:taskem/src/features/initialization/model/environment_store.dart';
import 'package:taskem/src/generated/auth/auth.pbgrpc.dart';

class AuthRepository {
  AuthRepository({
    required AuthClient channel,
    required FlutterSecureStorage storage,
    required EnvironmentStore store,
  })  : _stub = channel,
        _store = store,
        _storage = storage;

  final AuthClient _stub;

  final FlutterSecureStorage _storage;

  final EnvironmentStore _store;

  Future<UserData> login(LoginModel loginModel) async {
    try {
      final request =
          LoginRequest(email: loginModel.email, password: loginModel.password);
      final response = await _stub.login(request);
      final userData = UserData(
        name: response.userName,
        token: response.sessionId,
      );
      await _storage.write(
        key: _store.storageUserDataKey,
        value: userData.toJson(),
      );
      return userData;
    } catch (_) {
      rethrow;
    }
  }

  Future<String> signUp(SignUpModel signUpModel) async {
    try {
      final request = SignupRequest(
        email: signUpModel.email,
        userName: signUpModel.userName,
        password: signUpModel.password,
      );
      final response = await _stub.signUp(request);
      return response.message;
    } catch (_) {
      rethrow;
    }
  }
}
