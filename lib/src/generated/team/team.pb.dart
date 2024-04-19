//
//  Generated code. Do not modify.
//  source: team.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GetTeamRolesRequest extends $pb.GeneratedMessage {
  factory GetTeamRolesRequest({
    $core.String? teamId,
  }) {
    final $result = create();
    if (teamId != null) {
      $result.teamId = teamId;
    }
    return $result;
  }
  GetTeamRolesRequest._() : super();
  factory GetTeamRolesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTeamRolesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTeamRolesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'team'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'teamId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTeamRolesRequest clone() => GetTeamRolesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTeamRolesRequest copyWith(void Function(GetTeamRolesRequest) updates) => super.copyWith((message) => updates(message as GetTeamRolesRequest)) as GetTeamRolesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTeamRolesRequest create() => GetTeamRolesRequest._();
  GetTeamRolesRequest createEmptyInstance() => create();
  static $pb.PbList<GetTeamRolesRequest> createRepeated() => $pb.PbList<GetTeamRolesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTeamRolesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTeamRolesRequest>(create);
  static GetTeamRolesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get teamId => $_getSZ(0);
  @$pb.TagNumber(1)
  set teamId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTeamId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTeamId() => clearField(1);
}

class ChangeTeamRole extends $pb.GeneratedMessage {
  factory ChangeTeamRole({
    $core.String? roleId,
    $core.String? userId,
  }) {
    final $result = create();
    if (roleId != null) {
      $result.roleId = roleId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  ChangeTeamRole._() : super();
  factory ChangeTeamRole.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangeTeamRole.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChangeTeamRole', package: const $pb.PackageName(_omitMessageNames ? '' : 'team'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roleId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangeTeamRole clone() => ChangeTeamRole()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangeTeamRole copyWith(void Function(ChangeTeamRole) updates) => super.copyWith((message) => updates(message as ChangeTeamRole)) as ChangeTeamRole;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangeTeamRole create() => ChangeTeamRole._();
  ChangeTeamRole createEmptyInstance() => create();
  static $pb.PbList<ChangeTeamRole> createRepeated() => $pb.PbList<ChangeTeamRole>();
  @$core.pragma('dart2js:noInline')
  static ChangeTeamRole getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangeTeamRole>(create);
  static ChangeTeamRole? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roleId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roleId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoleId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);
}

class GetTeamRolesResponse extends $pb.GeneratedMessage {
  factory GetTeamRolesResponse({
    $core.Iterable<Role>? roles,
  }) {
    final $result = create();
    if (roles != null) {
      $result.roles.addAll(roles);
    }
    return $result;
  }
  GetTeamRolesResponse._() : super();
  factory GetTeamRolesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTeamRolesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTeamRolesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'team'), createEmptyInstance: create)
    ..pc<Role>(1, _omitFieldNames ? '' : 'roles', $pb.PbFieldType.PM, subBuilder: Role.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTeamRolesResponse clone() => GetTeamRolesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTeamRolesResponse copyWith(void Function(GetTeamRolesResponse) updates) => super.copyWith((message) => updates(message as GetTeamRolesResponse)) as GetTeamRolesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTeamRolesResponse create() => GetTeamRolesResponse._();
  GetTeamRolesResponse createEmptyInstance() => create();
  static $pb.PbList<GetTeamRolesResponse> createRepeated() => $pb.PbList<GetTeamRolesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTeamRolesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTeamRolesResponse>(create);
  static GetTeamRolesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Role> get roles => $_getList(0);
}

