// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round_robin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoundRobin _$$_RoundRobinFromJson(Map<String, dynamic> json) =>
    _$_RoundRobin(
      title: json['title'] as String? ?? '未設定',
      id: json['id'] as String? ?? '',
      creatorRef: const DocumentReferenceConverter()
          .fromJson(json['creatorRef'] as DocumentReference<Object?>),
      createrName: json['createrName'] as String,
      userId: json['userId'] as String,
      teamCounts: json['teamCounts'] as int? ?? 1,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$_RoundRobinToJson(_$_RoundRobin instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'creatorRef':
          const DocumentReferenceConverter().toJson(instance.creatorRef),
      'createrName': instance.createrName,
      'userId': instance.userId,
      'teamCounts': instance.teamCounts,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
