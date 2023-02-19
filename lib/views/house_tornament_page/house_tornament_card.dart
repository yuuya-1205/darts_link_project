import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/models/house_tornament/house_tornament.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/house_tornament_page/house_tornament_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HouseTornamentCard extends StatelessWidget {
  const HouseTornamentCard({
    super.key,
    required this.houseTornament,
  });

  final HouseTornament houseTornament;

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("MM月dd日");
    DateFormat timeFormat = DateFormat("HH:mm");
    return GestureDetector(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => HouseTornamentDetailPage(
                  houseTornament: houseTornament,
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
                    imageUrl: houseTornament.createrImage,
                    uid: houseTornament.ownerId),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 14, 0, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          dateFormat.format(houseTornament.dateTime.toDate()),
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Text(
                          timeFormat.format(houseTornament.startTime.toDate()),
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const Text(
                          '~',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      houseTornament.title,
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
                          houseTornament.place,
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
                      '${houseTornament.numberOfParticipants}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: OriginalTheme.themeData.primaryColor,
                      ),
                    ),
                    Text(
                      '/' '${houseTornament.capacity}人',
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