class Role extends $pb.GeneratedMessage {
  factory Role({
    $core.String? roleName,
    $core.int? priority,
    RolePermission? permission,
  }) {
    final $result = create();
    if (roleName != null) {
      $result.roleName = roleName;
    }
    if (priority != null) {
      $result.priority = priority;
    }
    if (permission != null) {
      $result.permission = permission;
    }
    return $result;
  }
  Role._() : super();
  factory Role.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Role.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Role', package: const $pb.PackageName(_omitMessageNames ? '' : 'team'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roleName')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'priority', $pb.PbFieldType.O3)
    ..aOM<RolePermission>(3, _omitFieldNames ? '' : 'permission', subBuilder: RolePermission.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Role clone() => Role()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Role copyWith(void Function(Role) updates) => super.copyWith((message) => updates(message as Role)) as Role;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Role create() => Role._();
  Role createEmptyInstance() => create();
  static $pb.PbList<Role> createRepeated() => $pb.PbList<Role>();
  @$core.pragma('dart2js:noInline')
  static Role getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Role>(create);
  static Role? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roleName => $_getSZ(0);
  @$pb.TagNumber(1)
  set roleName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoleName() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoleName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get priority => $_getIZ(1);
  @$pb.TagNumber(2)
  set priority($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPriority() => $_has(1);
  @$pb.TagNumber(2)
  void clearPriority() => clearField(2);

  @$pb.TagNumber(3)
  RolePermission get permission => $_getN(2);
  @$pb.TagNumber(3)
  set permission(RolePermission v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPermission() => $_has(2);
  @$pb.TagNumber(3)
  void clearPermission() => clearField(3);
  @$pb.TagNumber(3)
  RolePermission ensurePermission() => $_ensure(2);
}

class RolePermission extends $pb.GeneratedMessage {
  factory RolePermission({
    $core.bool? canAddTask,
    $core.bool? canAssignTask,
    $core.bool? canApproveTask,
    $core.bool? canInviteInTeam,
    $core.bool? canCreateRoles,
  }) {
    final $result = create();
    if (canAddTask != null) {
      $result.canAddTask = canAddTask;
    }
    if (canAssignTask != null) {
      $result.canAssignTask = canAssignTask;
    }
    if (canApproveTask != null) {
      $result.canApproveTask = canApproveTask;
    }
    if (canInviteInTeam != null) {
      $result.canInviteInTeam = canInviteInTeam;
    }
    if (canCreateRoles != null) {
      $result.canCreateRoles = canCreateRoles;
    }
    return $result;
  }
  RolePermission._() : super();
  factory RolePermission.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RolePermission.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RolePermission', package: const $pb.PackageName(_omitMessageNames ? '' : 'team'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'canAddTask')
    ..aOB(2, _omitFieldNames ? '' : 'canAssignTask')
    ..aOB(3, _omitFieldNames ? '' : 'canApproveTask')
    ..aOB(4, _omitFieldNames ? '' : 'canInviteInTeam')
    ..aOB(5, _omitFieldNames ? '' : 'canCreateRoles')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RolePermission clone() => RolePermission()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RolePermission copyWith(void Function(RolePermission) updates) => super.copyWith((message) => updates(message as RolePermission)) as RolePermission;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RolePermission create() => RolePermission._();
  RolePermission createEmptyInstance() => create();
  static $pb.PbList<RolePermission> createRepeated() => $pb.PbList<RolePermission>();
  @$core.pragma('dart2js:noInline')
  static RolePermission getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RolePermission>(create);
  static RolePermission? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get canAddTask => $_getBF(0);
  @$pb.TagNumber(1)
  set canAddTask($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCanAddTask() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanAddTask() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get canAssignTask => $_getBF(1);
  @$pb.TagNumber(2)
  set canAssignTask($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCanAssignTask() => $_has(1);
  @$pb.TagNumber(2)
  void clearCanAssignTask() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get canApproveTask => $_getBF(2);
  @$pb.TagNumber(3)
  set canApproveTask($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCanApproveTask() => $_has(2);
  @$pb.TagNumber(3)
  void clearCanApproveTask() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get canInviteInTeam => $_getBF(3);
  @$pb.TagNumber(4)
  set canInviteInTeam($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCanInviteInTeam() => $_has(3);
  @$pb.TagNumber(4)
  void clearCanInviteInTeam() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get canCreateRoles => $_getBF(4);
  @$pb.TagNumber(5)
  set canCreateRoles($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCanCreateRoles() => $_has(4);
  @$pb.TagNumber(5)
  void clearCanCreateRoles() => clearField(5);
}

class GetTeamRequest extends $pb.GeneratedMessage {
  factory GetTeamRequest({
    $core.String? teamId,
  }) {
    final $result = create();
    if (teamId != null) {
      $result.teamId = teamId;
    }
    return $result;
  }
  GetTeamRequest._() : super();
  factory GetTeamRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTeamRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTeamRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'team'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'teamId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTeamRequest clone() => GetTeamRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTeamRequest copyWith(void Function(GetTeamRequest) updates) => super.copyWith((message) => updates(message as GetTeamRequest)) as GetTeamRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTeamRequest create() => GetTeamRequest._();
  GetTeamRequest createEmptyInstance() => create();
  static $pb.PbList<GetTeamRequest> createRepeated() => $pb.PbList<GetTeamRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTeamRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTeamRequest>(create);
  static GetTeamRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get teamId => $_getSZ(0);
  @$pb.TagNumber(1)
  set teamId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTeamId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTeamId() => clearField(1);
}

class GetAllTeamsResponse extends $pb.GeneratedMessage {
  factory GetAllTeamsResponse({
    $core.Iterable<TeamResponse>? teams,
  }) {
    final $result = create();
    if (teams != null) {
      $result.teams.addAll(teams);
    }
    return $result;
  }
  GetAllTeamsResponse._() : super();
  factory GetAllTeamsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAllTeamsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAllTeamsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'team'), createEmptyInstance: create)
    ..pc<TeamResponse>(1, _omitFieldNames ? '' : 'teams', $pb.PbFieldType.PM, subBuilder: TeamResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAllTeamsResponse clone() => GetAllTeamsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAllTeamsResponse copyWith(void Function(GetAllTeamsResponse) updates) => super.copyWith((message) => updates(message as GetAllTeamsResponse)) as GetAllTeamsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAllTeamsResponse create() => GetAllTeamsResponse._();
  GetAllTeamsResponse createEmptyInstance() => create();
  static $pb.PbList<GetAllTeamsResponse> createRepeated() => $pb.PbList<GetAllTeamsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAllTeamsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAllTeamsResponse>(create);
  static GetAllTeamsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TeamResponse> get teams => $_getList(0);
}

class TeamResponse extends $pb.GeneratedMessage {
  factory TeamResponse({
    $core.String? id,
    $core.String? name,
    $core.String? description,
    $core.Iterable<UserInfo>? members,
    $core.String? creator,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (members != null) {
      $result.members.addAll(members);
    }
    if (creator != null) {
      $result.creator = creator;
    }
    return $result;
  }
  TeamResponse._() : super();
  factory TeamResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TeamResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TeamResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'team'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..pc<UserInfo>(4, _omitFieldNames ? '' : 'members', $pb.PbFieldType.PM, subBuilder: UserInfo.create)
    ..aOS(5, _omitFieldNames ? '' : 'creator')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TeamResponse clone() => TeamResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TeamResponse copyWith(void Function(TeamResponse) updates) => super.copyWith((message) => updates(message as TeamResponse)) as TeamResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TeamResponse create() => TeamResponse._();
  TeamResponse createEmptyInstance() => create();
  static $pb.PbList<TeamResponse> createRepeated() => $pb.PbList<TeamResponse>();
  @$core.pragma('dart2js:noInline')
  static TeamResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TeamResponse>(create);
  static TeamResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<UserInfo> get members => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get creator => $_getSZ(4);
  @$pb.TagNumber(5)
  set creator($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreator() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreator() => clearField(5);
}

class UserInfo extends $pb.GeneratedMessage {
  factory UserInfo({
    $core.String? id,
    $core.String? userName,
    $core.String? role,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (userName != null) {
      $result.userName = userName;
    }
    if (role != null) {
      $result.role = role;
    }
    return $result;
  }
  UserInfo._() : super();
  factory UserInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'team'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'userName')
    ..aOS(3, _omitFieldNames ? '' : 'role')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserInfo clone() => UserInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserInfo copyWith(void Function(UserInfo) updates) => super.copyWith((message) => updates(message as UserInfo)) as UserInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserInfo create() => UserInfo._();
  UserInfo createEmptyInstance() => create();
  static $pb.PbList<UserInfo> createRepeated() => $pb.PbList<UserInfo>();
  @$core.pragma('dart2js:noInline')
  static UserInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserInfo>(create);
  static UserInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userName => $_getSZ(1);
  @$pb.TagNumber(2)
  set userName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserName() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get role => $_getSZ(2);
  @$pb.TagNumber(3)
  set role($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearRole() => clearField(3);
}

class CreateTeamRequest extends $pb.GeneratedMessage {
  factory CreateTeamRequest({
    $core.String? name,
    $core.String? description,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    return $result;
  }
  CreateTeamRequest._() : super();
  factory CreateTeamRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateTeamRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateTeamRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'team'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateTeamRequest clone() => CreateTeamRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateTeamRequest copyWith(void Function(CreateTeamRequest) updates) => super.copyWith((message) => updates(message as CreateTeamRequest)) as CreateTeamRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateTeamRequest create() => CreateTeamRequest._();
  CreateTeamRequest createEmptyInstance() => create();
  static $pb.PbList<CreateTeamRequest> createRepeated() => $pb.PbList<CreateTeamRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateTeamRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateTeamRequest>(create);
  static CreateTeamRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);
}

class CreateTeamResponse extends $pb.GeneratedMessage {
  factory CreateTeamResponse({
    $core.String? message,
    $core.String? teamId,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    if (teamId != null) {
      $result.teamId = teamId;
    }
    return $result;
  }
  CreateTeamResponse._() : super();
  factory CreateTeamResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateTeamResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateTeamResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'team'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..aOS(2, _omitFieldNames ? '' : 'teamId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateTeamResponse clone() => CreateTeamResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateTeamResponse copyWith(void Function(CreateTeamResponse) updates) => super.copyWith((message) => updates(message as CreateTeamResponse)) as CreateTeamResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateTeamResponse create() => CreateTeamResponse._();
  CreateTeamResponse createEmptyInstance() => create();
  static $pb.PbList<CreateTeamResponse> createRepeated() => $pb.PbList<CreateTeamResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateTeamResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateTeamResponse>(create);
  static CreateTeamResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get teamId => $_getSZ(1);
  @$pb.TagNumber(2)
  set teamId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTeamId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTeamId() => clearField(2);
}

class JoinTeamRequest extends $pb.GeneratedMessage {
  factory JoinTeamRequest({
    $core.String? teamId,
  }) {
    final $result = create();
    if (teamId != null) {
      $result.teamId = teamId;
    }
    return $result;
  }
  JoinTeamRequest._() : super();
  factory JoinTeamRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JoinTeamRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'JoinTeamRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'team'), createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'teamId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JoinTeamRequest clone() => JoinTeamRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JoinTeamRequest copyWith(void Function(JoinTeamRequest) updates) => super.copyWith((message) => updates(message as JoinTeamRequest)) as JoinTeamRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinTeamRequest create() => JoinTeamRequest._();
  JoinTeamRequest createEmptyInstance() => create();
  static $pb.PbList<JoinTeamRequest> createRepeated() => $pb.PbList<JoinTeamRequest>();
  @$core.pragma('dart2js:noInline')
  static JoinTeamRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JoinTeamRequest>(create);
  static JoinTeamRequest? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get teamId => $_getSZ(0);
  @$pb.TagNumber(2)
  set teamId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasTeamId() => $_has(0);
  @$pb.TagNumber(2)
  void clearTeamId() => clearField(2);
}

class JoinTeamResponse extends $pb.GeneratedMessage {
  factory JoinTeamResponse({
    $core.String? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  JoinTeamResponse._() : super();
  factory JoinTeamResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JoinTeamResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'JoinTeamResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'team'), createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JoinTeamResponse clone() => JoinTeamResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JoinTeamResponse copyWith(void Function(JoinTeamResponse) updates) => super.copyWith((message) => updates(message as JoinTeamResponse)) as JoinTeamResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinTeamResponse create() => JoinTeamResponse._();
  JoinTeamResponse createEmptyInstance() => create();
  static $pb.PbList<JoinTeamResponse> createRepeated() => $pb.PbList<JoinTeamResponse>();
  @$core.pragma('dart2js:noInline')
  static JoinTeamResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JoinTeamResponse>(create);
  static JoinTeamResponse? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class LeaveTeamRequest extends $pb.GeneratedMessage {
  factory LeaveTeamRequest({
    $core.String? teamId,
  }) {
    final $result = create();
    if (teamId != null) {
      $result.teamId = teamId;
    }
    return $result;
  }
  LeaveTeamRequest._() : super();
  factory LeaveTeamRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LeaveTeamRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LeaveTeamRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'team'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'teamId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LeaveTeamRequest clone() => LeaveTeamRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LeaveTeamRequest copyWith(void Function(LeaveTeamRequest) updates) => super.copyWith((message) => updates(message as LeaveTeamRequest)) as LeaveTeamRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LeaveTeamRequest create() => LeaveTeamRequest._();
  LeaveTeamRequest createEmptyInstance() => create();
  static $pb.PbList<LeaveTeamRequest> createRepeated() => $pb.PbList<LeaveTeamRequest>();
  @$core.pragma('dart2js:noInline')
  static LeaveTeamRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LeaveTeamRequest>(create);
  static LeaveTeamRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get teamId => $_getSZ(0);
  @$pb.TagNumber(1)
  set teamId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTeamId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTeamId() => clearField(1);
}

class LeaveTeamResponse extends $pb.GeneratedMessage {
  factory LeaveTeamResponse({
    $core.String? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  LeaveTeamResponse._() : super();
  factory LeaveTeamResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LeaveTeamResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LeaveTeamResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'team'), createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LeaveTeamResponse clone() => LeaveTeamResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LeaveTeamResponse copyWith(void Function(LeaveTeamResponse) updates) => super.copyWith((message) => updates(message as LeaveTeamResponse)) as LeaveTeamResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LeaveTeamResponse create() => LeaveTeamResponse._();
  LeaveTeamResponse createEmptyInstance() => create();
  static $pb.PbList<LeaveTeamResponse> createRepeated() => $pb.PbList<LeaveTeamResponse>();
  @$core.pragma('dart2js:noInline')
  static LeaveTeamResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LeaveTeamResponse>(create);
  static LeaveTeamResponse? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
