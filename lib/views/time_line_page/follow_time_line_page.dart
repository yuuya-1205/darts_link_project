import 'package:darts_link_project/models/follow.dart';
import 'package:darts_link_project/models/post.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/follow_repository.dart';
import 'package:darts_link_project/repositories/post_repository.dart';
import 'package:darts_link_project/views/time_line_page/time_line_card.dart';
import 'package:flutter/material.dart';

class FollowTimeLinePage extends StatefulWidget {
  const FollowTimeLinePage({Key? key}) : super(key: key);

  @override
  State<FollowTimeLinePage> createState() => _FollowTimeLinePageState();
}

class _FollowTimeLinePageState extends State<FollowTimeLinePage> {
  final user = AuthRepository.currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Follow>>(
        stream: FollowRepository.streamFollow(uid: user!.id),
        builder: (context, snapshots) {
          if (snapshots.connectionState != ConnectionState.active) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshots.hasData) {
            return Container();
          }
          final follows = snapshots.data;
          if (follows!.isEmpty) {
            return const Center(
              child: Text('誰かフォローしてみよう！！'),
            );
          }
          final followingUids = follows
              .map(
                (e) => e.followingUid,
              )
              .toList();

          return StreamBuilder<List<Post>>(
              stream: PostRepository.streamFollowPost(followingUids),
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
        });
  }
}
