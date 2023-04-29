// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostLike _$$_PostLikeFromJson(Map<String, dynamic> json) => _$_PostLike(
      userName: json['userName'] as String,
      uid: json['uid'] as String,
      userId: json['userId'] as String,
      userImage: json['userImage'] as String,
      reference: _$JsonConverterFromJson<DocumentReference<Object?>,
              DocumentReference<Object?>>(
          json['reference'], const DocumentReferenceConverter().fromJson),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$_PostLikeToJson(_$_PostLike instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'uid': instance.uid,
      'userId': instance.userId,
      'userImage': instance.userImage,
      'reference': _$JsonConverterToJson<DocumentReference<Object?>,
              DocumentReference<Object?>>(
          instance.reference, const DocumentReferenceConverter().toJson),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
