import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/components/action_button.dart';
import 'package:darts_link_project/constant/color.dart';
import 'package:darts_link_project/extensions/date_time_extension.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/models/post.dart';
import 'package:darts_link_project/models/post_like.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/post/post_like_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class PostItemBottomView extends StatelessWidget {
  const PostItemBottomView({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    final user = AuthRepository.currentUser;
    if (user == null) {
      throw Exception('ログインしていません');
    }
    return Row(
      children: [
        ActionButton(
          iconData: FeatherIcons.messageSquare,
          label: 'コメント',
          color: unselectedColor,
          onTap: () async {
            // final commented =
            //     await Navigator.of(context).push(
            //         CreateCommentPage.route(post));
            // if (commented == true) {
            //   Scaffold.of(context).showSnackBar(
            //     SnackBar(
            //       content: Text('コメントが送信されました.'),
            //     ),
            //   );
            // }
          },
        ),
        const SizedBox(width: 12),
        StreamBuilder<List<PostLike>>(
          stream: PostLikeRepository.streamPostLike(post.id),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            }
            final postLikes = snapshot.data!;
            if (isLiked(postLikes: postLikes, user: user)) {
              return ActionButton(
                iconData: Icons.favorite,
                color: primary,
                label: '${postLikes.length}',
                onTap: () async {
                  await PostLikeRepository.deleteLike(user.id, post.id);
                },
              );
            }
            return ActionButton(
              iconData: Icons.favorite_outline,
              color: unselectedColor,
              onTap: () async {
                await PostLikeRepository.setLike(
                  postId: post.id,
                  postLike: PostLike(
                    reference: user.reference,
                    userName: user.userName,
                    likerReference: user.reference,
                    userId: user.userId,
                    userImage: user.userImage,
                    createdAt: Timestamp.now(),
                  ),
                );
              },
              label: '${postLikes.length}',
            );
          },
        ),
        const Spacer(),
        Text(
          post.createdAt.toDate().toYMDHmString(),
          style: const TextStyle(color: unselectedColor),
        ),
      ],
    );
  }

  bool isLiked({
    required List<PostLike> postLikes,
    required AppUser user,
  }) {
    return postLikes
        .where((element) => element.likerReference == user.reference)
        .isNotEmpty;
  }
}
