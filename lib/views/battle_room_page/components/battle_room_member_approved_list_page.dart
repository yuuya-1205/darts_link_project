import 'package:darts_link_project/models/battle_room.dart';
import 'package:darts_link_project/models/join_request.dart';
import 'package:darts_link_project/repositories/battle_room/battle_room_join_request_repository.dart';
import 'package:darts_link_project/views/battle_room_page/components/battle_room_member_approve_card.dart';
import 'package:flutter/material.dart';

class BattleRoomMemberApprovedListPage extends StatefulWidget {
  const BattleRoomMemberApprovedListPage({super.key, required this.battleRoom});

  final BattleRoom battleRoom;

  @override
  State<BattleRoomMemberApprovedListPage> createState() =>
      _BattleRoomMemberApprovedListPageState();
}

class _BattleRoomMemberApprovedListPageState
    extends State<BattleRoomMemberApprovedListPage> {
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
          child: Row(children: [
            Container(
              width: 30,
              child: const BackButton(),
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
        title: const Text(
          '申請リスト',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<List<JoinRequest>>(
          stream:
              BattleRoomJoinRequestRepository.battleRoomJoinRequestListStream(
                  battleRoomId: widget.battleRoom.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.active) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return Container();
            }
            final battleRoomJoinRequests = snapshot.data;
            if (battleRoomJoinRequests!.isEmpty) {
              return const Center(
                child: Text('まだ、申請者がいません'),
              );
            }

            return ListView.builder(
                itemCount: battleRoomJoinRequests.length,
                itemBuilder: (context, index) {
                  final battleRoomJoinRequest = battleRoomJoinRequests[index];
                  return BattleRoomMemberApproveListCard(
                    joinRequest: battleRoomJoinRequest,
                  );
                });
          }),
    );
  }
}
