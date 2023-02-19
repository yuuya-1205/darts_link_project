import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'circle_join_request.freezed.dart';
part 'circle_join_request.g.dart';

enum CircleJoinRequestStatus {
  requesting,
  approved,
}

extension JoinRequestStatusExtension on CircleJoinRequestStatus {
  String get asString {
    switch (this) {
      case CircleJoinRequestStatus.approved:
        return 'approved';
      case CircleJoinRequestStatus.requesting:
        return 'requesting';
    }
  }
}

extension StringExtension on String {
  CircleJoinRequestStatus get getJoinRequestStatus {
    switch (this) {
      case 'approved':
        return CircleJoinRequestStatus.approved;

      case 'requesting':
        return CircleJoinRequestStatus.requesting;

      default:
        return CircleJoinRequestStatus.requesting;
    }
  }
}

@freezed
class CircleJoinRequest with _$CircleJoinRequest {
  const factory CircleJoinRequest(
      {required String userName,
      required String uid,
      required String userId,
      required String userImage,
      @TimestampConverter()
          Timestamp? approvedAt,
      @TimestampConverter()
          required Timestamp requestedAt,
      @Default(CircleJoinRequestStatus.requesting)
          CircleJoinRequestStatus status}) = _CircleJoinRequest;

  factory CircleJoinRequest.fromJson(Map<String, dynamic> json) =>
      _$CircleJoinRequestFromJson(json);

  static CircleJoinRequest fromAppUser(AppUser appUser) {
    return CircleJoinRequest(
      uid: appUser.id,
      userId: appUser.userId,
      userImage: appUser.userImage,
      userName: appUser.userName,
      requestedAt: Timestamp.now(),
    );
  }
}
