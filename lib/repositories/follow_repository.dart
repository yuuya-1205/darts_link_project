import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/follow.dart';
import 'package:darts_link_project/repositories/person_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class FollowRepository {
  static final fireStore = FirebaseFirestore.instance;
  static CollectionReference getFollowCollection(String uid) =>
      PersonRepository.personCollection.doc(uid).collection('follows');

  static Future<void> setFollowing({
    required String uid,
    required Follow follow,
  }) async {
    await getFollowCollection(uid)
        .doc(follow.followingUid)
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
    required String followingUid,
  }) {
    return getFollowCollection(uid)
        .where('followingUid', isEqualTo: followingUid)
        .snapshots();
  }

  static Stream<List<Follow>> streamFollow({
    required String uid,
  }) {
    return getFollowCollection(uid).snapshots().map((snap) => snap.docs
        .map((doc) => Follow.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
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

  static Future<List<String>> fetchFollowingUids(String uid) async {
    final follows = await fetchFollows(uid);
    final followingUids = follows.map((e) => e.followingUid).toList();
    return followingUids;
  }

  static Stream<List<Follow>> followListStream({
    required String uid,
  }) {
    return getFollowCollection(uid).where('followingUid').snapshots().map(
        (snap) => snap.docs
            .map((doc) => Follow.fromJson(doc.data() as Map<String, dynamic>))
            .toList());
  }
}