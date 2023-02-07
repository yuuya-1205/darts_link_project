// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      id: json['id'] as String,
      userName: json['userName'] as String,
      uid: json['uid'] as String,
      userId: json['userId'] as String,
      userImage: json['userImage'] as String,
      text: json['text'] as String? ?? '',
      commentImage: (json['commentImage'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'uid': instance.uid,
      'userId': instance.userId,
      'userImage': instance.userImage,
      'text': instance.text,
      'commentImage': instance.commentImage,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
