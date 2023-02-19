// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Circle _$$_CircleFromJson(Map<String, dynamic> json) => _$_Circle(
      circleId: json['circleId'] as String,
      circleName: json['circleName'] as String,
      circleDetail: json['circleDetail'] as String,
      place: json['place'] as String? ?? '',
      headerImage: json['headerImage'] as String? ?? '',
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      memberUids: (json['memberUids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      prefecture: json['prefecture'] as String? ?? '未登録',
      city: json['city'] as String? ?? '未登録',
      capacity: json['capacity'] as int? ?? 0,
      numberOfParticipants: json['numberOfParticipants'] as int? ?? 0,
      isApproved: json['isApproved'] as bool? ?? false,
      ownerId: json['ownerId'] as String,
      createrName: json['createrName'] as String,
      createrImage: json['createrImage'] as String,
      userId: json['userId'] as String,
      followingCount: json['followingCount'] as int? ?? 0,
      followerCount: json['followerCount'] as int? ?? 0,
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$_CircleToJson(_$_Circle instance) => <String, dynamic>{
      'circleId': instance.circleId,
      'circleName': instance.circleName,
      'circleDetail': instance.circleDetail,
      'place': instance.place,
      'headerImage': instance.headerImage,
      'imageUrls': instance.imageUrls,
      'memberUids': instance.memberUids,
      'features': instance.features,
      'prefecture': instance.prefecture,
      'city': instance.city,
      'capacity': instance.capacity,
      'numberOfParticipants': instance.numberOfParticipants,
      'isApproved': instance.isApproved,
      'ownerId': instance.ownerId,
      'createrName': instance.createrName,
      'createrImage': instance.createrImage,
      'userId': instance.userId,
      'followingCount': instance.followingCount,
      'followerCount': instance.followerCount,
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
