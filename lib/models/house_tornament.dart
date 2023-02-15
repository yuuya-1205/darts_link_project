import 'package:algolia/algolia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'house_tornament.freezed.dart';
part 'house_tornament.g.dart';

@freezed
class HouseTornament with _$HouseTornament {
  const factory HouseTornament({
    required String id,
    required String title,
    @Default('') String place,
    @Freezed(fromJson: true) @Default([]) List<String> fetures,
    @Freezed(fromJson: true) @Default([]) List<String> dartsModels,
    @TimestampConverter() required Timestamp dateTime,
    @TimestampConverter() required Timestamp startTime,
    @TimestampConverter() required Timestamp finishTime,
    @Default('') String detail,
    @Default(false) bool isApproved,
    required String ownerId,
    required String createrName,
    required String createrImage,
    required String userId,
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() required Timestamp updatedAt,
    @Default(0) int followingCount,
    @Default(0) int followerCount,
    @Default(0) int capacity,
  }) = _HouseTornament;

  factory HouseTornament.fromJson(Map<String, dynamic> json) =>
      _$HouseTornamentFromJson(json);

  static HouseTornament fromAlgolia(AlgoliaObjectSnapshot snap) {
    return HouseTornament(
      createdAt: snap.data['createdAt'],
      createrImage: snap.data['createrImage'],
      createrName: snap.data['createrName'],
      dateTime: snap.data['dateTime'],
      finishTime: snap.data['finishTime'],
      id: snap.data['id'],
      ownerId: snap.data['ownerId'],
      startTime: snap.data['startTime'],
      title: snap.data['title'],
      updatedAt: snap.data['updatedAt'],
      userId: snap.data['userId'],
    );
  }
}
