//
//  Generated code. Do not modify.
//  source: team.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getTeamRolesRequestDescriptor instead')
const GetTeamRolesRequest$json = {
  '1': 'GetTeamRolesRequest',
  '2': [
    {'1': 'team_id', '3': 1, '4': 1, '5': 9, '10': 'teamId'},
  ],
};

/// Descriptor for `GetTeamRolesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTeamRolesRequestDescriptor = $convert.base64Decode(
    'ChNHZXRUZWFtUm9sZXNSZXF1ZXN0EhcKB3RlYW1faWQYASABKAlSBnRlYW1JZA==');

@$core.Deprecated('Use changeTeamRoleDescriptor instead')
const ChangeTeamRole$json = {
  '1': 'ChangeTeamRole',
  '2': [
    {'1': 'role_id', '3': 1, '4': 1, '5': 9, '10': 'roleId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `ChangeTeamRole`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changeTeamRoleDescriptor = $convert.base64Decode(
    'Cg5DaGFuZ2VUZWFtUm9sZRIXCgdyb2xlX2lkGAEgASgJUgZyb2xlSWQSFwoHdXNlcl9pZBgCIA'
    'EoCVIGdXNlcklk');

@$core.Deprecated('Use getTeamRolesResponseDescriptor instead')
const GetTeamRolesResponse$json = {
  '1': 'GetTeamRolesResponse',
  '2': [
    {'1': 'roles', '3': 1, '4': 3, '5': 11, '6': '.team.Role', '10': 'roles'},
  ],
};

/// Descriptor for `GetTeamRolesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTeamRolesResponseDescriptor = $convert.base64Decode(
    'ChRHZXRUZWFtUm9sZXNSZXNwb25zZRIgCgVyb2xlcxgBIAMoCzIKLnRlYW0uUm9sZVIFcm9sZX'
    'M=');

@$core.Deprecated('Use roleDescriptor instead')
const Role$json = {
  '1': 'Role',
  '2': [
    {'1': 'role_name', '3': 1, '4': 1, '5': 9, '10': 'roleName'},
    {'1': 'priority', '3': 2, '4': 1, '5': 5, '10': 'priority'},
    {'1': 'permission', '3': 3, '4': 1, '5': 11, '6': '.team.RolePermission', '10': 'permission'},
  ],
};

/// Descriptor for `Role`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roleDescriptor = $convert.base64Decode(
    'CgRSb2xlEhsKCXJvbGVfbmFtZRgBIAEoCVIIcm9sZU5hbWUSGgoIcHJpb3JpdHkYAiABKAVSCH'
    'ByaW9yaXR5EjQKCnBlcm1pc3Npb24YAyABKAsyFC50ZWFtLlJvbGVQZXJtaXNzaW9uUgpwZXJt'
    'aXNzaW9u');

@$core.Deprecated('Use rolePermissionDescriptor instead')
const RolePermission$json = {
  '1': 'RolePermission',
  '2': [
    {'1': 'can_add_task', '3': 1, '4': 1, '5': 8, '10': 'canAddTask'},
    {'1': 'can_assign_task', '3': 2, '4': 1, '5': 8, '10': 'canAssignTask'},
    {'1': 'can_approve_task', '3': 3, '4': 1, '5': 8, '10': 'canApproveTask'},
    {'1': 'can_invite_in_team', '3': 4, '4': 1, '5': 8, '10': 'canInviteInTeam'},
    {'1': 'can_create_roles', '3': 5, '4': 1, '5': 8, '10': 'canCreateRoles'},
  ],
};

/// Descriptor for `RolePermission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rolePermissionDescriptor = $convert.base64Decode(
    'Cg5Sb2xlUGVybWlzc2lvbhIgCgxjYW5fYWRkX3Rhc2sYASABKAhSCmNhbkFkZFRhc2sSJgoPY2'
    'FuX2Fzc2lnbl90YXNrGAIgASgIUg1jYW5Bc3NpZ25UYXNrEigKEGNhbl9hcHByb3ZlX3Rhc2sY'
    'AyABKAhSDmNhbkFwcHJvdmVUYXNrEisKEmNhbl9pbnZpdGVfaW5fdGVhbRgEIAEoCFIPY2FuSW'
    '52aXRlSW5UZWFtEigKEGNhbl9jcmVhdGVfcm9sZXMYBSABKAhSDmNhbkNyZWF0ZVJvbGVz');

@$core.Deprecated('Use getTeamRequestDescriptor instead')
const GetTeamRequest$json = {
  '1': 'GetTeamRequest',
  '2': [
    {'1': 'team_id', '3': 1, '4': 1, '5': 9, '10': 'teamId'},
  ],
};

/// Descriptor for `GetTeamRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTeamRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRUZWFtUmVxdWVzdBIXCgd0ZWFtX2lkGAEgASgJUgZ0ZWFtSWQ=');

