//
//  Generated code. Do not modify.
//  source: team.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/empty.pb.dart' as $1;
import 'team.pb.dart' as $0;

export 'team.pb.dart';

@$pb.GrpcServiceName('team.Team')
class TeamClient extends $grpc.Client {
  static final _$get = $grpc.ClientMethod<$0.GetTeamRequest, $0.TeamResponse>(
      '/team.Team/Get',
      ($0.GetTeamRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TeamResponse.fromBuffer(value));
  static final _$getUserTeams = $grpc.ClientMethod<$1.Empty, $0.GetAllTeamsResponse>(
      '/team.Team/GetUserTeams',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetAllTeamsResponse.fromBuffer(value));
  static final _$getAllCanJoin = $grpc.ClientMethod<$1.Empty, $0.GetAllTeamsResponse>(
      '/team.Team/GetAllCanJoin',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetAllTeamsResponse.fromBuffer(value));
  static final _$create = $grpc.ClientMethod<$0.CreateTeamRequest, $0.CreateTeamResponse>(
      '/team.Team/Create',
      ($0.CreateTeamRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateTeamResponse.fromBuffer(value));
  static final _$join = $grpc.ClientMethod<$0.JoinTeamRequest, $0.JoinTeamResponse>(
      '/team.Team/Join',
      ($0.JoinTeamRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.JoinTeamResponse.fromBuffer(value));
  static final _$getRoles = $grpc.ClientMethod<$0.GetTeamRolesRequest, $0.GetTeamRolesResponse>(
      '/team.Team/GetRoles',
      ($0.GetTeamRolesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetTeamRolesResponse.fromBuffer(value));
  static final _$changeRole = $grpc.ClientMethod<$0.ChangeTeamRole, $0.Role>(
      '/team.Team/ChangeRole',
      ($0.ChangeTeamRole value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Role.fromBuffer(value));
  static final _$leave = $grpc.ClientMethod<$0.LeaveTeamRequest, $0.LeaveTeamResponse>(
      '/team.Team/Leave',
      ($0.LeaveTeamRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LeaveTeamResponse.fromBuffer(value));

  TeamClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.TeamResponse> get($0.GetTeamRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetAllTeamsResponse> getUserTeams($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserTeams, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetAllTeamsResponse> getAllCanJoin($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllCanJoin, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateTeamResponse> create($0.CreateTeamRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$0.JoinTeamResponse> join($0.JoinTeamRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$join, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetTeamRolesResponse> getRoles($0.GetTeamRolesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRoles, request, options: options);
  }

  $grpc.ResponseFuture<$0.Role> changeRole($0.ChangeTeamRole request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$changeRole, request, options: options);
  }

  $grpc.ResponseFuture<$0.LeaveTeamResponse> leave($0.LeaveTeamRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$leave, request, options: options);
  }
}

@$pb.GrpcServiceName('team.Team')
abstract class TeamServiceBase extends $grpc.Service {
  $core.String get $name => 'team.Team';

  TeamServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetTeamRequest, $0.TeamResponse>(
        'Get',
        get_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetTeamRequest.fromBuffer(value),
        ($0.TeamResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.GetAllTeamsResponse>(
        'GetUserTeams',
        getUserTeams_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.GetAllTeamsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.GetAllTeamsResponse>(
        'GetAllCanJoin',
        getAllCanJoin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.GetAllTeamsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateTeamRequest, $0.CreateTeamResponse>(
        'Create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateTeamRequest.fromBuffer(value),
        ($0.CreateTeamResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.JoinTeamRequest, $0.JoinTeamResponse>(
        'Join',
        join_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.JoinTeamRequest.fromBuffer(value),
        ($0.JoinTeamResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTeamRolesRequest, $0.GetTeamRolesResponse>(
        'GetRoles',
        getRoles_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetTeamRolesRequest.fromBuffer(value),
        ($0.GetTeamRolesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChangeTeamRole, $0.Role>(
        'ChangeRole',
        changeRole_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChangeTeamRole.fromBuffer(value),
        ($0.Role value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LeaveTeamRequest, $0.LeaveTeamResponse>(
        'Leave',
        leave_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LeaveTeamRequest.fromBuffer(value),
        ($0.LeaveTeamResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.TeamResponse> get_Pre($grpc.ServiceCall call, $async.Future<$0.GetTeamRequest> request) async {
    return get(call, await request);
  }

  $async.Future<$0.GetAllTeamsResponse> getUserTeams_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getUserTeams(call, await request);
  }

  $async.Future<$0.GetAllTeamsResponse> getAllCanJoin_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getAllCanJoin(call, await request);
  }

  $async.Future<$0.CreateTeamResponse> create_Pre($grpc.ServiceCall call, $async.Future<$0.CreateTeamRequest> request) async {
    return create(call, await request);
  }

  $async.Future<$0.JoinTeamResponse> join_Pre($grpc.ServiceCall call, $async.Future<$0.JoinTeamRequest> request) async {
    return join(call, await request);
  }

  $async.Future<$0.GetTeamRolesResponse> getRoles_Pre($grpc.ServiceCall call, $async.Future<$0.GetTeamRolesRequest> request) async {
    return getRoles(call, await request);
  }

  $async.Future<$0.Role> changeRole_Pre($grpc.ServiceCall call, $async.Future<$0.ChangeTeamRole> request) async {
    return changeRole(call, await request);
  }

  $async.Future<$0.LeaveTeamResponse> leave_Pre($grpc.ServiceCall call, $async.Future<$0.LeaveTeamRequest> request) async {
    return leave(call, await request);
  }

  $async.Future<$0.TeamResponse> get($grpc.ServiceCall call, $0.GetTeamRequest request);
  $async.Future<$0.GetAllTeamsResponse> getUserTeams($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.GetAllTeamsResponse> getAllCanJoin($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.CreateTeamResponse> create($grpc.ServiceCall call, $0.CreateTeamRequest request);
  $async.Future<$0.JoinTeamResponse> join($grpc.ServiceCall call, $0.JoinTeamRequest request);
  $async.Future<$0.GetTeamRolesResponse> getRoles($grpc.ServiceCall call, $0.GetTeamRolesRequest request);
  $async.Future<$0.Role> changeRole($grpc.ServiceCall call, $0.ChangeTeamRole request);
  $async.Future<$0.LeaveTeamResponse> leave($grpc.ServiceCall call, $0.LeaveTeamRequest request);
}
