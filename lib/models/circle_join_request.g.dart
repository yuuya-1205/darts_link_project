// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circle_join_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_CircleJoinRequest _$$_CircleJoinRequestFromJson(Map<String, dynamic> json) =>
    _$_CircleJoinRequest(
      userName: json['userName'] as String,
      uid: json['uid'] as String,
      userId: json['userId'] as String,
      userImage: json['userImage'] as String,
      approvedAt: _$JsonConverterFromJson<Timestamp, Timestamp>(
          json['approvedAt'], const TimestampConverter().fromJson),
      requestedAt:
          const TimestampConverter().fromJson(json['requestedAt'] as Timestamp),
      status: $enumDecodeNullable(
              _$CircleJoinRequestStatusEnumMap, json['status']) ??
          CircleJoinRequestStatus.requesting,
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_CircleJoinRequestToJson(
        _$_CircleJoinRequest instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'uid': instance.uid,
      'userId': instance.userId,
      'userImage': instance.userImage,
      'approvedAt': _$JsonConverterToJson<Timestamp, Timestamp>(
          instance.approvedAt, const TimestampConverter().toJson),
      'requestedAt': const TimestampConverter().toJson(instance.requestedAt),
      'status': _$CircleJoinRequestStatusEnumMap[instance.status]!,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$CircleJoinRequestStatusEnumMap = {
  CircleJoinRequestStatus.requesting: 'requesting',
  CircleJoinRequestStatus.approved: 'approved',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
