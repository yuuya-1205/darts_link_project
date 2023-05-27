// ignore_for_file: use_build_context_synchronously
import 'package:darts_link_project/components/original_button.dart';
import 'package:darts_link_project/models/circle/circle.dart';
import 'package:darts_link_project/models/circle/circle_join_request.dart';
import 'package:darts_link_project/models/circle/circle_member.dart';
import 'package:darts_link_project/repositories/app_user_repository.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/circle/circle_join_request_repository.dart';
import 'package:darts_link_project/repositories/circle/circle_member_repository.dart';
import 'package:darts_link_project/repositories/circle/circle_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:flutter/material.dart';

class CircleInfoPage extends StatefulWidget {
  const CircleInfoPage({
    Key? key,
    required this.circle,
  }) : super(key: key);
  final Circle circle;

  @override
  State<CircleInfoPage> createState() => _CircleInfoPageState();
}

class _CircleInfoPageState extends State<CircleInfoPage> {
  List<CircleMember> circleMembers = [];
  Future<void> fetchMembers() async {
    circleMembers = await CircleMemberRepository.fetchCircleMembers(
        circleId: widget.circle.circleId);
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
    final circleMember = CircleMember.fromAppUser(appUser);
    final canCreate = await CircleRepository.canCreateBattleRoomMember(
        widget.circle.circleId);

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
    await CircleMemberRepository.createCircleMember(
        circleId: widget.circle.circleId, circleMember: circleMember);
    await updateNumberOfParticipants();
    circleMembers.add(circleMember);

    setState(() {});
  }

  Future<void> leaveRoom() async {
    final user = AuthRepository.currentUser;
    if (user == null) {
      return;
    }
    if (widget.circle.isApproved == true) {
      CircleJoinRequestRepository.deleteCircleJoinRequest(
          circleId: widget.circle.circleId, uid: user.id);
    }
    await CircleMemberRepository.leaveCircleMember(
        circleId: widget.circle.circleId, circleMemberId: user.id);
    await updateNumberOfParticipants();
    circleMembers.removeWhere((circleMember) => circleMember.uid == user.id);
    setState(() {});
  }

  Future<void> requestJoinRoom() async {
    final user = AuthRepository.currentUser;
    if (user == null) {
      return;
    }
    final circleJoinRequest = CircleJoinRequest.fromAppUser(user);
    await CircleJoinRequestRepository.createCircleJoinRequest(
        circleId: widget.circle.circleId, circleJoinRequest: circleJoinRequest);
    setState(() {});
  }

  Future<void> cancelRequestRoom() async {
    final user = AuthRepository.currentUser;
    if (user == null) {
      return;
    }

    await CircleJoinRequestRepository.deleteCircleJoinRequest(
      uid: user.id,
      circleId: widget.circle.circleId,
    );
    setState(() {});
  }

  Future<void> updateNumberOfParticipants() async {
    final memberDocsCount = await CircleMemberRepository.fetchMemberDocsCount(
        widget.circle.circleId);
    await CircleRepository.updateCircle(
        widget.circle.copyWith(numberOfParticipants: memberDocsCount));
  }

  Future<CircleMemberType> getMemberType() async {
    final myUid = AuthRepository.currentUser!.id;

    if (myUid == widget.circle.ownerId) {
      return CircleMemberType.owner;
    }
    if (widget.circle.isApproved == true) {
      final circleJoinRequest =
          await CircleJoinRequestRepository.fetchCircleJoinRequest(
        circleId: widget.circle.circleId,
        uid: myUid,
      );
      if (circleJoinRequest == null) {
        return CircleMemberType.beforeRequesting;
      }
      if (circleJoinRequest.status == CircleJoinRequestStatus.requesting) {
        return CircleMemberType.requesting;
      }
      return CircleMemberType.joined;
    }
    final isJoined = circleMembers.map((e) => e.uid).toList().contains(myUid);
    if (isJoined == true) {
      return CircleMemberType.joined;
    }
    return CircleMemberType.joinable;
  }

  @override
  void initState() {
    fetchMembers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Text(
              'サークル紹介',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
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
                        Text(widget.circle.circleDetail),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: Text(
                  '写真',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              if (widget.circle.imageUrls.isNotEmpty)
                Wrap(
                    runSpacing: 20,
                    children: widget.circle.imageUrls
                        .asMap()
                        .entries
                        .map((entry) {
                          if (entry.key == 0) {
                            return null;
                          }
                          return SizedBox(
                              width: 120,
                              height: 50,
                              child: Image.network(entry.value));
                        })
                        .whereType<Widget>()
                        .toList()),
            ],
          ),
          const SizedBox(height: 32),
          Center(
            child: FutureBuilder<CircleMemberType>(
              future: getMemberType(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container();
                }
                return JoinRequestButton(
                  memberType: snapshot.data!,
                  roomId: widget.circle.circleId,
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

  final CircleMemberType memberType;
  final String roomId;
  final Function joinRoom;
  final Function leaveRoom;
  final Function requestJoinRoom;
  final Function cancelRequestRoom;
  @override
  Widget build(BuildContext context) {
    switch (memberType) {
      case CircleMemberType.owner:
        return Container();
      case CircleMemberType.joined:
        return OriginalButton(
          onPressed: () async {
            leaveRoom();
          },
          text: 'グループを抜ける',
          primary: OriginalTheme.themeData.primaryColor,
          onPrimary: Colors.white,
        );
      case CircleMemberType.joinable:
        return OriginalButton(
          onPressed: () async {
            joinRoom();
          },
          text: 'グループに参加する',
          primary: OriginalTheme.themeData.primaryColor,
          onPrimary: Colors.white,
        );
      case CircleMemberType.beforeRequesting:
        return OriginalButton(
          onPressed: () async {
            requestJoinRoom();
          },
          text: 'グループ参加申請をする',
          primary: OriginalTheme.themeData.primaryColor,
          onPrimary: Colors.white,
        );
      case CircleMemberType.requesting:
        return OriginalButton(
          onPressed: () async {
            cancelRequestRoom();
          },
          text: 'グループ参加申請取り消す',
          primary: OriginalTheme.themeData.primaryColor,
          onPrimary: Colors.white,
        );
    }
  }
}
