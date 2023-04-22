import 'package:darts_link_project/components/follow_approve_button.dart';
import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/models/battle_room.dart';
import 'package:darts_link_project/models/member.dart';
import 'package:darts_link_project/repositories/app_user_repository.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/battle_room/battle_room_member_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/my_page/my_page.dart';
import 'package:darts_link_project/views/user_page/user_page.dart';
import 'package:flutter/material.dart';

class BattleRoomMemberListCard extends StatelessWidget {
  const BattleRoomMemberListCard(
      {super.key, required this.member, required this.battleRoom});

  final Member member;
  final BattleRoom battleRoom;

  @override
  Widget build(BuildContext context) {
    final user = AuthRepository.currentUser;
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
                      onTap: () async {
                        if (member.uid == user!.id) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const MyPage()),
                            ),
                          );
                          return;
                        }
                        final appUser =
                            await AppUserRepository.fetchAppUser(member.uid);
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
                            Text(
                              'フォロー${member.followingCount}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Text('/'),
                            Text(
                              'フォロワー${member.followerCount}',
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
                    onPressed: () async {
                      await BattleRoomMemberRepository.leaveBattleRoomMember(
                        battleRoomId: battleRoom.id,
                        memberId: member.uid,
                      );
                    },
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
