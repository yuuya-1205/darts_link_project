// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Member _$$_MemberFromJson(Map<String, dynamic> json) => _$_Member(
      uid: json['uid'] as String,
      userName: json['userName'] as String,
      userId: json['userId'] as String,
      userImage: json['userImage'] as String,
      joinedAt:
          const TimestampConverter().fromJson(json['joinedAt'] as Timestamp),
    );

Map<String, dynamic> _$$_MemberToJson(_$_Member instance) => <String, dynamic>{
      'uid': instance.uid,
      'userName': instance.userName,
      'userId': instance.userId,
      'userImage': instance.userImage,
      'joinedAt': const TimestampConverter().toJson(instance.joinedAt),
    };
