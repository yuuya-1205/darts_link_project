import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class Team with _$Team {
  const factory Team({
    required String id,
    required String teamName,
    @Freezed(toJson: true) @Default({}) Map<String, bool> isWin,
    @Freezed(toJson: true) @Default({}) Map<String, int> winRegs,
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() required Timestamp updatedAt,
  }) = _Team;

  const Team._();

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  int get totalWinCount {
    print(isWin.values);
    return isWin.values.where((element) => element == true).length;
  }

  int get totalLoseCount =>
      isWin.values.where((element) => element == false).length;
}
