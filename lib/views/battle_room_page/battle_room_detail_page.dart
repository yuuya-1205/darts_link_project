// ignore_for_file: use_build_context_synchronously

import 'package:darts_link_project/components/delele_snack_bar.dart';
import 'package:darts_link_project/components/follow_approve_button.dart';
import 'package:darts_link_project/components/original_button.dart';
import 'package:darts_link_project/components/text_components/original_label.dart';
import 'package:darts_link_project/components/text_components/original_text.dart';
import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/models/battle_room.dart';
import 'package:darts_link_project/models/join_request.dart';
import 'package:darts_link_project/models/member.dart';
import 'package:darts_link_project/repositories/app_user_repository.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/battle_room/battle_room_join_request_repository.dart';
import 'package:darts_link_project/repositories/battle_room/battle_room_member_repository.dart';
import 'package:darts_link_project/repositories/battle_room/battle_room_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/battle_room_page/battle_room_member_list_page.dart';
import 'package:darts_link_project/views/battle_room_page/components/battle_room_member_approved_list_page.dart';
import 'package:darts_link_project/views/battle_room_page/edit_battle_room_page.dart';
import 'package:darts_link_project/views/my_page/my_page.dart';
import 'package:darts_link_project/views/user_page/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:intl/intl.dart';

class BattleRoomDetailPage extends StatefulWidget {
  const BattleRoomDetailPage({
    Key? key,
    required this.battleRoom,
  }) : super(key: key);

  final BattleRoom battleRoom;

  @override
  State<BattleRoomDetailPage> createState() => _BattleRoomDetailPageState();
}

class _BattleRoomDetailPageState extends State<BattleRoomDetailPage> {
  final user = AuthRepository.currentUser;
  List<Member> members = [];
  DateFormat dateFormat = DateFormat("yyyy年MM月dd日");
  DateFormat timeFormat = DateFormat("HH:mm");
  Future<void> fetchMembers() async {
    members = await BattleRoomMemberRepository.fetchBattleRoomMembers(
        widget.battleRoom.id);
    setState(() {});
  }

  Future<void> joinRoom() async {
    final user = AuthRepository.currentUser;
    if (user == null) {
      return;
    }
    final appUser = await AppUserRepository.fetchAppUser(user.id);
    if (appUser == null) {
      return;
    }

    final member = Member.fromAppUser(appUser);
    final canCreate = await BattleRoomRepository.canCreateBattleRoomMember(
        widget.battleRoom.id);

    if (canCreate == false) {
      showDialog(
          context: context,
          builder: (_) {
            return const AlertDialog(
              title: Text('定員に達しています'),
            );
          });
      return;
    }
    await BattleRoomMemberRepository.createBattleRoomMember(
        battleRoomId: widget.battleRoom.id, member: member);
    await updateNumberOfParticipants();
    members.add(member);

    setState(() {});
  }

  Future<void> leaveRoom() async {
    final user = AuthRepository.currentUser;
    if (user == null) {
      return;
    }
    if (widget.battleRoom.isApproved == true) {
      BattleRoomJoinRequestRepository.deleteBattleRoomJoinRequest(
          battleRoomId: widget.battleRoom.id, uid: user.id);
    }
    await BattleRoomMemberRepository.leaveBattleRoomMember(
        battleRoomId: widget.battleRoom.id, memberId: user.id);
    await updateNumberOfParticipants();
    members.removeWhere((member) => member.uid == user.id);
    setState(() {});
  }

  Future<void> requestJoinRoom() async {
    final user = AuthRepository.currentUser;
    if (user == null) {
      return;
    }
    final joinRequest = JoinRequest.fromAppUser(user);
    await BattleRoomJoinRequestRepository.createBattleRoomJoinRequest(
        battleRoomId: widget.battleRoom.id, joinRequest: joinRequest);
    setState(() {});
  }

  Future<void> cancelRequestRoom() async {
    final user = AuthRepository.currentUser;
    if (user == null) {
      return;
    }

    await BattleRoomJoinRequestRepository.deleteBattleRoomJoinRequest(
      battleRoomId: widget.battleRoom.id,
      uid: user.id,
    );
    setState(() {});
  }

