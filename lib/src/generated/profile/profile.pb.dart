//
//  Generated code. Do not modify.
//  source: profile.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AddOrUpdateAvatarRequest extends $pb.GeneratedMessage {
  factory AddOrUpdateAvatarRequest({
    $core.List<$core.int>? avatarImage,
  }) {
    final $result = create();
    if (avatarImage != null) {
      $result.avatarImage = avatarImage;
    }
    return $result;
  }
  AddOrUpdateAvatarRequest._() : super();
  factory AddOrUpdateAvatarRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddOrUpdateAvatarRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddOrUpdateAvatarRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'profile'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'avatarImage', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddOrUpdateAvatarRequest clone() => AddOrUpdateAvatarRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddOrUpdateAvatarRequest copyWith(void Function(AddOrUpdateAvatarRequest) updates) => super.copyWith((message) => updates(message as AddOrUpdateAvatarRequest)) as AddOrUpdateAvatarRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddOrUpdateAvatarRequest create() => AddOrUpdateAvatarRequest._();
  AddOrUpdateAvatarRequest createEmptyInstance() => create();
  static $pb.PbList<AddOrUpdateAvatarRequest> createRepeated() => $pb.PbList<AddOrUpdateAvatarRequest>();
  @$core.pragma('dart2js:noInline')
  static AddOrUpdateAvatarRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddOrUpdateAvatarRequest>(create);
  static AddOrUpdateAvatarRequest? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<$core.int> get avatarImage => $_getN(0);
  @$pb.TagNumber(2)
  set avatarImage($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasAvatarImage() => $_has(0);
  @$pb.TagNumber(2)
  void clearAvatarImage() => clearField(2);
}

class GetProfileResponse extends $pb.GeneratedMessage {
  factory GetProfileResponse({
    $core.String? avatar,
    $core.String? userName,
    $core.String? email,
  }) {
    final $result = create();
    if (avatar != null) {
      $result.avatar = avatar;
    }
    if (userName != null) {
      $result.userName = userName;
    }
    if (email != null) {
      $result.email = email;
    }
    return $result;
  }
  GetProfileResponse._() : super();
  factory GetProfileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetProfileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetProfileResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'profile'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'avatar')
    ..aOS(2, _omitFieldNames ? '' : 'userName')
    ..aOS(3, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetProfileResponse clone() => GetProfileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetProfileResponse copyWith(void Function(GetProfileResponse) updates) => super.copyWith((message) => updates(message as GetProfileResponse)) as GetProfileResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProfileResponse create() => GetProfileResponse._();
  GetProfileResponse createEmptyInstance() => create();
  static $pb.PbList<GetProfileResponse> createRepeated() => $pb.PbList<GetProfileResponse>();
  @$core.pragma('dart2js:noInline')
  static GetProfileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetProfileResponse>(create);
  static GetProfileResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get avatar => $_getSZ(0);
  @$pb.TagNumber(1)
  set avatar($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAvatar() => $_has(0);
  @$pb.TagNumber(1)
  void clearAvatar() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userName => $_getSZ(1);
  @$pb.TagNumber(2)
  set userName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserName() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
