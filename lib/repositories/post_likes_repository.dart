import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/post_like.dart';
import 'package:darts_link_project/repositories/post_repository.dart';

class PostLikesRepository {
  static final fireStore = FirebaseFirestore.instance;
  static CollectionReference getPostLikesCollection(String postId) =>
      PostRepository.postCollection.doc(postId).collection('postLikes');

  static Future<void> setLikes({
    required String postId,
    required PostLike postLike,
  }) async {
    await getPostLikesCollection(postId)
        .doc(postLike.uid)
        .set(postLike.toJson(), SetOptions(merge: true));
  }

  static Future<void> deleteLikes(
    String uid,
    String postId,
  ) async {
    PostLikesRepository.getPostLikesCollection(postId).doc(uid).delete();
  }

  static Stream<List<PostLike>> streamPostLike(String postId) {
    return getPostLikesCollection(postId).snapshots().map(
          (snap) => snap.docs
              .map((doc) =>
                  PostLike.fromJson(doc.data() as Map<String, dynamic>))
              .toList(),
        );
  }
}
