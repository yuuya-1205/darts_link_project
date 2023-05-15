import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_store_owner.freezed.dart';
part 'favorite_store_owner.g.dart';

@freezed
class FavoriteStoreOwner with _$FavoriteStoreOwner {
  const factory FavoriteStoreOwner({
    @Default('') String id,
    required String userName,
    required String userId,
    required String userImage,
    @TimestampConverter() required Timestamp createdAt,
  }) = _FavoriteStoreOwner;

  factory FavoriteStoreOwner.fromJson(Map<String, dynamic> json) =>
      _$FavoriteStoreOwnerFromJson(json);
}
