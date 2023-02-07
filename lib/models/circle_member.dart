import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'circle_member.freezed.dart';
part 'circle_member.g.dart';

enum CircleMemberType {
  owner,
  joined,
  requesting,
  joinable,
  beforeRequesting,
}

@freezed
class CircleMember with _$CircleMember {
  const factory CircleMember({
    required String uid,
    required String userName,
    required String userId,
    required String userImage,
    required int followerCount,
    required int followingCount,
    @TimestampConverter() required Timestamp joinedAt,
  }) = _CircleMember;

  factory CircleMember.fromJson(Map<String, dynamic> json) =>
      _$CircleMemberFromJson(json);

  static CircleMember fromAppUser(AppUser appUser) {
    return CircleMember(
      uid: appUser.id,
      userId: appUser.userId,
      userImage: appUser.userImage,
      userName: appUser.userName,
      joinedAt: Timestamp.now(),
      followerCount: appUser.followerCount,
      followingCount: appUser.followingCount,
    );
  }
}
