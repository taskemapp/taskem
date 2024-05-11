import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taskem/src/app.dart';
import 'package:taskem/src/features/initialization/model/environment_store.dart';
import 'package:taskem/src/features/shared/repositories/session/error.dart';

class SessionRepository {
  SessionRepository(
      {required FlutterSecureStorage storage, required EnvironmentStore store})
      : _storage = storage,
        _store = store;

  final FlutterSecureStorage _storage;

  final EnvironmentStore _store;

  // Future<void> saveSession(String token) async {
  //   try {
  //     await _storage.write(key: _store.storageUserDataKey, value: token);
  //   } catch (e, st) {
  //     Error.throwWithStackTrace(
  //       SessionRepositoryError.saveSession(
  //         message: e.toString(),
  //       ),
  //       st,
  //     );
  //   }
  // }

  Future<String> getSession() async {
    try {
      final userDataJson = await _storage.read(key: _store.storageUserDataKey);
      if (userDataJson == null) {
        throw SessionRepositoryError.getSession(
          message: 'Session not found',
        );
      }
      return UserData.fromJson(jsonDecode(userDataJson) as Map<String, dynamic>)
          .token;
    } catch (e, st) {
      Error.throwWithStackTrace(
        SessionRepositoryError.getSession(
          message: e.toString(),
        ),
        st,
      );
    }
  }
}
