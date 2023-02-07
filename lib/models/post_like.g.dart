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
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$_PostLikeToJson(_$_PostLike instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'uid': instance.uid,
      'userId': instance.userId,
      'userImage': instance.userImage,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
