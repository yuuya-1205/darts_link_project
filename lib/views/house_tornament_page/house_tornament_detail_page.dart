// ignore_for_file: use_build_context_synchronously

import 'package:darts_link_project/components/follow_approve_button.dart';
import 'package:darts_link_project/components/header_image_url.dart';
import 'package:darts_link_project/components/original_button.dart';
import 'package:darts_link_project/components/text_components/original_label.dart';
import 'package:darts_link_project/components/text_components/original_text.dart';
import 'package:darts_link_project/models/house_tornament/house_tornament.dart';
import 'package:darts_link_project/models/house_tornament/house_tornament_join_request.dart';
import 'package:darts_link_project/models/house_tornament/house_tornament_member.dart';
import 'package:darts_link_project/repositories/app_user_repository.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/house_tornament/house_tornament_join_request.dart';
import 'package:darts_link_project/repositories/house_tornament/house_tornament_member_repository.dart';
import 'package:darts_link_project/repositories/house_tornament/house_tornament_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/house_tornament_page/edit_house_tornament_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:intl/intl.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class HouseTornamentDetailPage extends StatefulWidget {
  const HouseTornamentDetailPage({
    super.key,
    required this.houseTornament,
  });

  final HouseTornament houseTornament;

  @override
  State<HouseTornamentDetailPage> createState() =>
      _HouseTornamentDetailPageState();
}

class _HouseTornamentDetailPageState extends State<HouseTornamentDetailPage> {
  final user = AuthRepository.currentUser;
  Asset? asset;
  List<HouseTornamentMember> members = [];
  DateFormat dateFormat = DateFormat("yyyy年MM月dd日");
  DateFormat timeFormat = DateFormat("HH:mm");
  int count = 0;
  Future<void> fetchMembers() async {
    members = (await HouseTornamentMemberRepository.fetchHouseTornamentMembers(
        widget.houseTornament.houseTornamentId));

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

    final houseTornamentMember = HouseTornamentMember.fromAppUser(appUser);
    final canCreate =
        await HouseTournamentRepository.canCreateHouseTournamentMember(
            widget.houseTornament.houseTornamentId);

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
    await HouseTornamentMemberRepository.createHouseTornamentMember(
        houseTornamentId: widget.houseTornament.houseTornamentId,
        houseTornamentMember: houseTornamentMember);
    await updateNumberOfParticipants();
    members.add(houseTornamentMember);

    setState(() {});
  }

  Future<void> leaveRoom() async {
    final user = AuthRepository.currentUser;
    if (user == null) {
      return;
    }
    if (widget.houseTornament.isApproved == true) {
      HouseTornamentJoinRequestRepository.deleteHouseTornamentJoinRequest(
          houseTornamentId: widget.houseTornament.houseTornamentId,
          uid: user.id);
    }
    await HouseTornamentMemberRepository.leaveHouseTornamentMember(
        houseTornamentId: widget.houseTornament.houseTornamentId,
        memberId: user.id);
    await updateNumberOfParticipants();
    members.removeWhere((member) => member.uid == user.id);
    setState(() {});
  }

  Future<void> requestJoinRoom() async {
    final user = AuthRepository.currentUser;
    if (user == null) {
      return;
    }
    final houseTornamentJoinRequest =
        HouseTornamentJoinRequest.fromAppUser(user);
    await HouseTornamentJoinRequestRepository.createHouseTornamentJoinRequest(
        houseTornamentId: widget.houseTornament.houseTornamentId,
        houseTornamentJoinRequest: houseTornamentJoinRequest);
    setState(() {});
  }

  Future<void> cancelRequestRoom() async {
    final user = AuthRepository.currentUser;
    if (user == null) {
      return;
    }

    await HouseTornamentJoinRequestRepository.deleteHouseTornamentJoinRequest(
      houseTornamentId: widget.houseTornament.houseTornamentId,
      uid: user.id,
    );
    setState(() {});
  }

  Future<void> updateNumberOfParticipants() async {
    final memberDocsCount =
        await HouseTornamentMemberRepository.fetchHouseTornamentMemberDocsCount(
            widget.houseTornament.houseTornamentId);
    await HouseTournamentRepository.updateHouseTournament(
        widget.houseTornament.copyWith(numberOfParticipants: memberDocsCount));
  }

