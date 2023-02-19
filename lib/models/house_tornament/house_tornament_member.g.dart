// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_tornament_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HouseTornamentMember _$$_HouseTornamentMemberFromJson(
        Map<String, dynamic> json) =>
    _$_HouseTornamentMember(
      uid: json['uid'] as String,
      userName: json['userName'] as String,
      userId: json['userId'] as String,
      userImage: json['userImage'] as String,
      joinedAt:
          const TimestampConverter().fromJson(json['joinedAt'] as Timestamp),
    );

Map<String, dynamic> _$$_HouseTornamentMemberToJson(
        _$_HouseTornamentMember instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'userName': instance.userName,
      'userId': instance.userId,
      'userImage': instance.userImage,
      'joinedAt': const TimestampConverter().toJson(instance.joinedAt),
    };
