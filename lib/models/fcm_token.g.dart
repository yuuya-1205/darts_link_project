// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FcmToken _$$_FcmTokenFromJson(Map<String, dynamic> json) => _$_FcmToken(
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
      userReference: const DocumentReferenceConverter()
          .fromJson(json['userReference'] as DocumentReference<Object?>),
      fcmTokens:
          (json['fcmTokens'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_FcmTokenToJson(_$_FcmToken instance) =>
    <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'userReference':
          const DocumentReferenceConverter().toJson(instance.userReference),
      'fcmTokens': instance.fcmTokens,
    };
