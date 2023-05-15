import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'thread.freezed.dart';
part 'thread.g.dart';

@freezed
class Thread with _$Thread {
  const factory Thread({
    required String id,
    required bool isReading,
    @Default('') String lastChat,
    @Freezed(fromJson: true) @Default([]) List<String> uids,
    @Freezed(toJson: true) @Default({}) Map<String, dynamic> memberDetails,
    @Freezed(toJson: true) @Default({}) Map<String, int> unReadCount,
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() required Timestamp updatedAt,
  }) = _Thread;
  const Thread._();

  String partnerUid(String myUid) {
    final list = uids.where((element) => element != myUid).toList();
    return list.first;
  }

  Map<String, dynamic> getMemberDetail(
    String uid, {
    bool isPartner = false,
  }) {
    if (isPartner == true) {
      final partnerUid = this.partnerUid(uid);
      return memberDetails[partnerUid];
    }
    return memberDetails[uid];
  }

  factory Thread.fromJson(Map<String, dynamic> json) => _$ThreadFromJson(json);
}
