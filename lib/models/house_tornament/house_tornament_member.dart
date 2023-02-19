import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'house_tornament_member.freezed.dart';
part 'house_tornament_member.g.dart';

enum HouseTornamentMemberType {
  owner,
  joined,
  requesting,
  joinable,
  beforeRequesting,
}

@freezed
class HouseTornamentMember with _$HouseTornamentMember {
  const factory HouseTornamentMember({
    required String uid,
    required String userName,
    required String userId,
    required String userImage,
    @TimestampConverter() required Timestamp joinedAt,
  }) = _HouseTornamentMember;

  factory HouseTornamentMember.fromJson(Map<String, dynamic> json) =>
      _$HouseTornamentMemberFromJson(json);

  static HouseTornamentMember fromAppUser(AppUser appUser) {
    return HouseTornamentMember(
      uid: appUser.id,
      userId: appUser.userId,
      userImage: appUser.userImage,
      userName: appUser.userName,
      joinedAt: Timestamp.now(),
    );
  }
}
