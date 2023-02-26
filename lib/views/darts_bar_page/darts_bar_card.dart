import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DartsBarCard extends StatelessWidget {
  const DartsBarCard({
    Key? key,
    required this.storeOwner,
  }) : super(key: key);

  final StoreOwner storeOwner;

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("MM月dd日");
    DateFormat timeFormat = DateFormat("HH:mm");
    return GestureDetector(
      onTap: () async {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: ((context) => BattleRoomDetailPage(
        //           battleRoom: battleRoom,
        //         )),
        //   ),
        // );
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
                    imageUrl: storeOwner.userImage,
                    uid: storeOwner.id),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 14, 0, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      storeOwner.userName,
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
                          storeOwner.city.toString(),
                          style: const TextStyle(
                              color: Color.fromRGBO(210, 48, 125, 1)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
