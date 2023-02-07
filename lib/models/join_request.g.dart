// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'join_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JoinRequest _$$_JoinRequestFromJson(Map<String, dynamic> json) =>
    _$_JoinRequest(
      userName: json['userName'] as String,
      uid: json['uid'] as String,
      userId: json['userId'] as String,
      userImage: json['userImage'] as String,
      approvedAt: _$JsonConverterFromJson<Timestamp, Timestamp>(
          json['approvedAt'], const TimestampConverter().fromJson),
      requestedAt:
          const TimestampConverter().fromJson(json['requestedAt'] as Timestamp),
      status: $enumDecodeNullable(_$JoinRequestStatusEnumMap, json['status']) ??
          JoinRequestStatus.requesting,
    );

Map<String, dynamic> _$$_JoinRequestToJson(_$_JoinRequest instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'uid': instance.uid,
      'userId': instance.userId,
      'userImage': instance.userImage,
      'approvedAt': _$JsonConverterToJson<Timestamp, Timestamp>(
          instance.approvedAt, const TimestampConverter().toJson),
      'requestedAt': const TimestampConverter().toJson(instance.requestedAt),
      'status': _$JoinRequestStatusEnumMap[instance.status]!,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$JoinRequestStatusEnumMap = {
  JoinRequestStatus.requesting: 'requesting',
  JoinRequestStatus.approved: 'approved',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
