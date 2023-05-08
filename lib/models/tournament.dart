import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/document_reference_converter.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tournament.freezed.dart';
part 'tournament.g.dart';

@freezed
class Tournament with _$Tournament {
  const factory Tournament({
    @Default('未設定') String title,
    @DocumentReferenceConverter() required DocumentReference creatorRef,
    required String creatorName,
    @Default(2) int teamCounts,
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() required Timestamp updatedAt,

    ///クライアントで使用するデータ
    @DocumentReferenceConverter() DocumentReference? reference,
  }) = _Tournament;

  factory Tournament.fromJson(Map<String, dynamic> json) =>
      _$TournamentFromJson(json);
}
