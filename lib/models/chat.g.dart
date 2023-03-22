// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Chat _$$_ChatFromJson(Map<String, dynamic> json) => _$_Chat(
      text: json['text'] as String,
      uid: json['uid'] as String,
      threadId: json['threadId'] as String,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isReading: (json['isReading'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as bool),
          ) ??
          const {},
      reference: const DocumentReferenceConverter()
          .fromJson(json['reference'] as DocumentReference<Object?>),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$_ChatToJson(_$_Chat instance) => <String, dynamic>{
      'text': instance.text,
      'uid': instance.uid,
      'threadId': instance.threadId,
      'imageUrls': instance.imageUrls,
      'isReading': instance.isReading,
      'reference':
          const DocumentReferenceConverter().toJson(instance.reference),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
