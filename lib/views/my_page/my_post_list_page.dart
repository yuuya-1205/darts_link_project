import 'package:darts_link_project/models/post.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/post_repository.dart';
import 'package:darts_link_project/views/time_line_page/time_line_card.dart';
import 'package:flutter/material.dart';

class MyPostListPage extends StatefulWidget {
  const MyPostListPage({Key? key}) : super(key: key);

  @override
  State<MyPostListPage> createState() => _MyPostListPageState();
}

class _MyPostListPageState extends State<MyPostListPage> {
  @override
  Widget build(BuildContext context) {
    final user = AuthRepository.currentUser;
    return StreamBuilder<List<Post>>(
        stream: PostRepository.myPostStream(user!.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return Container();
          }
          final posts = snapshot.data;
          if (posts!.isEmpty) {
            return const Center(
              child: Text('まだ、投稿がありません'),
            );
          }

          return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];

                return TimeLineCard(
                  post: post,
                );
              });
        });
  }
}
