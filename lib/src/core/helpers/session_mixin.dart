import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grpc/grpc.dart';

mixin Session {
  @protected
  Future<String> getSession(
    FlutterSecureStorage storage,
    String storageSessionKey,
  ) async {
    final session = await storage.read(key: storageSessionKey);
    if (session == null) {
      throw Exception('Session not found in storage');
    }
    return session;
  }

  @protected
  Future<CallOptions> getOption(
    FlutterSecureStorage storage,
    String storageSessionKey,
  ) async {
    final option = CallOptions(
      metadata: {
        'authorization': await getSession(
          storage,
          storageSessionKey,
        ),
      },
    );
    return option;
  }
}
