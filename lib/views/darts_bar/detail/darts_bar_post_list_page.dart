import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/models/post.dart';
import 'package:darts_link_project/repositories/post/post_repository.dart';
import 'package:flutter/material.dart';

import '../../time_line/components/time_line_card.dart';

class DartsBarPostList extends StatefulWidget {
  const DartsBarPostList({super.key, required this.storeOwner});

  final StoreOwner storeOwner;

  @override
  State<DartsBarPostList> createState() => _DartsBarPostListState();
}

class _DartsBarPostListState extends State<DartsBarPostList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Post>>(
        stream: PostRepository.userPostStream(widget.storeOwner.id),
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
