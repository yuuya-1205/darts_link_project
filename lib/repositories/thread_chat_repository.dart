import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/chat.dart';
import 'package:darts_link_project/repositories/thread_repository.dart';

class ThreadChatRepository {
  static final fireStore = FirebaseFirestore.instance;
  static CollectionReference getChatCollectoion(String threadId) =>
      ThreadRepository.threadsCollection.doc(threadId).collection('chats');

  static Future<List<Chat>> fetchChats(String threadId) async {
    final snap = await getChatCollectoion(threadId).get();
    List<Chat> list = snap.docs
        .map((doc) {
          return Chat.fromJson(doc.data() as Map<String, dynamic>);
        })
        .whereType<Chat>()
        .toList();
    return list;
  }

  static Future<String> createChat({
    required Chat chat,
  }) async {
    return (await getChatCollectoion(chat.threadId).add(chat.toJson())).id;
  }

  static Stream<List<Chat>> chatStream(String threadId) {
    return getChatCollectoion(threadId)
        .orderBy('createdAt', descending: true)
        .limit(20)
        .snapshots()
        .map((snap) => snap.docs
            .map((doc) => Chat.fromJson(doc.data() as Map<String, dynamic>))
            .toList());
  }
}
