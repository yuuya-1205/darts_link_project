import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'follow.freezed.dart';
part 'follow.g.dart';

@freezed
class Follow with _$Follow {
  const factory Follow({
    required String followingUid,
    required String userName,
    required String userId,
    required String userImage,
    @TimestampConverter() required Timestamp createdAt,
  }) = _Follow;

  factory Follow.fromJson(Map<String, dynamic> json) => _$FollowFromJson(json);
}
