import 'package:darts_link_project/models/battle_room.dart';
import 'package:darts_link_project/models/member.dart';
import 'package:darts_link_project/repositories/battle_room/battle_room_member_repository.dart';
import 'package:darts_link_project/views/battle_room_page/components/battle_room_member_list_card.dart';
import 'package:flutter/material.dart';

class BattleRoomMemberListPage extends StatefulWidget {
  const BattleRoomMemberListPage({
    Key? key,
    required this.battleRoom,
  }) : super(key: key);

  final BattleRoom battleRoom;

  @override
  State<BattleRoomMemberListPage> createState() =>
      _BattleRoomMemberListPageState();
}

class _BattleRoomMemberListPageState extends State<BattleRoomMemberListPage> {
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
      ),
      body: StreamBuilder<List<Member>>(
          stream: BattleRoomMemberRepository.memberStream(
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
            final battleRoomMembers = snapshot.data;
            if (battleRoomMembers!.isEmpty) {
              return const Center(
                child: Text('まだ、メンバーがいません'),
              );
            }

            return ListView.builder(
                itemCount: battleRoomMembers.length,
                itemBuilder: (context, index) {
                  final battleRoomMember = battleRoomMembers[index];
                  return BattleRoomMemberListCard(
                    member: battleRoomMember,
                    battleRoom: widget.battleRoom,
                  );
                });
          }),
    );
  }
}
