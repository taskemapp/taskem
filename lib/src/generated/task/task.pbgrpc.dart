//
//  Generated code. Do not modify.
//  source: task.proto
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
import 'task.pb.dart' as $2;

export 'task.pb.dart';

@$pb.GrpcServiceName('task.Task')
class TaskClient extends $grpc.Client {
  static final _$create = $grpc.ClientMethod<$2.CreateTaskRequest, $1.Empty>(
      '/task.Task/Create',
      ($2.CreateTaskRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$getAll = $grpc.ClientMethod<$1.Empty, $2.GetAllResponse>(
      '/task.Task/GetAll',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.GetAllResponse.fromBuffer(value));
  static final _$getAllForTeam = $grpc.ClientMethod<$2.GetTeamTasksRequest, $2.GetAllResponse>(
      '/task.Task/GetAllForTeam',
      ($2.GetTeamTasksRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.GetAllResponse.fromBuffer(value));
  static final _$getAllForUser = $grpc.ClientMethod<$1.Empty, $2.GetAllResponse>(
      '/task.Task/GetAllForUser',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.GetAllResponse.fromBuffer(value));
  static final _$get = $grpc.ClientMethod<$2.GetTaskRequest, $2.TaskResponse>(
      '/task.Task/Get',
      ($2.GetTaskRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.TaskResponse.fromBuffer(value));
  static final _$assign = $grpc.ClientMethod<$2.AssignTaskRequest, $2.TaskResponse>(
      '/task.Task/Assign',
      ($2.AssignTaskRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.TaskResponse.fromBuffer(value));

  TaskClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.Empty> create($2.CreateTaskRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetAllResponse> getAll($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAll, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetAllResponse> getAllForTeam($2.GetTeamTasksRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllForTeam, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetAllResponse> getAllForUser($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllForUser, request, options: options);
  }

  $grpc.ResponseFuture<$2.TaskResponse> get($2.GetTaskRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get, request, options: options);
  }

  $grpc.ResponseFuture<$2.TaskResponse> assign($2.AssignTaskRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$assign, request, options: options);
  }
}

@$pb.GrpcServiceName('task.Task')
abstract class TaskServiceBase extends $grpc.Service {
  $core.String get $name => 'task.Task';

  TaskServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.CreateTaskRequest, $1.Empty>(
        'Create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CreateTaskRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $2.GetAllResponse>(
        'GetAll',
        getAll_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($2.GetAllResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetTeamTasksRequest, $2.GetAllResponse>(
        'GetAllForTeam',
        getAllForTeam_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetTeamTasksRequest.fromBuffer(value),
        ($2.GetAllResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $2.GetAllResponse>(
        'GetAllForUser',
        getAllForUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($2.GetAllResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetTaskRequest, $2.TaskResponse>(
        'Get',
        get_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetTaskRequest.fromBuffer(value),
        ($2.TaskResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.AssignTaskRequest, $2.TaskResponse>(
        'Assign',
        assign_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.AssignTaskRequest.fromBuffer(value),
        ($2.TaskResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.Empty> create_Pre($grpc.ServiceCall call, $async.Future<$2.CreateTaskRequest> request) async {
    return create(call, await request);
  }

  $async.Future<$2.GetAllResponse> getAll_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getAll(call, await request);
  }

  $async.Future<$2.GetAllResponse> getAllForTeam_Pre($grpc.ServiceCall call, $async.Future<$2.GetTeamTasksRequest> request) async {
    return getAllForTeam(call, await request);
  }

  $async.Future<$2.GetAllResponse> getAllForUser_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getAllForUser(call, await request);
  }

  $async.Future<$2.TaskResponse> get_Pre($grpc.ServiceCall call, $async.Future<$2.GetTaskRequest> request) async {
    return get(call, await request);
  }

  $async.Future<$2.TaskResponse> assign_Pre($grpc.ServiceCall call, $async.Future<$2.AssignTaskRequest> request) async {
    return assign(call, await request);
  }

  $async.Future<$1.Empty> create($grpc.ServiceCall call, $2.CreateTaskRequest request);
  $async.Future<$2.GetAllResponse> getAll($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$2.GetAllResponse> getAllForTeam($grpc.ServiceCall call, $2.GetTeamTasksRequest request);
  $async.Future<$2.GetAllResponse> getAllForUser($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$2.TaskResponse> get($grpc.ServiceCall call, $2.GetTaskRequest request);
  $async.Future<$2.TaskResponse> assign($grpc.ServiceCall call, $2.AssignTaskRequest request);
}