@$core.Deprecated('Use getAllTeamsResponseDescriptor instead')
const GetAllTeamsResponse$json = {
  '1': 'GetAllTeamsResponse',
  '2': [
    {'1': 'teams', '3': 1, '4': 3, '5': 11, '6': '.team.TeamResponse', '10': 'teams'},
  ],
};

/// Descriptor for `GetAllTeamsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllTeamsResponseDescriptor = $convert.base64Decode(
    'ChNHZXRBbGxUZWFtc1Jlc3BvbnNlEigKBXRlYW1zGAEgAygLMhIudGVhbS5UZWFtUmVzcG9uc2'
    'VSBXRlYW1z');

@$core.Deprecated('Use teamResponseDescriptor instead')
const TeamResponse$json = {
  '1': 'TeamResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'members', '3': 4, '4': 3, '5': 11, '6': '.team.UserInfo', '10': 'members'},
    {'1': 'creator', '3': 5, '4': 1, '5': 9, '10': 'creator'},
  ],
};

/// Descriptor for `TeamResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List teamResponseDescriptor = $convert.base64Decode(
    'CgxUZWFtUmVzcG9uc2USDgoCaWQYASABKAlSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSIAoLZG'
    'VzY3JpcHRpb24YAyABKAlSC2Rlc2NyaXB0aW9uEigKB21lbWJlcnMYBCADKAsyDi50ZWFtLlVz'
    'ZXJJbmZvUgdtZW1iZXJzEhgKB2NyZWF0b3IYBSABKAlSB2NyZWF0b3I=');

@$core.Deprecated('Use userInfoDescriptor instead')
const UserInfo$json = {
  '1': 'UserInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'user_name', '3': 2, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'role', '3': 3, '4': 1, '5': 9, '10': 'role'},
  ],
};

/// Descriptor for `UserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInfoDescriptor = $convert.base64Decode(
    'CghVc2VySW5mbxIOCgJpZBgBIAEoCVICaWQSGwoJdXNlcl9uYW1lGAIgASgJUgh1c2VyTmFtZR'
    'ISCgRyb2xlGAMgASgJUgRyb2xl');

@$core.Deprecated('Use createTeamRequestDescriptor instead')
const CreateTeamRequest$json = {
  '1': 'CreateTeamRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `CreateTeamRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTeamRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVUZWFtUmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1lEiAKC2Rlc2NyaXB0aW9uGA'
    'IgASgJUgtkZXNjcmlwdGlvbg==');

@$core.Deprecated('Use createTeamResponseDescriptor instead')
const CreateTeamResponse$json = {
  '1': 'CreateTeamResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    {'1': 'team_id', '3': 2, '4': 1, '5': 9, '10': 'teamId'},
  ],
};

/// Descriptor for `CreateTeamResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTeamResponseDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVUZWFtUmVzcG9uc2USGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZRIXCgd0ZWFtX2'
    'lkGAIgASgJUgZ0ZWFtSWQ=');

@$core.Deprecated('Use joinTeamRequestDescriptor instead')
const JoinTeamRequest$json = {
  '1': 'JoinTeamRequest',
  '2': [
    {'1': 'team_id', '3': 2, '4': 1, '5': 9, '10': 'teamId'},
  ],
};

/// Descriptor for `JoinTeamRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinTeamRequestDescriptor = $convert.base64Decode(
    'Cg9Kb2luVGVhbVJlcXVlc3QSFwoHdGVhbV9pZBgCIAEoCVIGdGVhbUlk');

@$core.Deprecated('Use joinTeamResponseDescriptor instead')
const JoinTeamResponse$json = {
  '1': 'JoinTeamResponse',
  '2': [
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `JoinTeamResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinTeamResponseDescriptor = $convert.base64Decode(
    'ChBKb2luVGVhbVJlc3BvbnNlEhgKB21lc3NhZ2UYAiABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use leaveTeamRequestDescriptor instead')
const LeaveTeamRequest$json = {
  '1': 'LeaveTeamRequest',
  '2': [
    {'1': 'team_id', '3': 1, '4': 1, '5': 9, '10': 'teamId'},
  ],
};

/// Descriptor for `LeaveTeamRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leaveTeamRequestDescriptor = $convert.base64Decode(
    'ChBMZWF2ZVRlYW1SZXF1ZXN0EhcKB3RlYW1faWQYASABKAlSBnRlYW1JZA==');

@$core.Deprecated('Use leaveTeamResponseDescriptor instead')
const LeaveTeamResponse$json = {
  '1': 'LeaveTeamResponse',
  '2': [
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `LeaveTeamResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leaveTeamResponseDescriptor = $convert.base64Decode(
    'ChFMZWF2ZVRlYW1SZXNwb25zZRIYCgdtZXNzYWdlGAIgASgJUgdtZXNzYWdl');

