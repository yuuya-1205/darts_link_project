import 'package:darts_link_project/models/follow.dart';
import 'package:darts_link_project/models/post.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/follow_repository.dart';
import 'package:darts_link_project/repositories/post/post_repository.dart';
import 'package:flutter/material.dart';

import 'components/time_line_list_view.dart';

class FollowTimeLinePage extends StatefulWidget {
  const FollowTimeLinePage({Key? key}) : super(key: key);

  @override
  State<FollowTimeLinePage> createState() => _FollowTimeLinePageState();
}

class _FollowTimeLinePageState extends State<FollowTimeLinePage> {
  final user = AuthRepository.currentUser;

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      throw Exception('ログインしていません');
    }
    return StreamBuilder<List<Follow>>(
      stream: FollowRepository.followListStream(uid: user!.id),
      builder: (context, snapshots) {
        if (snapshots.connectionState != ConnectionState.active) {
          return const Center(child: CircularProgressIndicator());
        }
        final follows = snapshots.data;
        if (!snapshots.hasData || follows!.isEmpty) {
          return const Center(child: Text('誰かフォローしてみよう！！'));
        }
        final followingUidList = follows.map((e) => e.followingRef.id).toList();

        return StreamBuilder<List<Post>>(
          stream: PostRepository.streamFollowPost(followingUidList),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.active) {
              return const Center(child: CircularProgressIndicator());
            }
            final posts = snapshot.data;
            if (!snapshot.hasData || posts!.isEmpty) {
              return const Center(
                child: Text('まだ、投稿がありません'),
              );
            }

            return TimeLineListView(posts: posts);
          },
        );
      },
    );
  }
}
