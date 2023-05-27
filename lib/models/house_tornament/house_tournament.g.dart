// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_tournament.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HouseTournament _$$_HouseTournamentFromJson(Map<String, dynamic> json) =>
    _$_HouseTournament(
      houseTournamentId: json['houseTournamentId'] as String,
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
              ?.map((e) =>
                  const DartsModelTagTypeConverter().fromJson(e as String))
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
      isFinalTournament: json['isFinalTournament'] as bool? ?? false,
      ownerReference: const DocumentReferenceConverter()
          .fromJson(json['ownerReference'] as DocumentReference<Object?>),
      creatorName: json['creatorName'] as String,
      creatorImage: json['creatorImage'] as String,
      userId: json['userId'] as String,
      followingCount: json['followingCount'] as int? ?? 0,
      followerCount: json['followerCount'] as int? ?? 0,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$_HouseTournamentToJson(_$_HouseTournament instance) =>
    <String, dynamic>{
      'houseTournamentId': instance.houseTournamentId,
      'title': instance.title,
      'uid': instance.uid,
      'headerImage': instance.headerImage,
      'place': instance.place,
      'prefecture': const PrefNullableConverter().toJson(instance.prefecture),
      'city': const CityNullableConverter().toJson(instance.city),
      'features': instance.features,
      'capacity': instance.capacity,
      'numberOfParticipants': instance.numberOfParticipants,
      'dartsModels': instance.dartsModels
          .map(const DartsModelTagTypeConverter().toJson)
          .toList(),
      'formats': instance.formats,
      'dateTime': const TimestampConverter().toJson(instance.dateTime),
      'startTime': const TimestampConverter().toJson(instance.startTime),
      'finishTime': const TimestampConverter().toJson(instance.finishTime),
      'detail': instance.detail,
      'isApproved': instance.isApproved,
      'isFinalTournament': instance.isFinalTournament,
      'ownerReference':
          const DocumentReferenceConverter().toJson(instance.ownerReference),
      'creatorName': instance.creatorName,
      'creatorImage': instance.creatorImage,
      'userId': instance.userId,
      'followingCount': instance.followingCount,
      'followerCount': instance.followerCount,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
