import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/house_tornament/house_tornament_join_request.dart';
import 'package:darts_link_project/repositories/house_tornament/house_tornament_repository.dart';
import '../../models/circle/circle_join_request.dart';

class HouseTornamentJoinRequestRepository {
  static final fireStore = FirebaseFirestore.instance;
  static CollectionReference getHouseTornamentJoinRequestCollection(
          String houseTornamentId) =>
      HouseTornamentRepository.houseTornamentsCollection
          .doc(houseTornamentId)
          .collection('houseTornamentJoinRequests');

  static Future<List<HouseTornamentJoinRequest>>
      fetchHouseTornamentJoinRequests(String houseTornamentId) async {
    final snap =
        await getHouseTornamentJoinRequestCollection(houseTornamentId).get();
    List<HouseTornamentJoinRequest> list = snap.docs
        .map((e) {
          return HouseTornamentJoinRequest.fromJson(
              e.data() as Map<String, dynamic>);
        })
        .whereType<HouseTornamentJoinRequest>()
        .toList();
    return list;
  }

  static Stream<List<HouseTornamentJoinRequest>>
      houseTornamentJoinRequestListStream({
    required String houseTornamentId,
  }) {
    return getHouseTornamentJoinRequestCollection(houseTornamentId)
        .snapshots()
        .map((snap) => snap.docs
            .map((doc) => HouseTornamentJoinRequest.fromJson(
                doc.data() as Map<String, dynamic>))
            .toList());
  }

  static Future<HouseTornamentJoinRequest?> fetchHouseTornamentJoinRequest({
    required String houseTornamentId,
    required String uid,
  }) async {
    final snap = await getHouseTornamentJoinRequestCollection(houseTornamentId)
        .doc(uid)
        .get();
    if (snap.data() == null) {
      return null;
    }
    final houseTornamentJoinRequest =
        HouseTornamentJoinRequest.fromJson(snap.data() as Map<String, dynamic>);
    return houseTornamentJoinRequest;
  }

  static Future<void> createHouseTornamentJoinRequest({
    required String houseTornamentId,
    required HouseTornamentJoinRequest houseTornamentJoinRequest,
  }) async {
    await getHouseTornamentJoinRequestCollection(houseTornamentId)
        .doc(houseTornamentJoinRequest.uid)
        .set(houseTornamentJoinRequest.toJson(), SetOptions(merge: true));
  }

  static Future<void> deleteHouseTornamentJoinRequest({
    required String houseTornamentId,
    required String uid,
  }) async {
    await getHouseTornamentJoinRequestCollection(houseTornamentId)
        .doc(uid)
        .delete();
  }
}
