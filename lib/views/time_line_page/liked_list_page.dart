import 'package:darts_link_project/components/follow_approve_button.dart';
import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/models/post_like.dart';
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
          child: Row(children: [
            Container(
              width: 30,
              child: const BackButton(),
            ),
            const Text(
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
                        UserImage(
                          imageUrl: postLike.userImage,
                          uid: postLike.uid,
                        ),
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
                        FollowApproveButton(
                          onPressed: () {},
                          text: 'フォロー',
                        )
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
