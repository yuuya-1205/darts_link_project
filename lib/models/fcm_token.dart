import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/document_reference_converter.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fcm_token.freezed.dart';
part 'fcm_token.g.dart';

@freezed
class FcmToken with _$FcmToken {
  factory FcmToken({
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() required Timestamp updatedAt,
    @DocumentReferenceConverter() required DocumentReference userReference,
    required List<String> fcmTokens,
  }) = _FcmToken;

  factory FcmToken.fromJson(Map<String, dynamic> json) =>
      _$FcmTokenFromJson(json);

  static FcmToken? fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    if (!snapshot.exists) {
      return null;
    }
    return FcmToken.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toUpdateJson(String token) {
    return {
      'updatedAt': FieldValue.serverTimestamp(),
      'fcmTokens': FieldValue.arrayUnion(<String>[token]),
    };
  }
}
