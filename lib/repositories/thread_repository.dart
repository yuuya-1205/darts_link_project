import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/thread.dart';

class ThreadRepository {
  static final fireStore = FirebaseFirestore.instance;
  static final CollectionReference<Thread?> threadsCollection =
      fireStore.collection('threads').withConverter(
            fromFirestore: (snapshot, _) =>
                Thread.fromJson(snapshot.data() ?? {})
                    .copyWith(reference: snapshot.reference),
            toFirestore: (value, _) {
              final data = value?.toJson();
              data?.remove('reference');
              return data ?? {};
            },
          );

  static Future<List<Thread>> fetchThreads() async {
    final snap = await threadsCollection.get();
    return snap.docs.map((e) => e.data()).whereType<Thread>().toList();
  }

  static Stream<List<Thread>> threadStream({required String uid}) {
    return threadsCollection
        .where('memberIds', arrayContains: uid)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map((snap) =>
            snap.docs.map((doc) => doc.data()).whereType<Thread>().toList());
  }

  static Future<Thread?> fetchThreadById(String threadId) async {
    final snapshot = await threadsCollection.doc(threadId).get();
    return snapshot.data();
  }

  static Future<DocumentReference> createThread(Thread thread) async {
    final docId = '${thread.memberIds.first}-${thread.memberIds.last}';
    await threadsCollection.doc(docId).set(thread);
    return threadsCollection.doc(docId);
  }

  static Future<void> updateThread(Thread thread) async {
    await threadsCollection
        .doc(thread.reference?.id ?? '')
        .update(thread.toJson());
  }

  static Future<void> updateBadge({
    required String uid,
    required String threadId,
  }) async {
    await threadsCollection.doc(threadId).update({'unreadCount.$uid': []});
  }
}
