import 'package:algolia/algolia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/city_converter.dart';
import 'package:darts_link_project/converters/pref_converter.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:darts_link_project/models/city.dart';
import 'package:darts_link_project/models/pref.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'battle_room.freezed.dart';
part 'battle_room.g.dart';

@freezed
class BattleRoom with _$BattleRoom {
  const factory BattleRoom({
    required String id,
    required String title,
    @Default('') String place,
    @PrefNullableConverter() Pref? prefecture,
    @CityNullableConverter() City? city,
    @TimestampConverter() required Timestamp dateTime,
    @TimestampConverter() required Timestamp startTime,
    @TimestampConverter() required Timestamp finishTime,
    @Freezed(fromJson: true) @Default([]) List<String> fetures,
    @Freezed(fromJson: true) @Default([]) List<String> dartsModels,
    @Default('') String detail,
    @Default(1) int numberOfParticipants,
    @Default(false) bool isApproved,
    required String ownerId,
    required String createrName,
    required String createrImage,
    required String userId,
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() required Timestamp updatedAt,
    @Default(0) int followingCount,
    @Default(0) int followerCount,
    @Default(1) int capacity,
  }) = _BattleRoom;

  factory BattleRoom.fromJson(Map<String, dynamic> json) =>
      _$BattleRoomFromJson(json);

  static BattleRoom fromAlgolia(AlgoliaObjectSnapshot snap) {
    return BattleRoom(
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
