import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/components/action_button.dart';
import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/constant/color.dart';
import 'package:darts_link_project/models/comment.dart';
import 'package:darts_link_project/models/post.dart';
import 'package:darts_link_project/models/post_like.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/comment_repository.dart';
import 'package:darts_link_project/repositories/post/post_like_repository.dart';
import 'package:darts_link_project/repositories/post/post_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/comment_page.dart/create_comment_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class TimeLineDetailPage extends StatefulWidget {
  const TimeLineDetailPage({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;

  @override
  State<TimeLineDetailPage> createState() => _TimeLineDetailPageState();
}

class _TimeLineDetailPageState extends State<TimeLineDetailPage> {
  final user = AuthRepository.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(247, 63, 150, 1),
        ),
        leadingWidth: 76,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(children: const [
            SizedBox(
              width: 30,
              child: BackButton(),
            ),
            Text(
              '戻る',
              style: TextStyle(
                color: Color.fromRGBO(247, 63, 150, 1),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ]),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(
                          color: OriginalTheme.themeData.disabledColor))),
              padding: const EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserImage(imageUrl: widget.post.userImage),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
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
                                  final uid =
                                      FirebaseAuth.instance.currentUser!.uid;
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
                                  final uid =
                                      FirebaseAuth.instance.currentUser!.uid;
                                  if (uid == widget.post.creatorId) {
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
                                final uid =
                                    FirebaseAuth.instance.currentUser!.uid;
                                return [
                                  const PopupMenuItem(
                                    value: 'report',
                                    child: Text('通報'),
                                  ),
                                  const PopupMenuItem(
                                    value: 'hide',
                                    child: Text('非表示'),
                                  ),
                                  if (uid == widget.post.creatorId)
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  widget.post.id),
                              builder: (context, snapshot) {
                                final postLikes = snapshot.data;
                                if (postLikes == null) {
                                  return const SizedBox();
                                }
                                if (postLikes
                                    .where((element) =>
                                        element.reference == user!.reference)
                                    .isEmpty) {
                                  return ActionButton(
                                    iconData: Icons.favorite_outline,
                                    color: primary,
                                    onTap: () async {
                                      await PostLikeRepository.setLike(
                                        postId: widget.post.id,
                                        postLike: PostLike(
                                          userName: user!.userName,
                                          reference: user!.reference,
                                          likerReference: user!.reference,
                                          userId: user!.userId,
                                          userImage: user!.userImage,
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
                                        user!.id, widget.post.id);
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(color: Colors.grey))),
              child: Row(children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => CreateCommentPage(
                              postId: widget.post.id,
                            )),
                      ),
                    );
                  },
                  icon: const Icon(
                    FeatherIcons.messageSquare,
                    color: Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_outline,
                    color: Colors.grey,
                  ),
                ),
              ]),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(color: Colors.grey),
                ),
              ),
              child: StreamBuilder<List<Comment>>(
                  stream: CommentRepository.streamComment(widget.post.id),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.active) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (!snapshot.hasData) {
                      return Container();
                    }
                    final comments = snapshot.data;

                    if (comments!.isEmpty) {
                      return const Center(
                        child: Text('まだ、コメントがありません'),
                      );
                    }

                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          final comment = comments[index];
                          return Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    border: Border.symmetric(
                                        horizontal:
                                            BorderSide(color: Colors.grey))),
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    UserImage(imageUrl: comment.userImage),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                comment.userName,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(comment.userId),
                                              const Spacer(),
                                              PopupMenuButton(
                                                onSelected: (value) async {
                                                  if (value == 'report') {
                                                    final uid = FirebaseAuth
                                                        .instance
                                                        .currentUser!
                                                        .uid;
                                                    FirebaseFirestore.instance
                                                        .collection('reports')
                                                        .add({
                                                      'uid': uid,
                                                      'createdAt':
                                                          Timestamp.now(),
                                                      'postId': widget.post.id,
                                                    });
                                                    // Scaffold.of(context)
                                                    //     .showSnackBar(
                                                    //   const SnackBar(
                                                    //     content: Text(
                                                    //         '通報ありがとうございました。'),
                                                    //   ),
                                                    // );
                                                  } else if (value == 'hide') {
                                                  } else if (value ==
                                                      'delete') {
                                                    final uid = FirebaseAuth
                                                        .instance
                                                        .currentUser!
                                                        .uid;
                                                    if (uid ==
                                                        widget.post.creatorId) {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            title: const Text(
                                                                '本当に削除して大丈夫ですか？'),
                                                            actions: [
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                    'キャンセル',
                                                                  )),
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    PostRepository
                                                                        .deletePost(
                                                                            widget.post);
                                                                  },
                                                                  child:
                                                                      const Text(
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
                                                  final uid = FirebaseAuth
                                                      .instance
                                                      .currentUser!
                                                      .uid;
                                                  return [
                                                    const PopupMenuItem(
                                                      value: 'report',
                                                      child: Text('通報'),
                                                    ),
                                                    const PopupMenuItem(
                                                      value: 'hide',
                                                      child: Text('非表示'),
                                                    ),
                                                    if (uid ==
                                                        widget.post.creatorId)
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
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Text(
                                                  '返信先:                                          '),
                                              Text(
                                                widget.post.userId,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          Text(
                                            comment.text,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 4,
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          if (comment.commentImage.isNotEmpty)
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                  comment.commentImage.first),
                                            ),
                                          const SizedBox(
                                            height: 18,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ActionButton(
                                                iconData:
                                                    FeatherIcons.messageSquare,
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

                                              ///TODO　commentLikeを作成すること
                                              StreamBuilder<List<PostLike>>(
                                                stream: PostLikeRepository
                                                    .streamPostLike(
                                                        widget.post.id),
                                                builder: (context, snapshot) {
                                                  final postLikes =
                                                      snapshot.data;
                                                  if (postLikes == null) {
                                                    return const SizedBox();
                                                  }
                                                  if (postLikes
                                                      .where((element) =>
                                                          element
                                                              .likerReference ==
                                                          user!.reference)
                                                      .isEmpty) {
                                                    return ActionButton(
                                                      iconData: Icons
                                                          .favorite_outline,
                                                      color: primary,
                                                      onTap: () async {
                                                        await PostLikeRepository
                                                            .setLike(
                                                          postId:
                                                              widget.post.id,
                                                          postLike: PostLike(
                                                            userName:
                                                                user!.userName,
                                                            likerReference:
                                                                user!.reference,
                                                            userId:
                                                                user!.userId,
                                                            userImage:
                                                                user!.userImage,
                                                            createdAt:
                                                                Timestamp.now(),
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
                                                      await PostLikeRepository
                                                          .deleteLike(user!.id,
                                                              widget.post.id);
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

//  Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           widget.post.userName,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                         Text(widget.post.userId),
//                         const Spacer(),
//                         PopupMenuButton(
//                           onSelected: (value) async {
//                             if (value == 'report') {
//                               final uid =
//                                   FirebaseAuth.instance.currentUser!.uid;
//                               FirebaseFirestore.instance
//                                   .collection('reports')
//                                   .add({
//                                 'uid': uid,
//                                 'createdAt': Timestamp.now(),
//                                 'postId': widget.post.id,
//                               });
//                               Scaffold.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text('通報ありがとうございました。'),
//                                 ),
//                               );
//                             } else if (value == 'hide') {
//                             } else if (value == 'delete') {
//                               final uid =
//                                   FirebaseAuth.instance.currentUser!.uid;
//                               if (uid == widget.post.creatorId) {
//                                 showDialog(
//                                   context: context,
//                                   builder: (context) {
//                                     return AlertDialog(
//                                       title: const Text('本当に削除して大丈夫ですか？'),
//                                       actions: [
//                                         TextButton(
//                                             onPressed: () {
//                                               Navigator.of(context).pop();
//                                             },
//                                             child: const Text(
//                                               'キャンセル',
//                                             )),
//                                         TextButton(
//                                             onPressed: () {
//                                               Navigator.of(context).pop();
//                                               PostRepository.deletePost(
//                                                   widget.post);
//                                             },
//                                             child: const Text(
//                                               '削除',
//                                             )),
//                                       ],
//                                     );
//                                   },
//                                 );
//                               } else {
//                                 return;
//                               }
//                             }
//                           },
//                           itemBuilder: (context) {
//                             final uid = FirebaseAuth.instance.currentUser!.uid;
//                             return [
//                               const PopupMenuItem(
//                                 value: 'report',
//                                 child: Text('通報'),
//                               ),
//                               const PopupMenuItem(
//                                 value: 'hide',
//                                 child: Text('非表示'),
//                               ),
//                               if (uid == widget.post.creatorId)
//                                 const PopupMenuItem(
//                                   value: 'delete',
//                                   child: Text('削除'),
//                                 ),
//                             ];
//                           },
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 7,
//                     ),
//                     Text(
//                       widget.post.text,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 4,
//                     ),
//                     const SizedBox(
//                       height: 12,
//                     ),
//                     if (widget.post.postImage.isNotEmpty)
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Image.network(widget.post.postImage.first),
//                       ),
//                     const SizedBox(
//                       height: 18,
//                     ),
//                     Row(
//                       children: [
//                         ActionButton(
//                           icondata: FeatherIcons.messageSquare,
//                           label: 'コメント',
//                           onPressed: () async {
//                             // final commented =
//                             //     await Navigator.of(context).push(
//                             //         CreateCommentPage.route(post));
//                             // if (commented == true) {
//                             //   Scaffold.of(context).showSnackBar(
//                             //     SnackBar(
//                             //       content: Text('コメントが送信されました.'),
//                             //     ),
//                             //   );
//                             // }
//                           },
//                         ),
//                         StreamBuilder<List<PostLike>>(
//                             stream: PostLikesRepository.streamPostLike(
//                                 widget.post.id),
//                             builder: (context, snapshot) {
//                               final postLikes = snapshot.data;
//                               if (postLikes == null) {
//                                 return SizedBox();
//                               }
//                               if (postLikes
//                                   .where((element) => element.uid == user!.id)
//                                   .isEmpty) {
//                                 return ActionButton(
//                                   icondata: Icons.favorite_outline,
//                                   iconColor:
//                                       OriginalTheme.themeData.primaryColor,
//                                   onPressed: () async {
//                                     await PostLikesRepository.setLikes(
//                                       postId: widget.post.id,
//                                       postLike: PostLike(
//                                         userName: user!.userName,
//                                         uid: user!.id,
//                                         userId: user!.userId,
//                                         userImage: user!.userImage,
//                                         createdAt: Timestamp.now(),
//                                       ),
//                                     );
//                                   },
//                                   label:
//                                       '${postLikes.isEmpty ? 'いいね' : postLikes.length}',
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: ((context) => LikedListPage(
//                                               postId: widget.post.id,
//                                             )),
//                                       ),
//                                     );
//                                   },
//                                 );
//                               }
//                               return ActionButton(
//                                 icondata: Icons.favorite,
//                                 iconColor: OriginalTheme.themeData.primaryColor,
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: ((context) => LikedListPage(
//                                             postId: widget.post.id,
//                                           )),
//                                     ),
//                                   );
//                                 },
//                                 label:
//                                     '${postLikes.isEmpty ? 'いいね' : postLikes.length}',
//                                 onPressed: () async {
//                                   await PostLikesRepository.deleteLikes(
//                                       user!.id, widget.post.id);
//                                 },
//                               );
//                             }),
//                         const SizedBox(
//                           height: 14,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
