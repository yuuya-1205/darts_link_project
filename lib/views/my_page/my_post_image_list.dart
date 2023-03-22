import 'package:darts_link_project/models/post.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/post_repository.dart';
import 'package:flutter/material.dart';

class MyPostImageList extends StatefulWidget {
  const MyPostImageList({
    Key? key,
  }) : super(key: key);

  @override
  State<MyPostImageList> createState() => _MyPostImageListState();
}

class _MyPostImageListState extends State<MyPostImageList> {
  @override
  Widget build(BuildContext context) {
    final user = AuthRepository.currentUser;

    return StreamBuilder<List<Post>>(
        stream: PostRepository.myPostStream(user!.id),
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
                final posterRef = PostRepository.getDocumentRef(post.id);

                return StreamBuilder(
                    stream: PostRepository.myPostImageStream(posterRef),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.active) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (!snapshot.hasData) {
                        return Container();
                      }
                      final postImages = snapshot.data;
                      if (postImages!.isEmpty) {
                        return const Center(
                          child: Text('まだ、投稿がありません'),
                        );
                      }
                      List<String> imageUrls = [];
                      for (final post in postImages) {
                        imageUrls.addAll(post.postImage);
                      }
                      return GridView.builder(
                        itemCount: imageUrls.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
              });
        });
  }
}
