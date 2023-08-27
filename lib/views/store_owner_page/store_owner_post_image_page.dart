import 'package:darts_link_project/models/post.dart';
import 'package:darts_link_project/repositories/circle/circle_repository.dart';
import 'package:darts_link_project/repositories/post_repository.dart';
import 'package:flutter/material.dart';

class StoreOwnerImagePage extends StatefulWidget {
  const StoreOwnerImagePage({
    super.key,
  });

  @override
  State<StoreOwnerImagePage> createState() => _StoreOwnerImagePageState();
}

class _StoreOwnerImagePageState extends State<StoreOwnerImagePage> {
//  final postRef = PostRepository.getDocumentRef();
  @override
  Widget build(BuildContext context) {
    return Container();
    //   return StreamBuilder<List<Post>>(
    //       //  stream: PostRepository.circlePostImageStream(postRef),
    //       builder: (context, snapshot) {
    //     if (snapshot.connectionState != ConnectionState.active) {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //     if (!snapshot.hasData) {
    //       return Container();
    //     }
    //     final circlePostImages = snapshot.data;
    //     if (circlePostImages!.isEmpty) {
    //       return const Center(
    //         child: Text('まだ、投稿がありません'),
    //       );
    //     }
    //     List<String> imageUrls = [];
    //     for (final post in circlePostImages) {
    //       imageUrls.addAll(post.postImage);
    //     }
    //     return GridView.builder(
    //       itemCount: imageUrls.length,
    //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //         // 横1行あたりに表示するWidgetの数
    //         crossAxisCount: 3,
    //         // Widget間のスペース（左右）
    //         mainAxisSpacing: 4,
    //         // Widget間のスペース（上下）
    //         crossAxisSpacing: 4,
    //       ),
    //       itemBuilder: (BuildContext context, int index) {
    //         return Image(
    //           image: NetworkImage(imageUrls[index]),
    //           fit: BoxFit.cover,
    //         );
    //       },
    //     );
    //   });
    // }
  }
}
