import 'dart:io';

import 'package:taskem/src/features/initialization/model/environment_store.dart';

class ProfileAvatarRepository {
  ProfileAvatarRepository({
    required HttpClient httpClient,
    // required ClientChannel stub,
    required EnvironmentStore store,
  })  : _httpClient = httpClient,
        // _stub = stub,
        _store = store;

  final HttpClient _httpClient;

  // final ProfileClient _stub;
  final EnvironmentStore _store;

  Future<void> downloadAvatar(
    String url,
    String token,
  ) async {
    try {
      final request = await _httpClient.getUrl(Uri.parse(url));
      request.headers.add('authorization', token);
      await request.close();
    } catch (e) {
      rethrow;
    }
  }
}
