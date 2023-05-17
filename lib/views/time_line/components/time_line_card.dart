import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/models/post.dart';
import 'package:darts_link_project/repositories/app_user_repository.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/views/my_page/my_page.dart';
import 'package:darts_link_project/views/time_line/components/post_item_bottom_view.dart';
import 'package:darts_link_project/views/time_line/components/poster_name_view.dart';
import 'package:darts_link_project/views/user_page/user_page.dart';
import 'package:flutter/material.dart';

import '../time_line_detail_page.dart';

class TimeLineCard extends StatefulWidget {
  const TimeLineCard({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  State<TimeLineCard> createState() => _TimeLineCardState();
}

class _TimeLineCardState extends State<TimeLineCard> {
  final user = AuthRepository.currentUser;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
            color: Theme.of(context).dividerColor,
          )),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserImage(
              imageUrl: widget.post.userImage,
              onTap: () async {
                final navigator = Navigator.of(context);
                if (widget.post.creatorId == user!.id) {
                  navigator.push(
                    MaterialPageRoute(
                      builder: ((context) => const MyPage()),
                    ),
                  );
                  return;
                }
                final appUser =
                    await AppUserRepository.fetchAppUser(widget.post.creatorId);
                if (appUser == null) {
                  throw Exception('ユーザーが見つかりませんでした');
                }
                navigator.push(
                  MaterialPageRoute(
                    builder: ((context) => UserPage(appUser: appUser)),
                  ),
                );
              },
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PosterNameView(post: widget.post),
                  const SizedBox(height: 8),
                  Text(
                    widget.post.text,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                  if (widget.post.postImage.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(widget.post.postImage.first),
                    ),
                  ],
                  const SizedBox(height: 16),
                  PostItemBottomView(post: widget.post),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
