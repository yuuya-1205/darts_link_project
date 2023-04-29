import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/models/post.dart';

class PostRepository {
  static final fireStore = FirebaseFirestore.instance;
  static final postCollection = fireStore.collection('posts');
  static DocumentReference getDocumentRef(String postId) =>
      postCollection.doc(postId);

  static Future<String> addPost(Post post) async {
    final room = await postCollection.add(post.toJson());
    return room.id;
  }

  static Stream<List<Post>> streamPost() {
    return postCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snap) => snap.docs
            .map((doc) => Post.fromJson(doc.data()).copyWith(id: doc.id))
            .toList());
  }

  static Stream<List<Post>> streamFollowPost(List<String> followingUid) {
    return postCollection
        .orderBy('createdAt', descending: true)
        .where('createrId', whereIn: followingUid)
        .snapshots()
        .map((snap) => snap.docs
            .map((doc) => Post.fromJson(doc.data()).copyWith(id: doc.id))
            .toList());
  }

  static Stream<List<Post>> myPostStream(String myUid) {
    return postCollection
        .orderBy('createdAt', descending: true)
        .where('createrId', isEqualTo: myUid)
        .snapshots()
        .map((snap) => snap.docs
            .map((doc) => Post.fromJson(doc.data()).copyWith(id: doc.id))
            .toList());
  }

  static Stream<List<Post>> myPostImageStream(String myUid) {
    return postCollection
        .orderBy('createdAt', descending: true)
        .where('createrId', isEqualTo: myUid)
        .snapshots()
        .map((snap) => snap.docs
            .map((doc) => Post.fromJson(doc.data()).copyWith(id: doc.id))
            .toList());
  }

  static Stream<List<Post>> userPostStream(String uid) {
    return postCollection
        .orderBy('createdAt', descending: true)
        .where('createrId', isEqualTo: uid)
        .snapshots()
        .map((snap) => snap.docs
            .map((doc) => Post.fromJson(doc.data()).copyWith(id: doc.id))
            .toList());
  }

  static Stream<List<Post>> circlePostStream(DocumentReference circleRef) {
    return postCollection
        .orderBy('createdAt', descending: true)
        .where('posterRef', isEqualTo: circleRef)
        .snapshots()
        .map((snap) => snap.docs
            .map((doc) => Post.fromJson(doc.data()).copyWith(id: doc.id))
            .toList());
  }

  static Stream<List<Post>> circlePostImageStream(DocumentReference circleRef) {
    return postCollection
        .where('postImage', isNotEqualTo: [])
        .orderBy('postImage')
        .where('posterRef', isEqualTo: circleRef)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snap) => snap.docs
            .map((doc) => Post.fromJson(doc.data()).copyWith(id: doc.id))
            .toList());
  }

  static Stream<List<Post>> storeOwnerPostImageStream(
      DocumentReference posterRef) {
    return postCollection
        .where('postImage', isNotEqualTo: [])
        .orderBy('postImage')
        .where('posterRef', isEqualTo: posterRef)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snap) => snap.docs
            .map((doc) => Post.fromJson(doc.data()).copyWith(id: doc.id))
            .toList());
  }

  // static Stream<List<Post>> streamLikePost(Post post) {
  //   return postCollection.doc(post.id).snapshots().map(
  //       (snap) => snap.post.map((post) => Post.fromJson(post.data())).toList());
  // }

  static Future<void> deletePost(Post post) async {
    await postCollection.doc(post.id).delete();
  }

  static Future<void> likedRemove(
    Post post,
    String uid,
  ) async {
    postCollection.doc(post.id).set({
      'liked': FieldValue.arrayRemove([uid]),
    }, SetOptions(merge: true));
  }

  static Future<void> likedUnion(
    Post post,
    String uid,
  ) async {
    postCollection.doc(post.id).set({
      'liked': FieldValue.arrayUnion([uid]),
    }, SetOptions(merge: true));
  }

  static Future<void> updateProfile({
    required AppUser appUser,
  }) async {
    final snapshot =
        await postCollection.where('createrId', isEqualTo: appUser.id).get();
    await Future.forEach(snapshot.docs, (QueryDocumentSnapshot element) async {
      await element.reference.set({
        'userName': appUser.userName,
        'userImage': appUser.userImage,
        'userId': appUser.userId,
      }, SetOptions(merge: true));
    });
  }
}
