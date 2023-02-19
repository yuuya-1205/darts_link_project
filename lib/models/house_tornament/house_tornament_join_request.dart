import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'house_tornament_join_request.freezed.dart';
part 'house_tornament_join_request.g.dart';

enum HouseTornamentJoinRequestStatus {
  requesting,
  approved,
}

extension JoinRequestStatusExtension on HouseTornamentJoinRequestStatus {
  String get asString {
    switch (this) {
      case HouseTornamentJoinRequestStatus.approved:
        return 'approved';
      case HouseTornamentJoinRequestStatus.requesting:
        return 'requesting';
    }
  }
}

extension StringExtension on String {
  HouseTornamentJoinRequestStatus get getJoinRequestStatus {
    switch (this) {
      case 'approved':
        return HouseTornamentJoinRequestStatus.approved;

      case 'requesting':
        return HouseTornamentJoinRequestStatus.requesting;

      default:
        return HouseTornamentJoinRequestStatus.requesting;
    }
  }
}

@freezed
class HouseTornamentJoinRequest with _$HouseTornamentJoinRequest {
  const factory HouseTornamentJoinRequest(
      {required String userName,
      required String uid,
      required String userId,
      required String userImage,
      @TimestampConverter()
          Timestamp? approvedAt,
      @TimestampConverter()
          required Timestamp requestedAt,
      @Default(HouseTornamentJoinRequestStatus.requesting)
          HouseTornamentJoinRequestStatus status}) = _HouseTornamentJoinRequest;

  factory HouseTornamentJoinRequest.fromJson(Map<String, dynamic> json) =>
      _$HouseTornamentJoinRequestFromJson(json);

  static HouseTornamentJoinRequest fromAppUser(AppUser appUser) {
    return HouseTornamentJoinRequest(
      uid: appUser.id,
      userId: appUser.userId,
      userImage: appUser.userImage,
      userName: appUser.userName,
      requestedAt: Timestamp.now(),
    );
  }
}
