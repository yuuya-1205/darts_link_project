// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_tornament_join_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HouseTornamentJoinRequest _$$_HouseTornamentJoinRequestFromJson(
        Map<String, dynamic> json) =>
    _$_HouseTornamentJoinRequest(
      userName: json['userName'] as String,
      uid: json['uid'] as String,
      userId: json['userId'] as String,
      userImage: json['userImage'] as String,
      approvedAt: _$JsonConverterFromJson<Timestamp, Timestamp>(
          json['approvedAt'], const TimestampConverter().fromJson),
      requestedAt:
          const TimestampConverter().fromJson(json['requestedAt'] as Timestamp),
      status: $enumDecodeNullable(
              _$HouseTornamentJoinRequestStatusEnumMap, json['status']) ??
          HouseTornamentJoinRequestStatus.requesting,
    );

Map<String, dynamic> _$$_HouseTornamentJoinRequestToJson(
        _$_HouseTornamentJoinRequest instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'uid': instance.uid,
      'userId': instance.userId,
      'userImage': instance.userImage,
      'approvedAt': _$JsonConverterToJson<Timestamp, Timestamp>(
          instance.approvedAt, const TimestampConverter().toJson),
      'requestedAt': const TimestampConverter().toJson(instance.requestedAt),
      'status': _$HouseTornamentJoinRequestStatusEnumMap[instance.status]!,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$HouseTornamentJoinRequestStatusEnumMap = {
  HouseTornamentJoinRequestStatus.requesting: 'requesting',
  HouseTornamentJoinRequestStatus.approved: 'approved',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
