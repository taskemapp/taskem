import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taskem/src/core/helpers/session_mixin.dart';
import 'package:taskem/src/generated/profile/profile.pbgrpc.dart';

class ProfileRepository with Session {
  ProfileRepository({
    required ProfileClient stub,
    required FlutterSecureStorage storage,
    required String storageSessionKey,
  })  : _stub = stub,
        _storage = storage,
        _storageSessionKey = storageSessionKey;

  final ProfileClient _stub;
  final FlutterSecureStorage _storage;
  final String _storageSessionKey;
  Future<void> addOrUpdateAvatar(Uint8List file) async {
    try {
      final option = await getOption(
        _storage,
        _storageSessionKey,
      );
      await _stub.addOrUpdateAvatar(
        options: option,
        AddOrUpdateAvatarRequest(
          avatarImage: file,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
