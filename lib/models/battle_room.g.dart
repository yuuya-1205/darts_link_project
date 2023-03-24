// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battle_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BattleRoom _$$_BattleRoomFromJson(Map<String, dynamic> json) =>
    _$_BattleRoom(
      id: json['id'] as String,
      title: json['title'] as String,
      place: json['place'] as String? ?? '',
      prefecture: const PrefNullableConverter()
          .fromJson(json['prefecture'] as Map<String, dynamic>?),
      city: const CityNullableConverter()
          .fromJson(json['city'] as Map<String, dynamic>?),
      dateTime:
          const TimestampConverter().fromJson(json['dateTime'] as Timestamp),
      startTime:
          const TimestampConverter().fromJson(json['startTime'] as Timestamp),
      finishTime:
          const TimestampConverter().fromJson(json['finishTime'] as Timestamp),
      fetures: (json['fetures'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      dartsModels: (json['dartsModels'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      detail: json['detail'] as String? ?? '',
      numberOfParticipants: json['numberOfParticipants'] as int? ?? 1,
      isApproved: json['isApproved'] as bool? ?? false,
      ownerId: json['ownerId'] as String,
      createrName: json['createrName'] as String,
      createrImage: json['createrImage'] as String,
      userId: json['userId'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
      followingCount: json['followingCount'] as int? ?? 0,
      followerCount: json['followerCount'] as int? ?? 0,
      capacity: json['capacity'] as int? ?? 1,
    );

Map<String, dynamic> _$$_BattleRoomToJson(_$_BattleRoom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'place': instance.place,
      'prefecture': const PrefNullableConverter().toJson(instance.prefecture),
      'city': const CityNullableConverter().toJson(instance.city),
      'dateTime': const TimestampConverter().toJson(instance.dateTime),
      'startTime': const TimestampConverter().toJson(instance.startTime),
      'finishTime': const TimestampConverter().toJson(instance.finishTime),
      'fetures': instance.fetures,
      'dartsModels': instance.dartsModels,
      'detail': instance.detail,
      'numberOfParticipants': instance.numberOfParticipants,
      'isApproved': instance.isApproved,
      'ownerId': instance.ownerId,
      'createrName': instance.createrName,
      'createrImage': instance.createrImage,
      'userId': instance.userId,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'followingCount': instance.followingCount,
      'followerCount': instance.followerCount,
      'capacity': instance.capacity,
    };
