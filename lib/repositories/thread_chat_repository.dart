import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/chat.dart';
import 'package:darts_link_project/repositories/thread_repository.dart';

class ThreadChatRepository {
  static final fireStore = FirebaseFirestore.instance;
  static CollectionReference<Chat?> getChatCollection(String threadId) =>
      ThreadRepository.threadsCollection
          .doc(threadId)
          .collection('chats')
          .withConverter(
              fromFirestore: (snapshot, _) =>
                  Chat.fromJson(snapshot.data() ?? {})
                      .copyWith(reference: snapshot.reference),
              toFirestore: (value, _) {
                final data = value?.toJson();
                data?.remove('reference');
                return data ?? {};
              });

  static Future<List<Chat>> fetchChats(String threadId) async {
    final snap = await getChatCollection(threadId).get();
    List<Chat> list = snap.docs
        .map((doc) {
          return Chat.fromJson(doc.data() as Map<String, dynamic>);
        })
        .whereType<Chat>()
        .toList();
    return list;
  }

  static Future<String> createChat({required Chat chat}) async {
    return (await getChatCollection(chat.threadReference.id).add(chat)).id;
  }

  static Stream<List<Chat>> chatStream(String threadId) {
    return getChatCollection(threadId)
        .orderBy('createdAt', descending: true)
        .limit(20)
        .snapshots()
        .map((snap) =>
            snap.docs.map((doc) => doc.data()).whereType<Chat>().toList());
  }
}
