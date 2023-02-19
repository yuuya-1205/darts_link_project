import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'circle.freezed.dart';
part 'circle.g.dart';

@freezed
class Circle with _$Circle {
  const factory Circle({
    required String circleId,
    required String circleName,
    required String circleDetail,
    @Default('') String place,
    @Default('') String headerImage,
    @Freezed(fromJson: true) @Default([]) List<String> imageUrls,
    @Freezed(fromJson: true) @Default([]) List<String> memberUids,
    @Freezed(fromJson: true) @Default([]) List<String> features,
    @Default('未登録') String prefecture,
    @Default('未登録') String city,
    @Default(0) int capacity,
    @Default(0) int numberOfParticipants,
    @Default(false) bool isApproved,
    required String ownerId,
    required String createrName,
    required String createrImage,
    required String userId,
    @Default(0) int followingCount,
    @Default(0) int followerCount,
    @TimestampConverter() required Timestamp updatedAt,
    @TimestampConverter() required Timestamp createdAt,
  }) = _Circle;

  factory Circle.fromJson(Map<String, dynamic> json) => _$CircleFromJson(json);
}
