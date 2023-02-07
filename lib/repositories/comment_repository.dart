import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/comment.dart';
import 'package:darts_link_project/repositories/post_repository.dart';
import 'package:flutter/material.dart';

class CommntRepository {
  static final firestore = FirebaseFirestore.instance;
  static CollectionReference getCommentCollection(String postId) =>
      PostRepository.postCollection.doc(postId).collection('comments');

  // static Future<void> setComment({
  //   required String postId,
  //   required Comment comment,
  // }) async {
  //   await getCommentCollection(postId)
  //       .doc(postId)
  //       .set(comment.toJson(), SetOptions(merge: true));
  // }

  static Future<String> addComment({
    required String postId,
    Comment? comment,
  }) async {
    final room = await getCommentCollection(postId).add(comment!.toJson());
    return room.id;
  }

  static Future<void> deleteComment({
    required commentId,
    required postId,
  }) async {
    CommntRepository.getCommentCollection(postId).doc(commentId).delete();
  }

  static Stream<List<Comment>> streamComment(String postId) {
    return getCommentCollection(postId).snapshots().map(
          (snap) => snap.docs
              .map(
                  (doc) => Comment.fromJson(doc.data() as Map<String, dynamic>))
              .toList(),
        );
  }
}
