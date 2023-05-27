import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/models/post.dart';
import 'package:darts_link_project/repositories/post/post_repository.dart';
import 'package:flutter/material.dart';

class DartsBarPostImage extends StatefulWidget {
  const DartsBarPostImage({super.key, required this.storeOwner});

  final StoreOwner storeOwner;

  @override
  State<DartsBarPostImage> createState() => _DartsBarPostImageState();
}

class _DartsBarPostImageState extends State<DartsBarPostImage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Post>>(
        stream: PostRepository.storeOwnerPostImageStream(
            widget.storeOwner.reference!),
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
          List<String> imageUrls = [];
          for (final post in circlePostImages) {
            imageUrls.addAll(post.postImage);
          }
          return GridView.builder(
            itemCount: imageUrls.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              // 横1行あたりに表示するWidgetの数
              crossAxisCount: 3,
              // Widget間のスペース（左右）
              mainAxisSpacing: 4,
              // Widget間のスペース（上下）
              crossAxisSpacing: 4,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Image(
                image: NetworkImage(imageUrls[index]),
                fit: BoxFit.cover,
              );
            },
          );
        });
  }
}
