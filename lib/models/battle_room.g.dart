// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battle_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_BattleRoom _$$_BattleRoomFromJson(Map<String, dynamic> json) =>
    _$_BattleRoom(
      id: json['id'] as String,
      title: json['title'] as String,
      place: json['place'] as String? ?? '',
      prefecture: json['prefecture'] as String? ?? '未登録',
      city: json['city'] as String? ?? '未登録',
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
      numberOfParticipants: json['numberOfParticipants'] as int? ?? 0,
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
      capacity: json['capacity'] as int? ?? 0,
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_BattleRoomToJson(_$_BattleRoom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'place': instance.place,
      'prefecture': instance.prefecture,
      'city': instance.city,
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
