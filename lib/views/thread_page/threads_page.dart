import 'package:darts_link_project/components/constants.dart';
import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/thread_repository.dart';
import 'package:darts_link_project/views/thread_page/thread_chat_page.dart';
import 'package:flutter/material.dart';

import '../../models/thread.dart';

class ThreadsPage extends StatefulWidget {
  final String uid;
  final String threadId;
  final String lastchatCount;

  const ThreadsPage({
    Key? key,
    required this.threadId,
    required this.uid,
    required this.lastchatCount,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ThreadsPageState createState() => _ThreadsPageState();
}

class _ThreadsPageState extends State<ThreadsPage> {
  @override
  Widget build(BuildContext context) {
    ///ログインしているユーザー情報
    final user = AuthRepository.currentUser;
    return Scaffold(
      body: StreamBuilder<List<Thread>>(
        stream: ThreadRepository.threadStream(uid: user!.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('チャット'));
          }

          final threads = snapshot.data;
          if (threads!.isEmpty) {
            return const Center(
              child: Text('チャットがありません'),
            );
          }

          return ListView.builder(
            itemCount: threads.length,
            itemBuilder: (context, index) {
              final thread = threads[index];

              return GestureDetector(
                onTap: () async {
                  await ThreadRepository.updateBadge(
                      uid: user.id, threadId: thread.id);
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => ThreadChatPage(
                            isReading: false,
                            thread: thread,
                          )),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color.fromRGBO(232, 232, 232, 1))),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            UserImage(
                              imageUrl: thread.getMemberDetail(user.id,
                                  isPartner: true)['imageUrl'],
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              children: [
                                Text(thread.getMemberDetail(user.id,
                                    isPartner: true)['name']),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(thread.lastChat),
                              ],
                            ),
                            const Spacer(),
                            if (thread.unReadCount[user.id] != 0)
                              Badge(
                                child: Text(
                                  '${thread.unReadCount[user.id] ?? ""}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            Text(
                              HowLongAgo.since(thread.updatedAt),
                            )
                          ],
                        ),
                      ],
                    ),
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
