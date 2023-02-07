import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/circle_member.dart';
import 'package:darts_link_project/repositories/circle/circle_repository.dart';

class CircleMemberRepository {
  static final fireStore = FirebaseFirestore.instance;
  static CollectionReference getCircleMemberColloection(String circleId) =>
      CircleRepository.circlesCollection
          .doc(circleId)
          .collection('circleMembers');

  static Future<List<CircleMember>> fetchCircleMembers(
      {required String circleId}) async {
    final snap = await getCircleMemberColloection(circleId).get();
    List<CircleMember> list = snap.docs
        .map((e) {
          return CircleMember.fromJson(e.data() as Map<String, dynamic>);
        })
        .whereType<CircleMember>()
        .toList();
    return list;
  }

  static Stream<List<CircleMember>> circleMemberListStream({
    required String circleId,
  }) {
    return getCircleMemberColloection(circleId).snapshots().map((snap) => snap
        .docs
        .map((doc) => CircleMember.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }

  static Future<void> createCircleMember({
    required String circleId,
    required CircleMember circleMember,
  }) async {
    await getCircleMemberColloection(circleId)
        .doc(circleMember.uid)
        .set(circleMember.toJson(), SetOptions(merge: true));
  }

  static Future<void> leaveCircleMember({
    required String circleId,
    required String circleMemberId,
  }) async {
    await getCircleMemberColloection(circleId).doc(circleMemberId).delete();
  }

  static Future<int> fetchMemberDocsCount(String circleId) async {
    final query = await getCircleMemberColloection(circleId).count().get();
    return query.count;
  }
}
