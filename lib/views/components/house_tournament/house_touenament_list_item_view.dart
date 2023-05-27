import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/extensions/date_time_extension.dart';
import 'package:darts_link_project/models/house_tornament/house_tournament.dart';
import 'package:darts_link_project/views/house_tornament_page/house_tornament_detail_page.dart';
import 'package:flutter/material.dart';

class HouseTournamentListItemView extends StatelessWidget {
  const HouseTournamentListItemView({required this.houseTournament, Key? key})
      : super(key: key);
  final HouseTournament houseTournament;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => HouseTournamentDetailPage(
                  houseTournament: houseTournament,
                )),
          ),
        );
      },
      child: Row(
        children: [
          UserImage(size: 64, imageUrl: houseTournament.creatorImage),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${houseTournament.dateTime.toDate().formatStartDate}${houseTournament.startTime.toDate().formatHhMm}~${houseTournament.finishTime.toDate().formatHhMm}',
                style: const TextStyle(color: Colors.grey),
              ),
              Text(
                houseTournament.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Color.fromRGBO(210, 48, 125, 1),
                  ),
                  Text(
                    houseTournament.place,
                    style:
                        const TextStyle(color: Color.fromRGBO(210, 48, 125, 1)),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
