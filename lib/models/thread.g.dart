// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Thread _$$_ThreadFromJson(Map<String, dynamic> json) => _$_Thread(
      id: json['id'] as String,
      isReading: json['isReading'] as bool,
      lastChat: json['lastChat'] as String? ?? '',
      uids:
          (json['uids'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      memberDetails: json['memberDetails'] as Map<String, dynamic>? ?? const {},
      unReadCount: (json['unReadCount'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as int),
          ) ??
          const {},
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$_ThreadToJson(_$_Thread instance) => <String, dynamic>{
      'id': instance.id,
      'isReading': instance.isReading,
      'lastChat': instance.lastChat,
      'uids': instance.uids,
      'memberDetails': instance.memberDetails,
      'unReadCount': instance.unReadCount,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
