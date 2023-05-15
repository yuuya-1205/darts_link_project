import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/components/follow_approve_button.dart';
import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/models/follow.dart';
import 'package:darts_link_project/models/post_like.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/follow_repository.dart';
import 'package:darts_link_project/repositories/post_likes_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:flutter/material.dart';

class LikedListPage extends StatefulWidget {
  const LikedListPage({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  State<LikedListPage> createState() => _LikedListPageState();

  final String postId;
}

class _LikedListPageState extends State<LikedListPage> {
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
        title: const Text(
          'いいね一覧',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<List<PostLike>>(
          stream: PostLikesRepository.streamPostLike(widget.postId),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.active) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return Container();
            }
            final postlikes = snapshot.data;

            if (postlikes!.isEmpty) {
              return const Center(
                child: Text('まだ、いいねがありません'),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: postlikes.length,
              itemBuilder: (context, index) {
                final postLike = postlikes[index];
                return Column(
                  children: [
                    Row(
                      children: [
                        UserImage(imageUrl: postLike.userImage),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              postLike.userName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              postLike.userId,
                              style: TextStyle(
                                color: OriginalTheme.themeData.disabledColor,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        StreamBuilder<QuerySnapshot>(
                          stream: FollowRepository.followingStream(
                              reference: postLike.reference!, uid: user!.id),
                          builder: (context, snapshots) {
                            if (postLike.reference == user!.reference) {
                              return Container();
                            }
                            if (snapshots.hasData &&
                                snapshots.data!.docs.isNotEmpty) {
                              return FollowApproveButton(
                                onPressed: () async {
                                  final user = AuthRepository.currentUser;
                                  await FollowRepository.unFollowing(
                                      uid: user!.id,
                                      followingUid: postLike.uid);
                                },
                                text: 'フォロー解除',
                              );
                            }

                            return FollowApproveButton(
                              onPressed: () async {
                                final reference = postLike.reference;
                                if (reference == null) {
                                  throw Exception('フォローに失敗しました。');
                                }
                                await FollowRepository.setFollowing(
                                    follow: Follow(
                                        createdAt: Timestamp.now(),
                                        followingRef: reference,
                                        userId: postLike.userId,
                                        userImage: postLike.userImage,
                                        userName: postLike.userName),
                                    uid: user!.id);
                                print(postLike.uid);
                              },
                              text: 'フォローする',
                            );
                          },
                        ),
                        // FollowApproveButton(
                        //   onPressed: () {

                        //   },
                        //   text: 'フォロー',
                        // )
                      ],
                    )
                  ],
                );
              },
            );
          }),
    );
  }
}
