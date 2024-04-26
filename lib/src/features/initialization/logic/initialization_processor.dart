import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grpc/grpc.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:taskem/src/features/authorization/controllers/auth_bloc.dart';
import 'package:taskem/src/features/authorization/repositories/auth_repository.dart';
import 'package:taskem/src/features/initialization/model/dependencies.dart';
import 'package:taskem/src/features/initialization/model/environment_store.dart';
import 'package:taskem/src/features/task/controller/task_bloc.dart';
import 'package:taskem/src/features/task/repositories/task_repository.dart';
import 'package:taskem/src/features/team/controller/specific_team/specific_team_bloc.dart';
import 'package:taskem/src/features/team/controller/team_task/team_task_bloc.dart';
import 'package:taskem/src/features/team/controller/teams/team_bloc.dart';
import 'package:taskem/src/features/team/controller/user_teams/user_team_bloc.dart';
import 'package:taskem/src/features/team/repositories/team_repository.dart';
import 'package:taskem/src/generated/auth/auth.pbgrpc.dart';
import 'package:taskem/src/generated/task/task.pbgrpc.dart';
import 'package:taskem/src/generated/team/team.pbgrpc.dart';

/// {@template initialization_processor}
/// A class which is responsible for processing initialization steps.
/// {@endtemplate}
final class InitializationProcessor {
  /// {@macro initialization_processor}
  const InitializationProcessor({
    required EnvironmentStore environmentStore,
    required Talker talker,
  })  : _environmentStore = environmentStore,
        _talker = talker;

  final EnvironmentStore _environmentStore;
  final Talker _talker;

  Future<Dependencies> _initDependencies() async {
    const getAndroidOptions = AndroidOptions(
      encryptedSharedPreferences: true,
    );
    const storage = FlutterSecureStorage(
      aOptions: getAndroidOptions,
    );

    final options = CallOptions(
      timeout: const Duration(
        seconds: 30,
      ),
    );

    // final byte = await rootBundle.load(_environmentStore.certPath);

    final channel = ClientChannel(
      _environmentStore.host,
      port: _environmentStore.port,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
        // credentials: ChannelCredentials.secure(
        //   certificates: byte.buffer.asUint8List(),
        //   onBadCertificate: (certificate, host) {
        //     _talker.error('Bad certificate: $certificate');
        //     return false;
        //   },
        // ),
        keepAlive: const ClientKeepAliveOptions(
          pingInterval: Duration(seconds: 1),
        ),
        idleTimeout: const Duration(minutes: 1),
      ),
    );

    _talker
        .info('Connection securing: ${channel.options.credentials.isSecure}');

    final authService = AuthClient(
      channel,
      options: options,
    );

    final teamService = TeamClient(
      channel,
      options: options,
    );

    final taskService = TaskClient(
      channel,
      options: options,
    );

    final authBloc = await _initAuthBloc(
      authService,
      storage,
      _environmentStore.storageSessionKey,
    );

    final teamBloc = await _initTeamBloc(
      teamService,
      storage,
      _environmentStore.storageSessionKey,
    );
    final userTeamBloc = await _initUserTeamBloc(
      teamService,
      storage,
      _environmentStore.storageSessionKey,
    );

    final specificTeamBloc = await _initSpecificTeamBloc(
      teamService,
      storage,
      _environmentStore.storageSessionKey,
    );

    final taskBloc = await _initTaskBloc(
      taskService,
      storage,
      _environmentStore.storageSessionKey,
    );

    final teamTaskBloc = await _initTeamTaskBloc(
      taskService,
      storage,
      _environmentStore.storageSessionKey,
    );

    return Dependencies(
      authBloc: authBloc,
      teamBloc: teamBloc,
      userTeamBloc: userTeamBloc,
      specificTeamBloc: specificTeamBloc,
      taskBloc: taskBloc,
      teamTaskBloc: teamTaskBloc,
    );
  }

  Future<AuthBloc> _initAuthBloc(
    AuthClient stub,
    FlutterSecureStorage storage,
    String storageSessionKey,
  ) async {
    final authRepository = AuthRepository(
      channel: stub,
      storage: storage,
      storageSessionKey: storageSessionKey,
    );
    final authBloc = AuthBloc(authRepository: authRepository);
    return authBloc;
  }

  Future<TeamBloc> _initTeamBloc(
    TeamClient stub,
    FlutterSecureStorage storage,
    String storageSessionKey,
  ) async {
    final teamRepository = TeamRepository(
      channel: stub,
      storage: storage,
      storageSessionKey: storageSessionKey,
    );
    final teamBloc = TeamBloc(teamRepository: teamRepository);
    return teamBloc;
  }

  Future<UserTeamBloc> _initUserTeamBloc(
    TeamClient stub,
    FlutterSecureStorage storage,
    String storageSessionKey,
  ) async {
    final teamRepository = TeamRepository(
      channel: stub,
      storage: storage,
      storageSessionKey: storageSessionKey,
    );
    final teamBloc = UserTeamBloc(teamRepository: teamRepository);
    return teamBloc;
  }

  Future<SpecificTeamBloc> _initSpecificTeamBloc(
    TeamClient teamService,
    FlutterSecureStorage storage,
    String storageSessionKey,
  ) async {
    final teamRepository = TeamRepository(
      channel: teamService,
      storage: storage,
      storageSessionKey: storageSessionKey,
    );
    final specificTeamBloc = SpecificTeamBloc(teamRepository: teamRepository);
    return specificTeamBloc;
  }

  Future<TaskBloc> _initTaskBloc(
    TaskClient taskService,
    FlutterSecureStorage storage,
    String storageSessionKey,
  ) async {
    final taskRepository = TaskRepository(
      channel: taskService,
      storage: storage,
      storageSessionKey: storageSessionKey,
    );
    final taskBloc = TaskBloc(taskRepository: taskRepository);
    return taskBloc;
  }

  Future<TeamTaskBloc> _initTeamTaskBloc(
    TaskClient taskService,
    FlutterSecureStorage storage,
    String storageSessionKey,
  ) async {
    final taskRepository = TaskRepository(
      channel: taskService,
      storage: storage,
      storageSessionKey: storageSessionKey,
    );
    final teamTaskBloc = TeamTaskBloc(taskRepository: taskRepository);
    return teamTaskBloc;
  }

  /// Method that starts the initialization process
  /// and returns the result of the initialization.
  ///
  /// This method may contain additional steps that need initialization
  /// before the application starts
  Future<InitializationResult> initialize() async {
    final stopwatch = Stopwatch()..start();

    final dependencies = await _initDependencies();

    stopwatch.stop();
    final result = InitializationResult(
      dependencies: dependencies,
      msSpent: stopwatch.elapsedMilliseconds,
    );
    return result;
  }
}
