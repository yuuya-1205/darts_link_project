import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/follow.dart';
import 'package:darts_link_project/repositories/person_repository.dart';

class FollowRepository {
  static final fireStore = FirebaseFirestore.instance;
  static CollectionReference getFollowCollection(String uid) =>
      PersonRepository.personCollection.doc(uid).collection('follows');

  static Future<void> setFollowing({
    required String uid,
    required Follow follow,
  }) async {
    await getFollowCollection(uid)
        .doc(follow.followingRef.id)
        .set(follow.toJson(), SetOptions(merge: true));
  }

  static Future<void> unFollowing({
    required String uid,
    required String followingUid,
  }) async {
    await getFollowCollection(uid).doc(followingUid).delete();
  }

  static Stream<QuerySnapshot> followingStream({
    required String uid,
    required DocumentReference reference,
  }) {
    return getFollowCollection(uid)
        .where('followingRef', isEqualTo: reference)
        .snapshots();
  }

  static Stream<Follow> streamFollow({
    required String uid,
    required String followingUid,
  }) {
    return getFollowCollection(uid)
        .doc(followingUid)
        .snapshots()
        .map((snap) => Follow.fromJson(snap.data() as Map<String, dynamic>));
  }

  static Future<List<Follow>> fetchFollows(String uid) async {
    final snap = await getFollowCollection(uid).get();
    List<Follow> list = snap.docs
        .map((e) {
          final data = e.data() as Map<String, dynamic>?;
          if (data == null) {
            return null;
          }
          return Follow.fromJson(data);
        })
        .whereType<Follow>()
        .toList();
    return list;
  }

  static Stream<List<Follow>> followListStream({
    required String uid,
  }) {
    return getFollowCollection(uid).snapshots().map((snap) => snap.docs
        .map((doc) => Follow.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }
}
