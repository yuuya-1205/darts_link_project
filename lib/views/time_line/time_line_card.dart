import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/components/action_button.dart';
import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/models/post.dart';
import 'package:darts_link_project/models/post_like.dart';
import 'package:darts_link_project/repositories/app_user_repository.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/post_likes_repository.dart';
import 'package:darts_link_project/repositories/post_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/my_page/my_page.dart';
import 'package:darts_link_project/views/user_page/user_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'liked_list_page.dart';
import 'time_line_detail_page.dart';

class TimeLineCard extends StatefulWidget {
  const TimeLineCard({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;

  @override
  State<TimeLineCard> createState() => _TimeLineCardState();
}

class _TimeLineCardState extends State<TimeLineCard> {
  final user = AuthRepository.currentUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border.symmetric(horizontal: BorderSide(color: Colors.grey))),
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserImage(
            onTap: () async {
              if (widget.post.createrId == user!.id) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const MyPage()),
                  ),
                );
                return;
              }
              final appUser =
                  await AppUserRepository.fetchAppUser(widget.post.createrId);
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
            imageUrl: widget.post.userImage,
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
                          post: widget.post,
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
                        widget.post.userName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(widget.post.userId),
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
                              'postId': widget.post.id,
                            });
                            // Scaffold.of(context).showSnackBar(
                            //   const SnackBar(
                            //     content: Text('通報ありがとうございました。'),
                            //   ),
                            // );
                          } else if (value == 'hide') {
                          } else if (value == 'delete') {
                            final uid = FirebaseAuth.instance.currentUser!.uid;
                            if (uid == widget.post.createrId) {
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
                                                widget.post);
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
                            if (uid == widget.post.createrId)
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
                    widget.post.text,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  if (widget.post.postImage.isNotEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(widget.post.postImage.first),
                    ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      ActionButton(
                        icondata: FeatherIcons.messageSquare,
                        label: 'コメント',
                        onPressed: () async {
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
                          stream: PostLikesRepository.streamPostLike(
                              widget.post.id),
                          builder: (context, snapshot) {
                            final postLikes = snapshot.data;
                            if (postLikes == null) {
                              return const SizedBox();
                            }
                            if (postLikes
                                .where((element) => element.uid == user!.id)
                                .isEmpty) {
                              return ActionButton(
                                icondata: Icons.favorite_outline,
                                iconColor: OriginalTheme.themeData.primaryColor,
                                onPressed: () async {
                                  await PostLikesRepository.setLikes(
                                    postId: widget.post.id,
                                    postLike: PostLike(
                                      reference: user!.reference,
                                      userName: user!.userName,
                                      uid: user!.id,
                                      userId: user!.userId,
                                      userImage: user!.userImage,
                                      createdAt: Timestamp.now(),
                                    ),
                                  );
                                },
                                label:
                                    '${postLikes.isEmpty ? 'いいね' : postLikes.length}',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => LikedListPage(
                                            postId: widget.post.id,
                                          )),
                                    ),
                                  );
                                },
                              );
                            }
                            return ActionButton(
                              icondata: Icons.favorite,
                              iconColor: OriginalTheme.themeData.primaryColor,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => LikedListPage(
                                          postId: widget.post.id,
                                        )),
                                  ),
                                );
                              },
                              label:
                                  '${postLikes.isEmpty ? 'いいね' : postLikes.length}',
                              onPressed: () async {
                                await PostLikesRepository.deleteLikes(
                                    user!.id, widget.post.id);
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
