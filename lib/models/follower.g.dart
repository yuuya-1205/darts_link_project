// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follower.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Follower _$$_FollowerFromJson(Map<String, dynamic> json) => _$_Follower(
      followerUid: json['followerUid'] as String,
      userName: json['userName'] as String,
      userId: json['userId'] as String,
      userImage: json['userImage'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$_FollowerToJson(_$_Follower instance) =>
    <String, dynamic>{
      'followerUid': instance.followerUid,
      'userName': instance.userName,
      'userId': instance.userId,
      'userImage': instance.userImage,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
