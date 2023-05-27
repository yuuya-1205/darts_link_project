import 'package:darts_link_project/components/constants.dart';
import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/constant/color.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/thread_repository.dart';
import 'package:darts_link_project/views/chat/chat_page.dart';
import 'package:darts_link_project/views/components/loading_view.dart';
import 'package:darts_link_project/views/thread_page/components/unread_badge_view.dart';
import 'package:flutter/material.dart';

import '../../models/thread.dart';

class ThreadsPage extends StatefulWidget {
  const ThreadsPage({Key? key}) : super(key: key);

  @override
  ThreadsPageState createState() => ThreadsPageState();
}

class ThreadsPageState extends State<ThreadsPage> {
  @override
  Widget build(BuildContext context) {
    final user = AuthRepository.currentUser;
    if (user == null) {
      throw Exception('ログインしていません');
    }

    return Scaffold(
      body: StreamBuilder<List<Thread>>(
        stream: ThreadRepository.threadStream(uid: user.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return const LoadingView();
          }
          final threads = snapshot.data;
          if (!snapshot.hasData || threads!.isEmpty) {
            return const Center(child: Text('チャットがありません'));
          }

          return ListView.builder(
            itemCount: threads.length,
            itemBuilder: (context, index) {
              final thread = threads[index];
              return GestureDetector(
                onTap: () async {
                  final navigator = Navigator.of(context);
                  await ThreadRepository.updateBadge(
                      uid: user.id, threadId: thread.reference?.id ?? '');

                  await navigator.push(
                    MaterialPageRoute(
                        builder: ((context) => ChatPage(
                              thread: thread.copyWith(unreadCount:
                                  thread.unreadCount.map((key, value) {
                                if (key == user.id) {
                                  return MapEntry(key, []);
                                }
                                return MapEntry(key, value);
                              })),
                            ))),
                  );
                  await ThreadRepository.updateBadge(
                      uid: user.id, threadId: thread.reference?.id ?? '');
                },
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: unselectedColor)),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      UserImage(
                        imageUrl: thread.getMemberDetail(user.id).userImage,
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(thread.getMemberDetail(user.id).userName),
                          const SizedBox(height: 4),
                          Text(
                            thread.latestChat,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(HowLongAgo.since(thread.updatedAt)),
                          UnreadBadgeView(
                              unreadCount:
                                  thread.unreadCount[user.id]?.length ?? 0),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