  Future<void> updateNumberOfParticipants() async {
    final memberDocsCount =
        await BattleRoomMemberRepository.fetchMemberDocsCount(
            widget.battleRoom.id);
    await BattleRoomRepository.updateBattleRoom(
        widget.battleRoom.copyWith(numberOfParticipants: memberDocsCount));
  }

  Future<BattleRoomMemberType> getMemberType() async {
    final myUid = AuthRepository.currentUser!.id;
    if (myUid == widget.battleRoom.ownerId) {
      return BattleRoomMemberType.owner;
    }
    if (widget.battleRoom.isApproved == true) {
      final joinRequest =
          await BattleRoomJoinRequestRepository.fetchBattleRoomJoinRequest(
        battleRoomId: widget.battleRoom.id,
        uid: myUid,
      );
      if (joinRequest == null) {
        return BattleRoomMemberType.beforeRequesting;
      }
      if (joinRequest.status == JoinRequestStatus.requesting) {
        return BattleRoomMemberType.requesting;
      }
      return BattleRoomMemberType.joined;
    }
    final isJoined = members.map((e) => e.uid).toList().contains(myUid);
    if (isJoined == true) {
      return BattleRoomMemberType.joined;
    }
    return BattleRoomMemberType.joinable;
  }

  @override
  void initState() {
    fetchMembers();
    super.initState();
  }

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
          // ignore: prefer_const_literals_to_create_immutables
          child: Row(children: [
            const SizedBox(
              width: 30,
              child: BackButton(),
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
        actions: [
          FutureBuilder<BattleRoomMemberType>(
              future: getMemberType(),
              builder: (builder, snapshot) {
                return snapshot.data == BattleRoomMemberType.owner
                    ? PopupMenuButton(
                        onSelected: (value) {},
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              value: 'edit',
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => EditBattleRoomPage(
                                          battleRoom: widget.battleRoom)),
                                    ),
                                  );
                                },
                                child: const Text('編集'),
                              ),
                            ),
                            PopupMenuItem(
                              value: 'memberList',
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          BattleRoomMemberListPage(
                                            battleRoom: widget.battleRoom,
                                          )),
                                    ),
                                  );
                                },
                                child: const Text('メンバーリスト'),
                              ),
                            ),
                            if (widget.battleRoom.isApproved == true)
                              PopupMenuItem(
                                value: 'approvedList',
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) =>
                                            BattleRoomMemberApprovedListPage(
                                              battleRoom: widget.battleRoom,
                                            )),
                                      ),
                                    );
                                  },
                                  child: const Text('申請リスト'),
                                ),
                              ),
                            PopupMenuItem(
                              value: 'delete',
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        title: Row(
                                          children: const [
                                            Icon(
                                              FeatherIcons.alertTriangle,
                                              color: Colors.yellow,
                                            ),
                                            Text(
                                              'このイベントを本当に削除しますか？',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          // ボタン領域
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FollowApproveButton(
                                                onPressed: () {
                                                  BattleRoomRepository
                                                      .deleteBattleRoom(
                                                          widget.battleRoom);
                                                  Navigator.pop(context);
                                                  DeleteSnackBar.showSnackBar(
                                                      context);
                                                },
                                                text: '削除する',
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              FollowApproveButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                text: 'キャンセル',
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: const Text('削除'),
                              ),
                            ),
                          ];
                        })
                    : Container();
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.battleRoom.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 14),
              const Text(
                '概要',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      OriginalLabel(label: '場所'),
                      OriginalLabel(label: '日時'),
                      OriginalLabel(label: 'エリア'),
                      OriginalLabel(label: '定員'),
                      OriginalLabel(label: '機種'),
                      OriginalLabel(label: '特徴'),
                    ],
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OriginalText(
                          text: widget.battleRoom.place.isEmpty
                              ? '未登録'
                              : widget.battleRoom.place),
                      Row(
                        children: [
                          OriginalText(
                              text: dateFormat
                                  .format(widget.battleRoom.dateTime.toDate())),
                          OriginalText(
                              text:
                                  '${timeFormat.format(widget.battleRoom.startTime.toDate())}~${timeFormat.format(widget.battleRoom.finishTime.toDate())}'),
                        ],
                      ),
                      OriginalText(text: widget.battleRoom.city!.name),
                      OriginalText(
                        text: '${widget.battleRoom.capacity}名',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Wrap(
                          children: widget.battleRoom.dartsModels
                              .map((e) => Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            227, 243, 255, 1),
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              78, 165, 229, 1),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                        color: Color.fromRGBO(78, 165, 229, 1),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ))
                              .toList()),
                      const SizedBox(
                        height: 4,
                      ),
                      Wrap(
                          children: widget.battleRoom.fetures
                              .map((e) => Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            242, 246, 217, 1),
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              189, 208, 66, 1),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                        color: Color.fromRGBO(189, 208, 66, 1),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ))
                              .toList()),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              const Text(
                '詳細',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Container(
                  decoration: BoxDecoration(
                    color: OriginalTheme.themeData.dividerColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.battleRoom.detail.isEmpty
                                ? '未登録'
                                : widget.battleRoom.detail),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Text(
                '主催者',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  UserImage(
                    onTap: () async {
                      if (widget.battleRoom.ownerId == user!.id) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const MyPage()),
                          ),
                        );
                        return;
                      }
                      final appUser = await AppUserRepository.fetchAppUser(
                          widget.battleRoom.ownerId);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => UserPage(
                                appUser: appUser!,
                              )),
                        ),
                      );
                    },
                    imageUrl: widget.battleRoom.createrImage,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: 250,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.battleRoom.createrName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              widget.battleRoom.userId,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('フォロー${widget.battleRoom.followingCount}人',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                )),
                            const Text('/'),
                            Text('フォロワー${widget.battleRoom.followerCount}人',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  if (widget.battleRoom.ownerId != user!.id)
                    Icon(FeatherIcons.mail,
                        color: OriginalTheme.themeData.primaryColor),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: FutureBuilder<BattleRoomMemberType>(
                  future: getMemberType(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container();
                    }
                    return JoinRequestButton(
                      memberType: snapshot.data!,
                      roomId: widget.battleRoom.id,
                      joinRoom: joinRoom,
                      leaveRoom: leaveRoom,
                      requestJoinRoom: requestJoinRoom,
                      cancelRequestRoom: cancelRequestRoom,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JoinRequestButton extends StatelessWidget {
  const JoinRequestButton({
    Key? key,
    required this.memberType,
    required this.roomId,
    required this.joinRoom,
    required this.leaveRoom,
    required this.requestJoinRoom,
    required this.cancelRequestRoom,
  }) : super(key: key);

  final BattleRoomMemberType memberType;
  final String roomId;
  final Function joinRoom;
  final Function leaveRoom;
  final Function requestJoinRoom;
  final Function cancelRequestRoom;
  @override
  Widget build(BuildContext context) {
    switch (memberType) {
      case BattleRoomMemberType.owner:
        return Container();
      case BattleRoomMemberType.joined:
        return OriginalButton(
          onPressed: () async {
            leaveRoom();
          },
          text: '参加取り消し',
          primary: OriginalTheme.themeData.primaryColor,
          onPrimary: Colors.white,
        );
      case BattleRoomMemberType.joinable:
        return OriginalButton(
          onPressed: () async {
            joinRoom();
          },
          text: '今すぐ参加申し込み',
          primary: OriginalTheme.themeData.primaryColor,
          onPrimary: Colors.white,
        );
      case BattleRoomMemberType.beforeRequesting:
        return OriginalButton(
          onPressed: () async {
            requestJoinRoom();
          },
          text: '申し込み申請をする',
          primary: OriginalTheme.themeData.primaryColor,
          onPrimary: Colors.white,
        );
      case BattleRoomMemberType.requesting:
        return OriginalButton(
          onPressed: () async {
            cancelRequestRoom();
          },
          text: '申請取り消し',
          primary: OriginalTheme.themeData.primaryColor,
          onPrimary: Colors.white,
        );
    }
  }
}
