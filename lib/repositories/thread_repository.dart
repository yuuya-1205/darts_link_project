import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/thread.dart';

class ThreadRepository {
  static final fireStore = FirebaseFirestore.instance;
  static final threadsCollection = fireStore.collection('threads');

  static Future<List<Thread>> fetchThreads() async {
    final snap = await threadsCollection.get();
    List<Thread> list = snap.docs.map((e) {
      return Thread.fromJson(e.data());
    }).toList();
    return list;
  }

  static Stream<List<Thread>> threadStream({required String uid}) {
    return threadsCollection
        .where('uids', arrayContains: uid)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map((snap) =>
            snap.docs.map((doc) => Thread.fromJson(doc.data())).toList());
  }

  static Future<Thread?> fetchThreadByMemberIds(String threadId) async {
    final doc = await threadsCollection.doc(threadId).get();
    if (!doc.exists) {
      return null;
    }
    return Thread.fromJson(doc.data() as Map<String, dynamic>);
  }

  static Future<void> createThread(Thread thread) async {
    await threadsCollection.doc(thread.id).set(thread.toJson());
  }

  static Future<void> updateThread(Thread thread) async {
    await threadsCollection.doc(thread.id).update(thread.toJson());
  }

  static Future<void> updateBadge({
    required String uid,
    int count = 0,
    required String threadId,
  }) async {
    await threadsCollection.doc(threadId).update({'unReadCount.$uid': count});
  }
}
