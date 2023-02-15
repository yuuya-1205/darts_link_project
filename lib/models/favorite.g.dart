// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Favorite _$$_FavoriteFromJson(Map<String, dynamic> json) => _$_Favorite(
      userName: json['userName'] as String,
      favoriteId: json['favoriteId'] as String,
      dartsBarId: json['dartsBarId'] as String,
      userId: json['userId'] as String,
      userImage: json['userImage'] as String,
      text: json['text'] as String? ?? '',
      joinedAt:
          const TimestampConverter().fromJson(json['joinedAt'] as Timestamp),
    );

Map<String, dynamic> _$$_FavoriteToJson(_$_Favorite instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'favoriteId': instance.favoriteId,
      'dartsBarId': instance.dartsBarId,
      'userId': instance.userId,
      'userImage': instance.userImage,
      'text': instance.text,
      'joinedAt': const TimestampConverter().toJson(instance.joinedAt),
    };
