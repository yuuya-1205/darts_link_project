import 'package:darts_link_project/components/follow_approve_button.dart';
import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/models/member.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:flutter/material.dart';

class BattleRoomMemberListCard extends StatelessWidget {
  const BattleRoomMemberListCard({super.key, required this.member});

  final Member member;

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
                      imageUrl: member.userImage,
                      uid: member.uid),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              member.userName,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              member.userId,
                              style: TextStyle(
                                  color: OriginalTheme.themeData.disabledColor),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            // Text(
                            //   'フォロー${member}',
                            //   style:
                            //       const TextStyle(fontWeight: FontWeight.bold),
                            // ),
                            // const Text('/'),
                            // Text(
                            //   'フォロワー${member}',
                            //   style:
                            //       const TextStyle(fontWeight: FontWeight.bold),
                            // ),
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