  Future<HouseTornamentMemberType> getMemberType() async {
    String? myUid = AuthRepository.currentUser!.id;
    // ignore: unnecessary_null_comparison
    if (myUid == null) {
      return HouseTornamentMemberType.joinable;
    }
    if (myUid == widget.houseTornament.ownerId) {
      return HouseTornamentMemberType.owner;
    }
    if (widget.houseTornament.isApproved == true) {
      final joinRequest = await HouseTornamentJoinRequestRepository
          .fetchHouseTornamentJoinRequest(
        houseTornamentId: widget.houseTornament.houseTornamentId,
        uid: myUid,
      );
      if (joinRequest == null) {
        return HouseTornamentMemberType.beforeRequesting;
      }
      if (joinRequest.status == HouseTornamentJoinRequestStatus.requesting) {
        return HouseTornamentMemberType.requesting;
      }
      return HouseTornamentMemberType.joined;
    }
    final isJoined = members.map((e) => e.uid).toList().contains(myUid);
    if (isJoined == true) {
      return HouseTornamentMemberType.joined;
    }
    return HouseTornamentMemberType.joinable;
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
          FutureBuilder<HouseTornamentMemberType>(
              future: getMemberType(),
              builder: (builder, snapshot) {
                return snapshot.data == HouseTornamentMemberType.owner
                    ? PopupMenuButton(onSelected: (value) {
                        if (value == '') {
                          final uid = AuthRepository.currentUser!.id;
                        }
                      }, itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            value: 'edit',
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) =>
                                        EditHouseTornamentPage(
                                            houseTornament:
                                                widget.houseTornament)),
                                  ),
                                );
                              },
                              child: const Text('編集'),
                            ),
                          ),
                          PopupMenuItem(
                            value: 'edit',
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) =>
                                        EditHouseTornamentPage(
                                            houseTornament:
                                                widget.houseTornament)),
                                  ),
                                );
                              },
                              child: const Text('申請/メンバーリスト'),
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
                                              onPressed: () async {
                                                await HouseTournamentRepository
                                                    .deleteHouseTournament(
                                                        widget.houseTornament);
                                                Navigator.pop(context);

                                                // DeleteSnackBar.showSnackBar(
                                                //     context);
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
              SizedBox(
                height: 205,
                width: double.infinity,
                child: HeaderImageUrl(
                    asset: asset,
                    headerImageUrl: widget.houseTornament.headerImage.isEmpty
                        ? ''
                        : widget.houseTornament.headerImage),
              ),
              Text(
                widget.houseTornament.title,
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
                      OriginalText(text: widget.houseTornament.place),
                      Row(
                        children: [
                          OriginalText(
                              text: dateFormat.format(
                                  widget.houseTornament.dateTime.toDate())),
                          OriginalText(
                              text:
                                  '${timeFormat.format(widget.houseTornament.startTime.toDate())}~${timeFormat.format(widget.houseTornament.finishTime.toDate())}'),
                        ],
                      ),
                      OriginalText(text: widget.houseTornament.city.toString()),
                      OriginalText(
                        text: '${widget.houseTornament.capacity}名',
                      ),
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
                            Text(widget.houseTornament.detail),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: FutureBuilder<HouseTornamentMemberType>(
                  future: getMemberType(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container();
                    }
                    return JoinRequestButton(
                      memberType: snapshot.data!,
                      roomId: widget.houseTornament.houseTornamentId,
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

  final HouseTornamentMemberType memberType;
  final String roomId;
  final Function joinRoom;
  final Function leaveRoom;
  final Function requestJoinRoom;
  final Function cancelRequestRoom;
  @override
  Widget build(BuildContext context) {
    switch (memberType) {
      case HouseTornamentMemberType.owner:
        return Container();
      case HouseTornamentMemberType.joined:
        return OriginalButton(
          onPressed: () async {
            leaveRoom();
          },
          text: '参加取り消し',
          primary: OriginalTheme.themeData.primaryColor,
          onPrimary: Colors.white,
        );
      case HouseTornamentMemberType.joinable:
        return OriginalButton(
          onPressed: () async {
            joinRoom();
          },
          text: '今すぐ参加申し込み',
          primary: OriginalTheme.themeData.primaryColor,
          onPrimary: Colors.white,
        );
      case HouseTornamentMemberType.beforeRequesting:
        return OriginalButton(
          onPressed: () async {
            requestJoinRoom();
          },
          text: '申し込み申請をする',
          primary: OriginalTheme.themeData.primaryColor,
          onPrimary: Colors.white,
        );
      case HouseTornamentMemberType.requesting:
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
