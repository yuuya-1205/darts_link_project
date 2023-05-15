import 'package:darts_link_project/models/post.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/post_repository.dart';
import 'package:flutter/material.dart';

import 'time_line_card.dart';

class WholeTimeLinePage extends StatefulWidget {
  const WholeTimeLinePage({Key? key}) : super(key: key);

  @override
  State<WholeTimeLinePage> createState() => _WholeTimeLinePageState();
}

class _WholeTimeLinePageState extends State<WholeTimeLinePage> {
  final user = AuthRepository.currentUser;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Post>>(
        stream: PostRepository.streamPost(),
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

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return TimeLineCard(
                    post: post,
                  );
                }),
          );
        });
  }
}
