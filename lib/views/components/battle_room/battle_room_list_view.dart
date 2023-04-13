import 'package:darts_link_project/models/battle_room.dart';
import 'package:darts_link_project/views/components/battle_room/battle_room_list_item_view.dart';
import 'package:flutter/material.dart';

class BattleRoomListView extends StatelessWidget {
  const BattleRoomListView({
    required this.battleRooms,
    Key? key,
  }) : super(key: key);
  final List<BattleRoom> battleRooms;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: battleRooms.length,
      itemBuilder: (_, index) => Padding(
        padding: EdgeInsets.only(top: index == 0 ? 16 : 0, bottom: 16),
        child: BattleRoomListItemView(battleRoom: battleRooms[index]),
      ),
    );
  }
}
