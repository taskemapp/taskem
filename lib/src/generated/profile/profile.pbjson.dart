//
//  Generated code. Do not modify.
//  source: profile.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use addOrUpdateAvatarRequestDescriptor instead')
const AddOrUpdateAvatarRequest$json = {
  '1': 'AddOrUpdateAvatarRequest',
  '2': [
    {'1': 'avatar_image', '3': 2, '4': 1, '5': 12, '10': 'avatarImage'},
  ],
};

/// Descriptor for `AddOrUpdateAvatarRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addOrUpdateAvatarRequestDescriptor = $convert.base64Decode(
    'ChhBZGRPclVwZGF0ZUF2YXRhclJlcXVlc3QSIQoMYXZhdGFyX2ltYWdlGAIgASgMUgthdmF0YX'
    'JJbWFnZQ==');

@$core.Deprecated('Use getProfileResponseDescriptor instead')
const GetProfileResponse$json = {
  '1': 'GetProfileResponse',
  '2': [
    {'1': 'avatar', '3': 1, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'user_name', '3': 2, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `GetProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProfileResponseDescriptor = $convert.base64Decode(
    'ChJHZXRQcm9maWxlUmVzcG9uc2USFgoGYXZhdGFyGAEgASgJUgZhdmF0YXISGwoJdXNlcl9uYW'
    '1lGAIgASgJUgh1c2VyTmFtZRIUCgVlbWFpbBgDIAEoCVIFZW1haWw=');

