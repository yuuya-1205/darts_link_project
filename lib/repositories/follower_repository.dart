import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/follower.dart';
import 'package:darts_link_project/repositories/person_repository.dart';

class FollowRepository {
  static final fireStore = FirebaseFirestore.instance;
  static CollectionReference getFollowCollection(String uid) =>
      PersonRepository.personCollection.doc(uid).collection('follows');

  static Future<void> setFollower({
    required String uid,
    required Follower follower,
  }) async {
    await getFollowCollection(uid)
        .doc(follower.followerUid)
        .set(follower.toJson(), SetOptions(merge: true));
  }

  static Future<void> unFollowing({
    required String uid,
    required String followerUid,
  }) async {
    await getFollowCollection(uid).doc(followerUid).delete();
  }

  static Stream<QuerySnapshot> followingStream({
    required String uid,
    required String followerUid,
  }) {
    return getFollowCollection(uid)
        .where('followingUid', isEqualTo: followerUid)
        .snapshots();
  }
}
