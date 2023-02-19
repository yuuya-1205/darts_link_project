// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_tornament.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HouseTornament _$$_HouseTornamentFromJson(Map<String, dynamic> json) =>
    _$_HouseTornament(
      houseTornamentId: json['houseTornamentId'] as String,
      title: json['title'] as String,
      uid: json['uid'] as String,
      headerImage: json['headerImage'] as String? ?? '',
      place: json['place'] as String? ?? '',
      prefecture: const PrefNullableConverter()
          .fromJson(json['prefecture'] as Map<String, dynamic>?),
      city: const CityNullableConverter()
          .fromJson(json['city'] as Map<String, dynamic>?),
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      capacity: json['capacity'] as int? ?? 0,
      numberOfParticipants: json['numberOfParticipants'] as int? ?? 0,
      dartsModels: (json['dartsModels'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      formats: (json['formats'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      dateTime:
          const TimestampConverter().fromJson(json['dateTime'] as Timestamp),
      startTime:
          const TimestampConverter().fromJson(json['startTime'] as Timestamp),
      finishTime:
          const TimestampConverter().fromJson(json['finishTime'] as Timestamp),
      detail: json['detail'] as String? ?? '',
      isApproved: json['isApproved'] as bool? ?? false,
      isFinalTornament: json['isFinalTornament'] as bool? ?? false,
      ownerId: json['ownerId'] as String,
      createrName: json['createrName'] as String,
      createrImage: json['createrImage'] as String,
      userId: json['userId'] as String,
      followingCount: json['followingCount'] as int? ?? 0,
      followerCount: json['followerCount'] as int? ?? 0,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$_HouseTornamentToJson(_$_HouseTornament instance) =>
    <String, dynamic>{
      'houseTornamentId': instance.houseTornamentId,
      'title': instance.title,
      'uid': instance.uid,
      'headerImage': instance.headerImage,
      'place': instance.place,
      'prefecture': const PrefNullableConverter().toJson(instance.prefecture),
      'city': const CityNullableConverter().toJson(instance.city),
      'features': instance.features,
      'capacity': instance.capacity,
      'numberOfParticipants': instance.numberOfParticipants,
      'dartsModels': instance.dartsModels,
      'formats': instance.formats,
      'dateTime': const TimestampConverter().toJson(instance.dateTime),
      'startTime': const TimestampConverter().toJson(instance.startTime),
      'finishTime': const TimestampConverter().toJson(instance.finishTime),
      'detail': instance.detail,
      'isApproved': instance.isApproved,
      'isFinalTornament': instance.isFinalTornament,
      'ownerId': instance.ownerId,
      'createrName': instance.createrName,
      'createrImage': instance.createrImage,
      'userId': instance.userId,
      'followingCount': instance.followingCount,
      'followerCount': instance.followerCount,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
