// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_store_owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FavoriteStoreOwner _$$_FavoriteStoreOwnerFromJson(
        Map<String, dynamic> json) =>
    _$_FavoriteStoreOwner(
      id: json['id'] as String? ?? '',
      userName: json['userName'] as String,
      userId: json['userId'] as String,
      userImage: json['userImage'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$_FavoriteStoreOwnerToJson(
        _$_FavoriteStoreOwner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'userId': instance.userId,
      'userImage': instance.userImage,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
