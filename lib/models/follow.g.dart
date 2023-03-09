// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Follow _$$_FollowFromJson(Map<String, dynamic> json) => _$_Follow(
      followingRef: const DocumentReferenceConverter()
          .fromJson(json['followingRef'] as DocumentReference<Object?>),
      userName: json['userName'] as String,
      userId: json['userId'] as String,
      userImage: json['userImage'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$_FollowToJson(_$_Follow instance) => <String, dynamic>{
      'followingRef':
          const DocumentReferenceConverter().toJson(instance.followingRef),
      'userName': instance.userName,
      'userId': instance.userId,
      'userImage': instance.userImage,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
