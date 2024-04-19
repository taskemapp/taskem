//
//  Generated code. Do not modify.
//  source: task.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getTeamTasksRequestDescriptor instead')
const GetTeamTasksRequest$json = {
  '1': 'GetTeamTasksRequest',
  '2': [
    {'1': 'team_id', '3': 1, '4': 1, '5': 9, '10': 'teamId'},
  ],
};

/// Descriptor for `GetTeamTasksRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTeamTasksRequestDescriptor = $convert.base64Decode(
    'ChNHZXRUZWFtVGFza3NSZXF1ZXN0EhcKB3RlYW1faWQYASABKAlSBnRlYW1JZA==');

@$core.Deprecated('Use createTaskRequestDescriptor instead')
const CreateTaskRequest$json = {
  '1': 'CreateTaskRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'end_timestamp', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endTimestamp'},
    {'1': 'team_id', '3': 4, '4': 1, '5': 9, '10': 'teamId'},
  ],
};

/// Descriptor for `CreateTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTaskRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVUYXNrUmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1lEiAKC2Rlc2NyaXB0aW9uGA'
    'IgASgJUgtkZXNjcmlwdGlvbhI/Cg1lbmRfdGltZXN0YW1wGAMgASgLMhouZ29vZ2xlLnByb3Rv'
    'YnVmLlRpbWVzdGFtcFIMZW5kVGltZXN0YW1wEhcKB3RlYW1faWQYBCABKAlSBnRlYW1JZA==');

@$core.Deprecated('Use getTaskRequestDescriptor instead')
const GetTaskRequest$json = {
  '1': 'GetTaskRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTaskRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRUYXNrUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');

@$core.Deprecated('Use assignTaskRequestDescriptor instead')
const AssignTaskRequest$json = {
  '1': 'AssignTaskRequest',
  '2': [
    {'1': 'task_id', '3': 1, '4': 1, '5': 9, '10': 'taskId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `AssignTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assignTaskRequestDescriptor = $convert.base64Decode(
    'ChFBc3NpZ25UYXNrUmVxdWVzdBIXCgd0YXNrX2lkGAEgASgJUgZ0YXNrSWQSFwoHdXNlcl9pZB'
    'gCIAEoCVIGdXNlcklk');

@$core.Deprecated('Use taskResponseDescriptor instead')
const TaskResponse$json = {
  '1': 'TaskResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'created_timestamp', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdTimestamp'},
    {'1': 'end_timestamp', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endTimestamp'},
    {'1': 'assigned_users', '3': 6, '4': 3, '5': 11, '6': '.team.UserInfo', '10': 'assignedUsers'},
    {'1': 'status', '3': 7, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `TaskResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskResponseDescriptor = $convert.base64Decode(
    'CgxUYXNrUmVzcG9uc2USDgoCaWQYASABKAlSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSIAoLZG'
    'VzY3JpcHRpb24YAyABKAlSC2Rlc2NyaXB0aW9uEkcKEWNyZWF0ZWRfdGltZXN0YW1wGAQgASgL'
    'MhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIQY3JlYXRlZFRpbWVzdGFtcBI/Cg1lbmRfdG'
    'ltZXN0YW1wGAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIMZW5kVGltZXN0YW1w'
    'EjUKDmFzc2lnbmVkX3VzZXJzGAYgAygLMg4udGVhbS5Vc2VySW5mb1INYXNzaWduZWRVc2Vycx'
    'IWCgZzdGF0dXMYByABKAlSBnN0YXR1cw==');

@$core.Deprecated('Use getAllResponseDescriptor instead')
const GetAllResponse$json = {
  '1': 'GetAllResponse',
  '2': [
    {'1': 'tasks', '3': 1, '4': 3, '5': 11, '6': '.task.TaskResponse', '10': 'tasks'},
  ],
};

/// Descriptor for `GetAllResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllResponseDescriptor = $convert.base64Decode(
    'Cg5HZXRBbGxSZXNwb25zZRIoCgV0YXNrcxgBIAMoCzISLnRhc2suVGFza1Jlc3BvbnNlUgV0YX'
    'Nrcw==');

