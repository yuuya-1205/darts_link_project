import 'package:darts_link_project/models/member.dart';
import 'package:flutter/material.dart';

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
        return ElevatedButton(
          onPressed: () async {
            leaveRoom();
          },
          child: const Text('参加取り消し'),
        );
      case BattleRoomMemberType.joinable:
        return ElevatedButton(
          onPressed: () async {
            joinRoom();
          },
          child: const Text('今すぐ参加申し込み'),
        );
      case BattleRoomMemberType.beforeRequesting:
        return ElevatedButton(
          onPressed: () async {
            requestJoinRoom();
          },
          child: const Text('申し込み申請をする'),
        );
      case BattleRoomMemberType.requesting:
        return ElevatedButton(
          onPressed: () async {
            cancelRequestRoom();
          },
          child: const Text('申請取り消し'),
        );
    }
  }
}
