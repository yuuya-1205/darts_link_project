import 'package:darts_link_project/models/member_detail.dart';
import 'package:json_annotation/json_annotation.dart';

class MemberDetailConverter
    implements JsonConverter<Map<String, MemberDetail>, Map<String, dynamic>> {
  const MemberDetailConverter();

  @override
  Map<String, MemberDetail> fromJson(Map<String, dynamic> json) {
    return json
        .map((key, value) => MapEntry(key, MemberDetail.fromJson(value)));
  }

  @override
  Map<String, dynamic> toJson(Map<String, MemberDetail> memberDetail) {
    return memberDetail.map((key, value) => MapEntry(key, value.toJson()));
  }
}
