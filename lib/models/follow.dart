import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/document_reference_converter.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow.freezed.dart';
part 'follow.g.dart';

@freezed
class Follow with _$Follow {
  const factory Follow({
    @DocumentReferenceConverter() required DocumentReference followingRef,
    required String userName,
    required String userId,
    required String userImage,
    @TimestampConverter() required Timestamp createdAt,
  }) = _Follow;

  factory Follow.fromJson(Map<String, dynamic> json) => _$FollowFromJson(json);
  factory Follow.fromAppUser(AppUser user) => Follow(
        userImage: user.userImage,
        userId: user.userId,
        userName: user.userName,
        followingRef: user.reference!,
        createdAt: Timestamp.now(),
      );
}
