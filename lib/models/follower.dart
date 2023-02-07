import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'follower.freezed.dart';
part 'follower.g.dart';

@freezed
class Follower with _$Follower {
  const factory Follower({
    required String followerUid,
    required String userName,
    required String userId,
    required String userImage,
    @TimestampConverter() required Timestamp createdAt,
  }) = _Follower;

  factory Follower.fromJson(Map<String, dynamic> json) =>
      _$FollowerFromJson(json);
}
