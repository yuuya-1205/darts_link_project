import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/models/post.dart';
import 'package:darts_link_project/repositories/post_repository.dart';
import 'package:flutter/material.dart';

import '../time_line/time_line_card.dart';

class UserPostListPage extends StatefulWidget {
  const UserPostListPage({
    Key? key,
    required this.appUser,
  }) : super(key: key);

  final AppUser appUser;

  @override
  State<UserPostListPage> createState() => _UserPostListPageState();
}

class _UserPostListPageState extends State<UserPostListPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Post>>(
        stream: PostRepository.userPostStream(widget.appUser.id),
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
