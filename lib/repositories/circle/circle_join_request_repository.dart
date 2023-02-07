import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/repositories/circle/circle_repository.dart';

import '../../models/circle_join_request.dart';

class CircleJoinRequestRepository {
  static final fireStore = FirebaseFirestore.instance;
  static CollectionReference getCircleJoinRequestCollection(String circleId) =>
      CircleRepository.circlesCollection
          .doc(circleId)
          .collection('circleJoinRequests');

  static Future<List<CircleJoinRequest>> fetchCircleJoinRequests(
      String circleId) async {
    final snap = await getCircleJoinRequestCollection(circleId).get();
    List<CircleJoinRequest> list = snap.docs
        .map((e) {
          return CircleJoinRequest.fromJson(e.data() as Map<String, dynamic>);
        })
        .whereType<CircleJoinRequest>()
        .toList();
    return list;
  }

  static Stream<List<CircleJoinRequest>> circleJoinRequestListStream({
    required String circleId,
  }) {
    return getCircleJoinRequestCollection(circleId).snapshots().map((snap) =>
        snap.docs
            .map((doc) =>
                CircleJoinRequest.fromJson(doc.data() as Map<String, dynamic>))
            .toList());
  }

  static Future<CircleJoinRequest?> fetchCircleJoinRequest({
    required String circleId,
    required String uid,
  }) async {
    final snap = await getCircleJoinRequestCollection(circleId).doc(uid).get();
    if (snap.data() == null) {
      return null;
    }
    final circleJoinRequest =
        CircleJoinRequest.fromJson(snap.data() as Map<String, dynamic>);
    return circleJoinRequest;
  }

  static Future<void> createCircleJoinRequest({
    required String circleId,
    required CircleJoinRequest circleJoinRequest,
  }) async {
    await getCircleJoinRequestCollection(circleId)
        .doc(circleJoinRequest.uid)
        .set(circleJoinRequest.toJson(), SetOptions(merge: true));
  }

  static Future<void> deleteCircleJoinRequest({
    required String circleId,
    required String uid,
  }) async {
    await getCircleJoinRequestCollection(circleId).doc(uid).delete();
  }
}
