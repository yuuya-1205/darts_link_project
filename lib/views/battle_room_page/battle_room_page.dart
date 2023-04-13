import 'package:darts_link_project/models/battle_room.dart';
import 'package:darts_link_project/models/sort_state.dart';
import 'package:darts_link_project/models/sort_type.dart';
import 'package:darts_link_project/repositories/battle_room/battle_room_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/battle_room_page/create_battle_room_page.dart';
import 'package:darts_link_project/views/home_page/components/sort_box.dart';
import 'package:flutter/material.dart';

import '../components/battle_room/battle_room_list_view.dart';
import '../sort_page/sort_battle_room_select_page.dart';

class BattleRoomPage extends StatefulWidget {
  const BattleRoomPage({Key? key}) : super(key: key);

  @override
  State<BattleRoomPage> createState() => _BattleRoomPageState();
}

class _BattleRoomPageState extends State<BattleRoomPage> {
  SortState? sortState;

  Future<void> navigateSortPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SortBattleRoomSelectPage()),
    ) as SortState?;
    setState(() {
      sortState = result;
    });
  }

  List<BattleRoom> sortBattleRoom(List<BattleRoom> battleRooms) {
    if (sortState == null) return battleRooms;
    if (sortState!.pref != null) {
      battleRooms = battleRooms.where((element) {
        return element.prefecture == sortState!.pref;
      }).toList();
    }
    if (sortState!.city != null) {
      battleRooms = battleRooms.where((element) {
        return element.city == sortState!.city;
      }).toList();
    }
    if (sortState!.date != null) {
      battleRooms = battleRooms.where((element) {
        return element.dateTime.toDate() == sortState!.date;
      }).toList();
    }
    if (sortState!.isRecruitment) {
      battleRooms = battleRooms.where((element) {
        return element.capacity > element.numberOfParticipants;
      }).toList();
    }
    return battleRooms;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SortBox(sortType: SortType.area, onTap: navigateSortPage),
                  const SizedBox(width: 16),
                  SortBox(sortType: SortType.date, onTap: navigateSortPage),
                  const SizedBox(width: 16),
                  SortBox(sortType: SortType.isOpen, onTap: navigateSortPage),
                ],
              ),
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
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Row(
                        children: [
                          const Text(
                            '募集中の対戦者募集',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(
                            '${sortBattleRoom(battleRooms).length}',
                            style: TextStyle(
                                fontSize: 25,
                                color: OriginalTheme.themeData.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '件',
                            style: TextStyle(
                              fontSize: 18,
                              color: OriginalTheme.themeData.disabledColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    BattleRoomListView(
                      battleRooms: sortBattleRoom(battleRooms),
                    ),
                  ],
                );
              },
            ),
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
        child: const Icon(Icons.add),
      ),
    );
  }
}
