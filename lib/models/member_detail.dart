import 'package:darts_link_project/models/app_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_detail.freezed.dart';
part 'member_detail.g.dart';

@freezed
class MemberDetail with _$MemberDetail {
  const factory MemberDetail({
    required String userName,
    required String userImage,
  }) = _MemberDetail;

  factory MemberDetail.fromJson(Map<String, dynamic> json) =>
      _$MemberDetailFromJson(json);

  static MemberDetail fromAppUser(AppUser appUser) {
    return MemberDetail(
        userImage: appUser.userImage, userName: appUser.userName);
  }
}
