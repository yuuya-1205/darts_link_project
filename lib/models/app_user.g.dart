// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Person _$$PersonFromJson(Map<String, dynamic> json) => _$Person(
      id: json['id'] as String,
      userName: json['userName'] as String,
      userId: json['userId'] as String,
      headerImage: json['headerImage'] as String? ?? '',
      userImage: json['userImage'] as String? ?? '',
      prefecture: const PrefNullableConverter()
          .fromJson(json['prefecture'] as Map<String, dynamic>?),
      city: const CityNullableConverter()
          .fromJson(json['city'] as Map<String, dynamic>?),
      selfIntroduction: json['selfIntroduction'] as String? ?? '',
      followerCount: json['followerCount'] as int? ?? 0,
      followingCount: json['followingCount'] as int? ?? 0,
      tag: (json['tag'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
      favorites: (json['favorites'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isAdmin: json['isAdmin'] as bool? ?? false,
      gender: json['gender'] as String? ?? '未設定',
      dartsLiveRating: json['dartsLiveRating'] as int? ?? 1,
      phoenixRating: json['phoenixRating'] as int? ?? 1,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PersonToJson(_$Person instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'userId': instance.userId,
      'headerImage': instance.headerImage,
      'userImage': instance.userImage,
      'prefecture': const PrefNullableConverter().toJson(instance.prefecture),
      'city': const CityNullableConverter().toJson(instance.city),
      'selfIntroduction': instance.selfIntroduction,
      'followerCount': instance.followerCount,
      'followingCount': instance.followingCount,
      'tag': instance.tag,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'favorites': instance.favorites,
      'isAdmin': instance.isAdmin,
      'gender': instance.gender,
      'dartsLiveRating': instance.dartsLiveRating,
      'phoenixRating': instance.phoenixRating,
      'runtimeType': instance.$type,
    };

_$StoreOwner _$$StoreOwnerFromJson(Map<String, dynamic> json) => _$StoreOwner(
      id: json['id'] as String,
      userName: json['userName'] as String,
      userId: json['userId'] as String,
      headerImages: (json['headerImages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      userImage: json['userImage'] as String? ?? '',
      prefecture: const PrefNonNullableConverter()
          .fromJson(json['prefecture'] as Map<String, dynamic>),
      city: const CityNonNullableConverter()
          .fromJson(json['city'] as Map<String, dynamic>),
      selfIntroduction: json['selfIntroduction'] as String,
      followerCount: json['followerCount'] as int? ?? 0,
      followingCount: json['followingCount'] as int? ?? 0,
      tag: (json['tag'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
      favorites: (json['favorites'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isAdmin: json['isAdmin'] as bool? ?? false,
      address: json['address'] as String,
      telephoneNumber: json['telephoneNumber'] as int,
      isApproved: json['isApproved'] as bool? ?? false,
      dartsBoradCount: json['dartsBoradCount'] as String? ?? '',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$StoreOwnerToJson(_$StoreOwner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'userId': instance.userId,
      'headerImages': instance.headerImages,
      'userImage': instance.userImage,
      'prefecture':
          const PrefNonNullableConverter().toJson(instance.prefecture),
      'city': const CityNonNullableConverter().toJson(instance.city),
      'selfIntroduction': instance.selfIntroduction,
      'followerCount': instance.followerCount,
      'followingCount': instance.followingCount,
      'tag': instance.tag,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'favorites': instance.favorites,
      'isAdmin': instance.isAdmin,
      'address': instance.address,
      'telephoneNumber': instance.telephoneNumber,
      'isApproved': instance.isApproved,
      'dartsBoradCount': instance.dartsBoradCount,
      'runtimeType': instance.$type,
    };
