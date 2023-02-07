import 'package:darts_link_app/components/user_image.dart';
import 'package:darts_link_app/models/post.dart';
import 'package:darts_link_app/repositories/auth_repository.dart';
import 'package:darts_link_app/repositories/post_repository.dart';
import 'package:darts_link_app/theme_data.dart';
import 'package:darts_link_app/views/time_line_page/time_line_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MyPostListPage extends StatefulWidget {
  const MyPostListPage({Key? key}) : super(key: key);

  @override
  State<MyPostListPage> createState() => _MyPostListPageState();
}

class _MyPostListPageState extends State<MyPostListPage> {
  @override
  Widget build(BuildContext context) {
    final user = AuthRepository.currentUser;
    return StreamBuilder<List<Post>>(
        stream: PostRepository.myPostStream(),
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
                // return Column(
                //   children: [
                //     Row(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         UserImage(
                //           width: 50,
                //           height: 50,
                //           imageUrl: post.userImage,
                //           uid: post.createrId,
                //         ),
                //         const SizedBox(
                //           width: 12,
                //         ),
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Row(
                //               children: [
                //                 Text(
                //                   post.userName,
                //                   style: const TextStyle(
                //                       fontSize: 16,
                //                       fontWeight: FontWeight.bold),
                //                 ),
                //                 Text(
                //                   post.userId,
                //                   style: TextStyle(
                //                       color: OriginalTheme
                //                           .themeData.disabledColor),
                //                 ),
                //               ],
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.symmetric(vertical: 8),
                //               child: Text(post.text),
                //             ),
                //             Row(
                //               children: const [
                //                 Icon(FeatherIcons.umbrella),
                //                 SizedBox(
                //                   width: 16,
                //                 ),
                //                 Icon(FeatherIcons.umbrella),
                //                 Text('ここに時間'),
                //               ],
                //             ),
                //           ],
                //         ),
                //       ],
                //     )
                //   ],
                // );
              });
        });
  }
}
