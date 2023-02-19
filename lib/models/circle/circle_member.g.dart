// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circle_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CircleMember _$$_CircleMemberFromJson(Map<String, dynamic> json) =>
    _$_CircleMember(
      uid: json['uid'] as String,
      userName: json['userName'] as String,
      userId: json['userId'] as String,
      userImage: json['userImage'] as String,
      followerCount: json['followerCount'] as int,
      followingCount: json['followingCount'] as int,
      joinedAt:
          const TimestampConverter().fromJson(json['joinedAt'] as Timestamp),
    );

Map<String, dynamic> _$$_CircleMemberToJson(_$_CircleMember instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'userName': instance.userName,
      'userId': instance.userId,
      'userImage': instance.userImage,
      'followerCount': instance.followerCount,
      'followingCount': instance.followingCount,
      'joinedAt': const TimestampConverter().toJson(instance.joinedAt),
    };
