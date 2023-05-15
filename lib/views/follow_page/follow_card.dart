import 'package:darts_link_project/components/follow_approve_button.dart';
import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/models/follow.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

class FollowCard extends StatefulWidget {
  const FollowCard({
    Key? key,
    required this.follow,
  }) : super(key: key);

  final Follow follow;

  @override
  State<FollowCard> createState() => _FollowCardState();
}

class _FollowCardState extends State<FollowCard> {
  @override
  Widget build(BuildContext context) {
    final user = AuthRepository.currentUser;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UserImage(size: 40, imageUrl: widget.follow.userImage),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(widget.follow.userName),
                      Text(widget.follow.userId),
                    ],
                  ),
                  Row(
                    children: const [
                      // Text(user.followingCount.toString()),
                      // Text(user.followerCount.toString()),
                    ],
                  ),
                ],
              ),
            ),
            FollowApproveButton(
              onPressed: () {},
              text: 'フォロー',
            )
          ],
        ),
      ],
    );
  }
}
