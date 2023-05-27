import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/constant/color.dart';
import 'package:darts_link_project/models/post.dart';
import 'package:darts_link_project/repositories/post/post_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PosterNameView extends StatelessWidget {
  const PosterNameView({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          post.userName,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 4),
        Text(
          '@${post.userId}',
          style: const TextStyle(color: unselectedColor),
        ),
        const Spacer(),
        PopupMenuButton(
          padding: EdgeInsets.zero,
          splashRadius: 1,
          onSelected: (value) async {
            if (value == 'report') {
              final uid = FirebaseAuth.instance.currentUser!.uid;
              FirebaseFirestore.instance.collection('reports').add({
                'uid': uid,
                'createdAt': Timestamp.now(),
                'postId': post.id,
              });
              // Scaffold.of(context).showSnackBar(
              //   const SnackBar(
              //     content: Text('通報ありがとうございました。'),
              //   ),
              // );
            } else if (value == 'hide') {
            } else if (value == 'delete') {
              final uid = FirebaseAuth.instance.currentUser!.uid;
              if (uid == post.creatorId) {
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
                              PostRepository.deletePost(post);
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
              if (uid == post.creatorId)
                const PopupMenuItem(
                  value: 'delete',
                  child: Text('削除'),
                ),
            ];
          },
          child: const Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}
