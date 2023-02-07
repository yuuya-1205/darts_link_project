// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      id: json['id'] as String,
      createrId: json['createrId'] as String,
      userName: json['userName'] as String,
      userId: json['userId'] as String,
      text: json['text'] as String,
      posterRef: const DocumentReferenceConverter()
          .fromJson(json['posterRef'] as DocumentReference<Object?>),
      userImage: json['userImage'] as String? ?? '',
      postImage: (json['postImage'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      liked:
          (json['liked'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'createrId': instance.createrId,
      'userName': instance.userName,
      'userId': instance.userId,
      'text': instance.text,
      'posterRef':
          const DocumentReferenceConverter().toJson(instance.posterRef),
      'userImage': instance.userImage,
      'postImage': instance.postImage,
      'liked': instance.liked,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
