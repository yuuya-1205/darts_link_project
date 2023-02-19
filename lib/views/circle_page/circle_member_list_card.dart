import 'package:darts_link_project/components/follow_approve_button.dart';
import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/models/circle/circle_member.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CircleMemberListCard extends StatelessWidget {
  const CircleMemberListCard({Key? key, required this.circleMember})
      : super(key: key);

  final CircleMember circleMember;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: const Color.fromRGBO(232, 232, 232, 1))),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  UserImage(
                      height: 50,
                      width: 50,
                      imageUrl: circleMember.userImage,
                      uid: circleMember.uid),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              circleMember.userName,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              circleMember.userId,
                              style: TextStyle(
                                  color: OriginalTheme.themeData.disabledColor),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'フォロー${circleMember.followingCount}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Text('/'),
                            Text(
                              'フォロワー${circleMember.followerCount}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  FollowApproveButton(
                    onPressed: () {},
                    text: '拒否する',
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
