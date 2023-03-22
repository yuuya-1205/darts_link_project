import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/document_reference_converter.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class Chat with _$Chat {
  const factory Chat({
    required String text,
    required String uid,
    required String threadId,
    @Freezed(fromJson: true) @Default([]) List<String> imageUrls,
    @Freezed(toJson: true) @Default({}) Map<String, bool> isReading,
    @DocumentReferenceConverter() required DocumentReference reference,
    @TimestampConverter() required Timestamp createdAt,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}
