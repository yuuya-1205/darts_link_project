import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/models/battle_room.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/battle_room_page/battle_room_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BattleRoomCard extends StatelessWidget {
  const BattleRoomCard({
    Key? key,
    required this.battleRoom,
  }) : super(key: key);

  final BattleRoom battleRoom;

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("MM月dd日");
    DateFormat timeFormat = DateFormat("HH:mm");
    return GestureDetector(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => BattleRoomDetailPage(
                  battleRoom: battleRoom,
                )),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: const Color.fromRGBO(232, 232, 232, 1))),
          height: 120,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 23, 0, 23),
                child: UserImage(
                    height: 64,
                    width: 64,
                    imageUrl: battleRoom.createrImage,
                    uid: battleRoom.ownerId),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 14, 0, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(dateFormat.format(battleRoom.dateTime.toDate())),
                        Text(timeFormat.format(battleRoom.startTime.toDate())),
                        const Text('~'),
                        Text(timeFormat.format(battleRoom.finishTime.toDate())),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      battleRoom.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Color.fromRGBO(210, 48, 125, 1),
                        ),
                        Text(
                          battleRoom.place.isEmpty ? '未登録' : battleRoom.place,
                          style: const TextStyle(
                              color: Color.fromRGBO(210, 48, 125, 1)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${battleRoom.numberOfParticipants}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: OriginalTheme.themeData.primaryColor,
                      ),
                    ),
                    Text(
                      '/' '${battleRoom.capacity}人',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: OriginalTheme.themeData.disabledColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
