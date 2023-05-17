import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/components/action_button.dart';
import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/constant/color.dart';
import 'package:darts_link_project/models/post.dart';
import 'package:darts_link_project/models/post_like.dart';
import 'package:darts_link_project/repositories/app_user_repository.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/post/post_like_repository.dart';
import 'package:darts_link_project/repositories/post/post_repository.dart';
import 'package:darts_link_project/views/my_page/my_page.dart';
import 'package:darts_link_project/views/user_page/user_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../time_line/time_line_detail_page.dart';

class CircleTimeLineCard extends StatefulWidget {
  const CircleTimeLineCard({Key? key, required this.circlePost})
      : super(key: key);

  final Post circlePost;

  @override
  State<CircleTimeLineCard> createState() => _CircleTimeLineCardState();
}

class _CircleTimeLineCardState extends State<CircleTimeLineCard> {
  @override
  Widget build(BuildContext context) {
    final user = AuthRepository.currentUser;
    return Container(
      decoration: const BoxDecoration(
          border: Border.symmetric(
        horizontal: BorderSide(color: Colors.grey),
      )),
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserImage(
            onTap: () async {
              if (widget.circlePost.creatorId == user!.id) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const MyPage()),
                  ),
                );
                return;
              }
              final appUser = await AppUserRepository.fetchAppUser(
                  widget.circlePost.creatorId);
              // ignore: use_build_context_synchronously
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => UserPage(
                        appUser: appUser!,
                      )),
                ),
              );
            },
            imageUrl: widget.circlePost.userImage,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => TimeLineDetailPage(
                          post: widget.circlePost,
                        )),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.circlePost.userName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(widget.circlePost.userId),
                      const Spacer(),
                      PopupMenuButton(
                        onSelected: (value) async {
                          if (value == 'report') {
                            final uid = FirebaseAuth.instance.currentUser!.uid;
                            FirebaseFirestore.instance
                                .collection('reports')
                                .add({
                              'uid': uid,
                              'createdAt': Timestamp.now(),
                              'postId': widget.circlePost.id,
                            });
                            // Scaffold.of(context).showSnackBar(
                            //   const SnackBar(
                            //     content: Text('通報ありがとうございました。'),
                            //   ),
                            // );
                          } else if (value == 'hide') {
                          } else if (value == 'delete') {
                            final uid = FirebaseAuth.instance.currentUser!.uid;
                            if (uid == widget.circlePost.creatorId) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('本当に削除して大丈夫ですか？'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            'キャンセル',
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            PostRepository.deletePost(
                                                widget.circlePost);
                                          },
                                          child: const Text(
                                            '削除',
                                          )),
                                    ],
                                  );
                                },
                              );
                            } else {
                              return;
                            }
                          }
                        },
                        itemBuilder: (context) {
                          final uid = FirebaseAuth.instance.currentUser!.uid;
                          return [
                            const PopupMenuItem(
                              value: 'report',
                              child: Text('通報'),
                            ),
                            const PopupMenuItem(
                              value: 'hide',
                              child: Text('非表示'),
                            ),
                            if (uid == widget.circlePost.creatorId)
                              const PopupMenuItem(
                                value: 'delete',
                                child: Text('削除'),
                              ),
                          ];
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    widget.circlePost.text,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  if (widget.circlePost.postImage.isNotEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(widget.circlePost.postImage.first),
                    ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      ActionButton(
                        iconData: FeatherIcons.messageSquare,
                        label: 'コメント',
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
                      StreamBuilder<List<PostLike>>(
                          stream: PostLikeRepository.streamPostLike(
                              widget.circlePost.id),
                          builder: (context, snapshot) {
                            final postLikes = snapshot.data;
                            if (postLikes == null) {
                              return const SizedBox();
                            }
                            if (postLikes
                                .where((element) =>
                                    element.likerReference == user!.reference)
                                .isEmpty) {
                              return ActionButton(
                                iconData: Icons.favorite_outline,
                                color: primary,
                                onTap: () async {
                                  await PostLikeRepository.setLike(
                                    postId: widget.circlePost.id,
                                    postLike: PostLike(
                                      userName: user!.userName,
                                      likerReference: user.reference,
                                      userId: user.userId,
                                      userImage: user.userImage,
                                      reference: user.reference,
                                      createdAt: Timestamp.now(),
                                    ),
                                  );
                                },
                                label:
                                    '${postLikes.isEmpty ? 'いいね' : postLikes.length}',
                              );
                            }
                            return ActionButton(
                              iconData: Icons.favorite,
                              color: primary,
                              label:
                                  '${postLikes.isEmpty ? 'いいね' : postLikes.length}',
                              onTap: () async {
                                await PostLikeRepository.deleteLike(
                                    user!.id, widget.circlePost.id);
                              },
                            );
                          }),
                      const SizedBox(
                        height: 14,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
