import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taskem/src/core/helpers/session_mixin.dart';
import 'package:taskem/src/features/team/models/create_team_model.dart';
import 'package:taskem/src/features/team/models/created_team.dart';
import 'package:taskem/src/features/team/models/role_model.dart';
import 'package:taskem/src/features/team/models/team_model.dart';
import 'package:taskem/src/features/team/repositories/error.dart';
import 'package:taskem/src/generated/team/google/protobuf/empty.pb.dart';
import 'package:taskem/src/generated/team/team.pbgrpc.dart';

class TeamRepository with Session {
  TeamRepository({
    required TeamClient channel,
    required FlutterSecureStorage storage,
    required String storageSessionKey,
  })  : _stub = channel,
        _storageSessionKey = storageSessionKey,
        _storage = storage;

  final TeamClient _stub;
  final FlutterSecureStorage _storage;
  final String _storageSessionKey;

  Future<TeamModel> getTeam(String teamId) async {
    try {
      final option = await getOption(
        _storage,
        _storageSessionKey,
      );
      final response = await _stub.get(
        GetTeamRequest(teamId: teamId),
        options: option,
      );
      return TeamModel.from(response);
    } catch (_) {
      rethrow;
    }
  }

  Future<List<TeamModel>> getTeams() async {
    try {
      final option = await getOption(
        _storage,
        _storageSessionKey,
      );
      final response = await _stub.getAllCanJoin(
        Empty(),
        options: option,
      );
      return response.teams.map(TeamModel.from).toList();
    } catch (_) {
      rethrow;
    }
  }

  Future<List<TeamModel>> getUserTeams() async {
    try {
      final option = await getOption(
        _storage,
        _storageSessionKey,
      );
      final response = await _stub.getUserTeams(
        Empty(),
        options: option,
      );
      return response.teams.map(TeamModel.from).toList();
    } catch (_) {
      rethrow;
    }
  }

  Future<List<RoleModel>> getRoles(String teamId) async {
    try {
      final option = await getOption(
        _storage,
        _storageSessionKey,
      );
      final request = GetTeamRolesRequest(
        teamId: teamId,
      );
      final response = await _stub.getRoles(
        request,
        options: option,
      );
      return response.roles.map(RoleModel.from).toList();
    } catch (_) {
      rethrow;
    }
  }

  Future<String> join(
    String teamId,
    String creator,
  ) async {
    try {
      final option = await getOption(
        _storage,
        _storageSessionKey,
      );
      final session = await getSession(
        _storage,
        _storageSessionKey,
      );
      if (session == creator) {
        throw Exception("Can't join in team");
      }
      final request = JoinTeamRequest(
        teamId: teamId,
      );
      final response = await _stub.join(
        request,
        options: option,
      );
      return response.message;
    } catch (e, st) {
      Error.throwWithStackTrace(
        TeamRepositoryError.join(message: e.toString()),
        st,
      );
    }
  }

  Future<CreatedTeamModel> create(CreateTeamModel teamModel) async {
    try {
      final option = await getOption(
        _storage,
        _storageSessionKey,
      );
      final request = CreateTeamRequest(
        name: teamModel.name,
        description: teamModel.description,
      );
      final response = await _stub.create(
        request,
        options: option,
      );
      return CreatedTeamModel.from(response);
    } catch (_) {
      rethrow;
    }
  }
}
