// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tournament _$$_TournamentFromJson(Map<String, dynamic> json) =>
    _$_Tournament(
      title: json['title'] as String? ?? '未設定',
      creatorRef: const DocumentReferenceConverter()
          .fromJson(json['creatorRef'] as DocumentReference<Object?>),
      creatorName: json['creatorName'] as String,
      teamCounts: json['teamCounts'] as int? ?? 2,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
      reference: _$JsonConverterFromJson<DocumentReference<Object?>,
              DocumentReference<Object?>>(
          json['reference'], const DocumentReferenceConverter().fromJson),
    );

Map<String, dynamic> _$$_TournamentToJson(_$_Tournament instance) =>
    <String, dynamic>{
      'title': instance.title,
      'creatorRef':
          const DocumentReferenceConverter().toJson(instance.creatorRef),
      'creatorName': instance.creatorName,
      'teamCounts': instance.teamCounts,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'reference': _$JsonConverterToJson<DocumentReference<Object?>,
              DocumentReference<Object?>>(
          instance.reference, const DocumentReferenceConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
