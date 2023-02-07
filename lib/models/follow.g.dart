// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'follow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Follow _$$_FollowFromJson(Map<String, dynamic> json) => _$_Follow(
      followingUid: json['followingUid'] as String,
      userName: json['userName'] as String,
      userId: json['userId'] as String,
      userImage: json['userImage'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$_FollowToJson(_$_Follow instance) => <String, dynamic>{
      'followingUid': instance.followingUid,
      'userName': instance.userName,
      'userId': instance.userId,
      'userImage': instance.userImage,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
