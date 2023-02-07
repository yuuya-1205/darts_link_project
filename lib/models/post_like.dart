import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'post_like.freezed.dart';
part 'post_like.g.dart';

@freezed
class PostLike with _$PostLike {
  const factory PostLike({
    required String userName,
    required String uid,
    required String userId,
    required String userImage,
    @TimestampConverter() required Timestamp createdAt,
  }) = _PostLike;

  factory PostLike.fromJson(Map<String, dynamic> json) =>
      _$PostLikeFromJson(json);
}
