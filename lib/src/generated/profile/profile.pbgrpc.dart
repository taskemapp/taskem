//
//  Generated code. Do not modify.
//  source: profile.proto
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
import 'profile.pb.dart' as $0;

export 'profile.pb.dart';

@$pb.GrpcServiceName('profile.Profile')
class ProfileClient extends $grpc.Client {
  static final _$addOrUpdateAvatar =
      $grpc.ClientMethod<$0.AddOrUpdateAvatarRequest, $1.Empty>(
          '/profile.Profile/AddOrUpdateAvatar',
          ($0.AddOrUpdateAvatarRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$getProfile =
      $grpc.ClientMethod<$1.Empty, $0.GetProfileResponse>(
          '/profile.Profile/GetProfile',
          ($1.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetProfileResponse.fromBuffer(value));

  ProfileClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.Empty> addOrUpdateAvatar(
      $0.AddOrUpdateAvatarRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addOrUpdateAvatar, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetProfileResponse> getProfile($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProfile, request, options: options);
  }
}

@$pb.GrpcServiceName('profile.Profile')
abstract class ProfileServiceBase extends $grpc.Service {
  $core.String get $name => 'profile.Profile';

  ProfileServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AddOrUpdateAvatarRequest, $1.Empty>(
        'AddOrUpdateAvatar',
        addOrUpdateAvatar_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.AddOrUpdateAvatarRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.GetProfileResponse>(
        'GetProfile',
        getProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.GetProfileResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.Empty> addOrUpdateAvatar_Pre($grpc.ServiceCall call,
      $async.Future<$0.AddOrUpdateAvatarRequest> request) async {
    return addOrUpdateAvatar(call, await request);
  }

  $async.Future<$0.GetProfileResponse> getProfile_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getProfile(call, await request);
  }

  $async.Future<$1.Empty> addOrUpdateAvatar(
      $grpc.ServiceCall call, $0.AddOrUpdateAvatarRequest request);

  $async.Future<$0.GetProfileResponse> getProfile(
      $grpc.ServiceCall call, $1.Empty request);
}
