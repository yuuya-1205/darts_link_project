// ignore_for_file: use_build_context_synchronously

import 'package:darts_link_project/components/follow_approve_button.dart';
import 'package:darts_link_project/components/header_image_url.dart';
import 'package:darts_link_project/components/original_button.dart';
import 'package:darts_link_project/components/text_components/original_label.dart';
import 'package:darts_link_project/components/text_components/original_text.dart';
import 'package:darts_link_project/models/house_tornament/house_tornament_join_request.dart';
import 'package:darts_link_project/models/house_tornament/house_tornament_member.dart';
import 'package:darts_link_project/models/house_tornament/house_tournament.dart';
import 'package:darts_link_project/repositories/app_user_repository.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/house_tornament/house_tornament_join_request.dart';
import 'package:darts_link_project/repositories/house_tornament/house_tornament_member_repository.dart';
import 'package:darts_link_project/repositories/house_tornament/house_tornament_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/house_tornament_page/edit_house_tornament_page.dart';
import 'package:darts_link_project/views/house_tornament_page/house_tornament_approve_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:intl/intl.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class HouseTournamentDetailPage extends StatefulWidget {
  const HouseTournamentDetailPage({
    super.key,
    required this.houseTournament,
  });

  final HouseTournament houseTournament;

  @override
  State<HouseTournamentDetailPage> createState() =>
      _HouseTournamentDetailPageState();
}

class _HouseTournamentDetailPageState extends State<HouseTournamentDetailPage> {
  final user = AuthRepository.currentUser;
  Asset? asset;
  List<HouseTornamentMember> members = [];
  DateFormat dateFormat = DateFormat("yyyy年MM月dd日");
  DateFormat timeFormat = DateFormat("HH:mm");
  int count = 0;
  Future<void> fetchMembers() async {
    members = (await HouseTornamentMemberRepository.fetchHouseTornamentMembers(
        widget.houseTournament.houseTournamentId));

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

    final houseTournamentMember = HouseTornamentMember.fromAppUser(appUser);
    final canCreate =
        await HouseTournamentRepository.canCreateHouseTournamentMember(
            widget.houseTournament.houseTournamentId);

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
        houseTornamentId: widget.houseTournament.houseTournamentId,
        houseTornamentMember: houseTournamentMember);
    await updateNumberOfParticipants();
    members.add(houseTournamentMember);

    setState(() {});
  }

  Future<void> leaveRoom() async {
    final user = AuthRepository.currentUser;
    if (user == null) {
      return;
    }
    if (widget.houseTournament.isApproved == true) {
      HouseTornamentJoinRequestRepository.deleteHouseTornamentJoinRequest(
          houseTornamentId: widget.houseTournament.houseTournamentId,
          uid: user.id);
    }
    await HouseTornamentMemberRepository.leaveHouseTornamentMember(
        houseTornamentId: widget.houseTournament.houseTournamentId,
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
    final houseTournamentJoinRequest =
        HouseTornamentJoinRequest.fromAppUser(user);
    await HouseTornamentJoinRequestRepository.createHouseTornamentJoinRequest(
        houseTornamentId: widget.houseTournament.houseTournamentId,
        houseTornamentJoinRequest: houseTournamentJoinRequest);
    setState(() {});
  }

  Future<void> cancelRequestRoom() async {
    final user = AuthRepository.currentUser;
    if (user == null) {
      return;
    }

    await HouseTornamentJoinRequestRepository.deleteHouseTornamentJoinRequest(
      houseTornamentId: widget.houseTournament.houseTournamentId,
      uid: user.id,
    );
    setState(() {});
  }

  Future<void> updateNumberOfParticipants() async {
    final memberDocsCount =
        await HouseTornamentMemberRepository.fetchHouseTornamentMemberDocsCount(
            widget.houseTournament.houseTournamentId);
    await HouseTournamentRepository.updateHouseTournament(
        widget.houseTournament.copyWith(numberOfParticipants: memberDocsCount));
  }

  Future<HouseTornamentMemberType> getMemberType() async {
    final myUid = AuthRepository.currentUser!.id;
    if (myUid == widget.houseTournament.ownerReference.id) {
      return HouseTornamentMemberType.owner;
    }
    if (widget.houseTournament.isApproved == true) {
      final joinRequest = await HouseTornamentJoinRequestRepository
          .fetchHouseTornamentJoinRequest(
        houseTornamentId: widget.houseTournament.houseTournamentId,
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
        actions: [
          FutureBuilder<HouseTornamentMemberType>(
              future: getMemberType(),
              builder: (builder, snapshot) {
                return snapshot.data == HouseTornamentMemberType.owner
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
                                      builder: ((context) =>
                                          EditHouseTournamentPage(
                                              houseTournament:
                                                  widget.houseTournament)),
                                    ),
                                  );
                                },
                                child: const Text('編集'),
                              ),
                            ),
                            PopupMenuItem(
                              value: 'approved',
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          HouseTornamentApprovePage(
                                              houseTournament:
                                                  widget.houseTournament)),
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
                                                          widget
                                                              .houseTournament);
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
                    headerImageUrl: widget.houseTournament.headerImage.isEmpty
                        ? ''
                        : widget.houseTournament.headerImage),
              ),
              Text(
                widget.houseTournament.title,
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
                          text: widget.houseTournament.place.isEmpty
                              ? '未登録'
                              : widget.houseTournament.place),
                      Row(
                        children: [
                          OriginalText(
                              text: dateFormat.format(
                                  widget.houseTournament.dateTime.toDate())),
                          OriginalText(
                              text:
                                  '${timeFormat.format(widget.houseTournament.startTime.toDate())}~${timeFormat.format(widget.houseTournament.finishTime.toDate())}'),
                        ],
                      ),
                      OriginalText(text: widget.houseTournament.city!.name),
                      OriginalText(
                        text: '${widget.houseTournament.capacity}名',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Wrap(
                          children: widget.houseTournament.dartsModels
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
                                      e.label,
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
                          children: widget.houseTournament.features
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
                            Text(widget.houseTournament.detail),
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
                      roomId: widget.houseTournament.houseTournamentId,
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
