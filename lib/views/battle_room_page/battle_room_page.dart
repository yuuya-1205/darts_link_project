import 'package:darts_link_project/components/sort_box/area_box.dart';
import 'package:darts_link_project/components/sort_box/date_time_box.dart';
import 'package:darts_link_project/components/sort_box/recruit_box.dart';
import 'package:darts_link_project/models/battle_room.dart';
import 'package:darts_link_project/repositories/battle_room/battle_room_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/battle_room_page/battle_room_card.dart';
import 'package:darts_link_project/views/battle_room_page/create_battle_room_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BattleRoomPage extends StatefulWidget {
  const BattleRoomPage({Key? key}) : super(key: key);

  @override
  State<BattleRoomPage> createState() => _BattleRoomPageState();
}

class _BattleRoomPageState extends State<BattleRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: AreaBox(),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                  child: DateTimeBox(),
                ),
                const RecruitBox(),
              ],
            ),
            StreamBuilder<List<BattleRoom>>(
                stream: BattleRoomRepository.battleRoomStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.active) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (!snapshot.hasData) {
                    return Container();
                  }
                  final battleRooms = snapshot.data;
                  if (battleRooms!.isEmpty) {
                    return const Center(
                      child: Text('まだ、投稿がありません'),
                    );
                  }
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: battleRooms.length,
                      itemBuilder: (context, index) {
                        final battleRoom = battleRooms[index];
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                          child: BattleRoomCard(battleRoom: battleRoom),
                        );
                      });
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: OriginalTheme.themeData.primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const CreateBattleRoomPage()),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
