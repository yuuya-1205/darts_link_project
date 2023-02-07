import 'package:darts_link_project/models/circle.dart';
import 'package:darts_link_project/models/post.dart';
import 'package:darts_link_project/repositories/circle/circle_repository.dart';
import 'package:darts_link_project/repositories/post_repository.dart';
import 'package:darts_link_project/views/circle_page/circle_post_image_card.dart';
import 'package:flutter/material.dart';

class CirclePostImagePage extends StatefulWidget {
  const CirclePostImagePage({
    Key? key,
    required this.circle,
  }) : super(key: key);

  final Circle circle;

  @override
  State<CirclePostImagePage> createState() => _CirclePostImagePageState();
}

class _CirclePostImagePageState extends State<CirclePostImagePage> {
  @override
  Widget build(BuildContext context) {
    final circleRef = CircleRepository.getDocumentRef(widget.circle.circleId);

    return StreamBuilder<List<Post>>(
        stream: PostRepository.circlePostImageStream(circleRef),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return Container();
          }
          final circlePostImages = snapshot.data;
          if (circlePostImages!.isEmpty) {
            return const Center(
              child: Text('まだ、投稿がありません'),
            );
          }

          return ListView.builder(
              itemCount: circlePostImages.length,
              itemBuilder: (context, index) {
                final circlePostImage = circlePostImages[index];
                return CirclePostImageCard(
                  circlePostImage: circlePostImage,
                );
              });
        });
  }
}
