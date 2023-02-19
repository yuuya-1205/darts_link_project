import 'package:darts_link_project/models/circle/circle.dart';
import 'package:darts_link_project/models/post.dart';
import 'package:darts_link_project/repositories/circle/circle_repository.dart';
import 'package:darts_link_project/repositories/post_repository.dart';
import 'package:darts_link_project/views/circle_page/circle_time_line_card.dart';
import 'package:flutter/material.dart';

class CirclePostListPage extends StatefulWidget {
  const CirclePostListPage({
    Key? key,
    required this.circle,
  }) : super(key: key);

  final Circle circle;

  @override
  State<CirclePostListPage> createState() => _CirclePostListPageState();
}

class _CirclePostListPageState extends State<CirclePostListPage> {
  @override
  Widget build(BuildContext context) {
    final circleRef = CircleRepository.getDocumentRef(widget.circle.circleId);

    return StreamBuilder<List<Post>>(
        stream: PostRepository.circlePostStream(circleRef),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return Container();
          }
          final circlePosts = snapshot.data;
          if (circlePosts!.isEmpty) {
            return const Center(
              child: Text('まだ、投稿がありません'),
            );
          }

          return ListView.builder(
              itemCount: circlePosts.length,
              itemBuilder: (context, index) {
                final circlePost = circlePosts[index];
                return CircleTimeLineCard(
                  circlePost: circlePost,
                );
              });
        });
  }
}
