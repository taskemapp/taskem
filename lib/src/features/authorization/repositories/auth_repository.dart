import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taskem/src/features/authorization/models/login_model.dart';
import 'package:taskem/src/features/authorization/models/sign_up_model.dart';
import 'package:taskem/src/generated/auth/auth.pbgrpc.dart';

class AuthRepository {
  AuthRepository({
    required AuthClient channel,
    required FlutterSecureStorage storage,
    required String storageSessionKey,
  })  : _stub = channel,
        _storageSessionKey = storageSessionKey,
        _storage = storage;

  final AuthClient _stub;

  final FlutterSecureStorage _storage;

  final String _storageSessionKey;

  Future<String> login(LoginModel loginModel) async {
    try {
      final request =
          LoginRequest(email: loginModel.email, password: loginModel.password);
      final response = await _stub.login(request);
      await _storage.write(key: _storageSessionKey, value: response.sessionId);
      return response.sessionId;
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
