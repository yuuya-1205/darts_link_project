import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/post_like.dart';
import 'package:darts_link_project/repositories/post/post_repository.dart';

class PostLikeRepository {
  static final fireStore = FirebaseFirestore.instance;
  static CollectionReference<PostLike?> getPostLikeCollection(String postId) =>
      PostRepository.postCollection
          .doc(postId)
          .collection('postLikes')
          .withConverter(
            fromFirestore: (snapshot, _) =>
                PostLike.fromJson(snapshot.data() ?? {})
                    .copyWith(reference: snapshot.reference),
            toFirestore: (value, _) {
              final data = value?.toJson();
              data?.remove('reference');
              return data ?? {};
            },
          );

  static Future<void> setLike({
    required String postId,
    required PostLike postLike,
  }) async {
    await getPostLikeCollection(postId)
        .doc(postLike.likerReference?.id)
        .set(postLike, SetOptions(merge: true));
  }

  static Future<void> deleteLike(
    String uid,
    String postId,
  ) async {
    PostLikeRepository.getPostLikeCollection(postId).doc(uid).delete();
  }

  static Stream<List<PostLike>> streamPostLike(String postId) {
    return getPostLikeCollection(postId).snapshots().map(
          (snap) => snap.docs
              .map((doc) =>
                  PostLike.fromJson(doc.data() as Map<String, dynamic>))
              .toList(),
        );
  }
}
