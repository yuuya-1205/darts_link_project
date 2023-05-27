import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/document_reference_converter.dart';
import 'package:darts_link_project/converters/member_detail_converter.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'member_detail.dart';

part 'thread.freezed.dart';
part 'thread.g.dart';

@freezed
class Thread with _$Thread {
  const factory Thread({
    @Default({}) Map<String, List<String>> unreadCount,
    @Default('') String latestChat,
    @Freezed(fromJson: true) @Default([]) List<String> memberIds,
    @MemberDetailConverter() required Map<String, MemberDetail> memberDetails,
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() required Timestamp updatedAt,

    /// クライアントのみで扱うデータ
    @DocumentReferenceConverter() DocumentReference? reference,
  }) = _Thread;
  const Thread._();

  String partnerUid(String myUid) {
    final list = memberIds.where((element) => element != myUid).toList();
    return list.first;
  }

  MemberDetail getMemberDetail(
    String uid, {
    bool isPartner = true,
  }) {
    if (isPartner) {
      final partnerUid = this.partnerUid(uid);
      return memberDetails[partnerUid]!;
    }
    return memberDetails[uid]!;
  }

  factory Thread.fromJson(Map<String, dynamic> json) => _$ThreadFromJson(json);
}
