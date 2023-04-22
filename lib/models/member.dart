import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'member.freezed.dart';
part 'member.g.dart';

enum BattleRoomMemberType {
  owner,
  joined,
  requesting,
  joinable,
  beforeRequesting,
}

@freezed
class Member with _$Member {
  const factory Member({
    required String uid,
    required String userName,
    required String userId,
    required String userImage,
    required int followerCount,
    required int followingCount,
    @TimestampConverter() required Timestamp joinedAt,
  }) = _Member;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  static Member fromAppUser(AppUser appUser) {
    return Member(
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
