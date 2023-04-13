// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SortState _$$_SortStateFromJson(Map<String, dynamic> json) => _$_SortState(
      pref: json['pref'] == null
          ? null
          : Pref.fromJson(json['pref'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      isRecruitment: json['isRecruitment'] as bool? ?? false,
    );

Map<String, dynamic> _$$_SortStateToJson(_$_SortState instance) =>
    <String, dynamic>{
      'pref': instance.pref,
      'city': instance.city,
      'date': instance.date?.toIso8601String(),
      'isRecruitment': instance.isRecruitment,
    };
