import 'package:taskem/src/features/initialization/model/environment.dart';

/// {@template environment_store}
/// Environment store
/// {@endtemplate}
class EnvironmentStore {
  /// {@macro environment_store}
  const EnvironmentStore();

  /// The Sentry DSN.
  String get sentryDsn => const String.fromEnvironment('SENTRY_DSN');

  ///Grpc server host
  String get host => const String.fromEnvironment('HOST');

  ///Grpc server port
  int get port => int.parse(
        const String.fromEnvironment('PORT'),
      );

  String get fileStorageHost =>
      const String.fromEnvironment('FILE_STORAGE_HOST');

  int get fileStoragePort => int.parse(
        const String.fromEnvironment('FILE_STORAGE_PORT'),
      );

  ///Secure storage session key
  String get storageUserDataKey =>
      const String.fromEnvironment('STORAGE_USER_DATA_KEY');

  ///Grpc server certificate path
  String get certPath => const String.fromEnvironment('PATH_TO_CERT');

  /// The environment.
  Environment get environment {
    const environment = String.fromEnvironment('ENVIRONMENT');

    return Environment.from(environment);
  }
}
