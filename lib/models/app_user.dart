import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/city_converter.dart';
import 'package:darts_link_project/converters/pref_converter.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:darts_link_project/models/city.dart';
import 'package:darts_link_project/models/pref.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

///これは絶対入れてほしいものを書く。入っていなければ教えてくれている
abstract class AAppUser {
  String get id;
  String get userName;
  String get userId;
  String get userImage;
  Pref? get prefecture;
  City? get city;
  String get selfIntroduction;
  int get followerCount;
  int get followingCount;
  List<String> get tag;
  Timestamp get createdAt;
  Timestamp get updatedAt;
  List<String> get favorites;
}

@freezed
class AppUser with _$AppUser implements AAppUser {
  const factory AppUser.person({
    required String id,
    required String userName,
    required String userId,
    @Default('') String headerImage,
    @Default('') String userImage,
    @PrefNullableConverter() Pref? prefecture,
    @CityNullableConverter() City? city,
    @Default('') String selfIntroduction,
    @Default(0) int followerCount,
    @Default(0) int followingCount,
    @Freezed(fromJson: true) @Default([]) List<String> tag,
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() required Timestamp updatedAt,
    @Freezed(fromJson: true) @Default([]) List<String> favorites,

    // ここから共通化してないものを入力をする
    @Default('未設定') String gender,
    @Default(1) int dartsLiveRating,
    @Default(1) int phoenixRating,
  }) = Person;
  const factory AppUser.storeOwner({
    required String id,
    required String userName,
    required String userId,
    @Freezed(fromJson: true) @Default([]) List<String> headerImages,
    @Default('') String userImage,
    @PrefNonNullableConverter() required Pref prefecture,
    @CityNonNullableConverter() required City city,
    required String selfIntroduction,
    @Default(0) int followerCount,
    @Default(0) int followingCount,
    @Freezed(fromJson: true) @Default([]) List<String> tag,
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() required Timestamp updatedAt,
    @Freezed(fromJson: true) @Default([]) List<String> favorites,

    // ここから共通化してないものを書く
    required String address,
    required int telephoneNumber,
    @Default(false) bool isApproved,
  }) = StoreOwner;
  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
