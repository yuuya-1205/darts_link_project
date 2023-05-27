import 'package:algolia/algolia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/city_converter.dart';
import 'package:darts_link_project/converters/document_reference_converter.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:darts_link_project/models/city.dart';
import 'package:darts_link_project/models/pref.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converters/darts_model_converter.dart';
import '../../converters/pref_converter.dart';
import '../tag_type.dart';

part 'house_tournament.freezed.dart';
part 'house_tournament.g.dart';

@freezed
class HouseTournament with _$HouseTournament {
  const factory HouseTournament({
    required String houseTournamentId,
    required String title,
    required String uid,
    @Default('') String headerImage,
    @Default('') String place,
    @PrefNullableConverter() Pref? prefecture,
    @CityNullableConverter() City? city,
    @Freezed(fromJson: true) @Default([]) List<String> features,
    @Default(0) int capacity,
    @Default(0) int numberOfParticipants,
    @Freezed(fromJson: true)
    @DartsModelTagTypeConverter()
    @Default([])
        List<DartsModelTagType> dartsModels,
    @Freezed(fromJson: true) @Default([]) List<String> formats,
    @TimestampConverter() required Timestamp dateTime,
    @TimestampConverter() required Timestamp startTime,
    @TimestampConverter() required Timestamp finishTime,
    @Default('') String detail,
    @Default(false) bool isApproved,
    @Default(false) bool isFinalTournament,
    @DocumentReferenceConverter() required DocumentReference ownerReference,
    required String creatorName,
    required String creatorImage,
    required String userId,
    @Default(0) int followingCount,
    @Default(0) int followerCount,
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() required Timestamp updatedAt,
  }) = _HouseTournament;

  factory HouseTournament.fromJson(Map<String, dynamic> json) =>
      _$HouseTournamentFromJson(json);

  static HouseTournament fromAlgolia(AlgoliaObjectSnapshot snap) {
    return HouseTournament(
      uid: snap.data['uid'],
      createdAt: snap.data['createdAt'],
      creatorImage: snap.data['creatorImage'],
      creatorName: snap.data['creatorName'],
      dateTime: snap.data['dateTime'],
      finishTime: snap.data['finishTime'],
      houseTournamentId: snap.data['houseTournamentId'],
      ownerReference: snap.data['ownerReference'],
      startTime: snap.data['startTime'],
      title: snap.data['title'],
      updatedAt: snap.data['updatedAt'],
      userId: snap.data['userId'],
    );
  }
}
