import 'package:darts_link_project/models/post.dart';
import 'package:darts_link_project/repositories/post/post_repository.dart';
import 'package:flutter/material.dart';

import 'components/time_line_list_view.dart';

class WholeTimeLinePage extends StatelessWidget {
  const WholeTimeLinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Post>>(
      stream: PostRepository.streamPost(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.active) {
          return const Center(child: CircularProgressIndicator());
        }
        final posts = snapshot.data;
        if (!snapshot.hasData || posts!.isEmpty) {
          return const Center(child: Text('まだ、投稿がありません'));
        }

        return TimeLineListView(posts: posts);
      },
    );
  }
}
