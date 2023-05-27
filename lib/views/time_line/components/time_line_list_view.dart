import 'package:darts_link_project/models/post.dart';
import 'package:flutter/material.dart';

import 'time_line_card.dart';

class TimeLineListView extends StatelessWidget {
  const TimeLineListView({Key? key, required this.posts}) : super(key: key);
  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => TimeLineCard(post: posts[index]),
    );
  }
}
