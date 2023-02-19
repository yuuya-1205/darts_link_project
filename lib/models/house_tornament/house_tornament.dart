import 'package:algolia/algolia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/city_converter.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:darts_link_project/models/city.dart';
import 'package:darts_link_project/models/pref.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converters/pref_converter.dart';
part 'house_tornament.freezed.dart';
part 'house_tornament.g.dart';

@freezed
class HouseTornament with _$HouseTornament {
  const factory HouseTornament({
    required String houseTornamentId,
    required String title,
    required String uid,
    @Default('') String headerImage,
    @Default('') String place,
    @PrefNullableConverter() Pref? prefecture,
    @CityNullableConverter() City? city,
    @Freezed(fromJson: true) @Default([]) List<String> features,
    @Default(0) int capacity,
    @Default(0) int numberOfParticipants,
    @Freezed(fromJson: true) @Default([]) List<String> dartsModels,
    @Freezed(fromJson: true) @Default([]) List<String> formats,
    @TimestampConverter() required Timestamp dateTime,
    @TimestampConverter() required Timestamp startTime,
    @TimestampConverter() required Timestamp finishTime,
    @Default('') String detail,
    @Default(false) bool isApproved,
    @Default(false) bool isFinalTornament,
    required String ownerId,
    required String createrName,
    required String createrImage,
    required String userId,
    @Default(0) int followingCount,
    @Default(0) int followerCount,
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() required Timestamp updatedAt,
  }) = _HouseTornament;

  factory HouseTornament.fromJson(Map<String, dynamic> json) =>
      _$HouseTornamentFromJson(json);

  static HouseTornament fromAlgolia(AlgoliaObjectSnapshot snap) {
    return HouseTornament(
      uid: snap.data['uid'],
      createdAt: snap.data['createdAt'],
      createrImage: snap.data['createrImage'],
      createrName: snap.data['createrName'],
      dateTime: snap.data['dateTime'],
      finishTime: snap.data['finishTime'],
      houseTornamentId: snap.data['houseTornamentId'],
      ownerId: snap.data['ownerId'],
      startTime: snap.data['startTime'],
      title: snap.data['title'],
      updatedAt: snap.data['updatedAt'],
      userId: snap.data['userId'],
    );
  }
}
