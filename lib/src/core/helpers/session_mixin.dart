import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grpc/grpc.dart';
import 'package:taskem/src/app.dart';

mixin Session {
  @protected
  Future<String> getSession(
    FlutterSecureStorage storage,
    String storageUserDataKey,
  ) async {
    final userData = await storage.read(key: storageUserDataKey);
    if (userData == null) {
      throw Exception('Session not found in storage');
    }
    return UserData.fromJson(jsonDecode(userData) as Map<String, dynamic>)
        .token;
  }

  @protected
  Future<CallOptions> getOption(
    FlutterSecureStorage storage,
    String storageUserDataKey,
  ) async {
    final option = CallOptions(
      metadata: {
        'authorization': await getSession(
          storage,
          storageUserDataKey,
        ),
      },
    );
    return option;
  }
}
