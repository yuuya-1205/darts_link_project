import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/document_reference_converter.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:darts_link_project/models/team.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'round_robin.freezed.dart';
part 'round_robin.g.dart';

@freezed
class RoundRobin with _$RoundRobin {
  const factory RoundRobin({
    @Default('未設定') String title,
    @Default('') String id,
    @DocumentReferenceConverter() required DocumentReference creatorRef,
    required String createrName,
    required String userId,
    @Default(1) int teamCounts,
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() required Timestamp updatedAt,
  }) = _RoundRobin;

  factory RoundRobin.fromJson(Map<String, dynamic> json) =>
      _$RoundRobinFromJson(json);
}
