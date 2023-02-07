import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'join_request.freezed.dart';
part 'join_request.g.dart';

enum JoinRequestStatus {
  requesting,
  approved,
}

extension JoinRequestStatusExtension on JoinRequestStatus {
  String get asString {
    switch (this) {
      case JoinRequestStatus.approved:
        return 'approved';
      case JoinRequestStatus.requesting:
        return 'requesting';
    }
  }
}

extension StringExtension on String {
  JoinRequestStatus get getJoinRequestStatus {
    switch (this) {
      case 'approved':
        return JoinRequestStatus.approved;

      case 'requesting':
        return JoinRequestStatus.requesting;

      default:
        return JoinRequestStatus.requesting;
    }
  }
}

@freezed
class JoinRequest with _$JoinRequest {
  const factory JoinRequest(
          {required String userName,
          required String uid,
          required String userId,
          required String userImage,
          @TimestampConverter() Timestamp? approvedAt,
          @TimestampConverter() required Timestamp requestedAt,
          @Default(JoinRequestStatus.requesting) JoinRequestStatus status}) =
      _JoinRequest;

  factory JoinRequest.fromJson(Map<String, dynamic> json) =>
      _$JoinRequestFromJson(json);

  static JoinRequest fromAppUser(AppUser appUser) {
    return JoinRequest(
      uid: appUser.id,
      userId: appUser.userId,
      userImage: appUser.userImage,
      userName: appUser.userName,
      requestedAt: Timestamp.now(),
    );
  }
}
