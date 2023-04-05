import 'package:darts_link_project/components/sort_box/area_box.dart';
import 'package:darts_link_project/components/sort_box/date_time_box.dart';
import 'package:darts_link_project/components/sort_box/event_box.dart';
import 'package:darts_link_project/components/sort_box/recruit_box.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/models/house_tornament/house_tournament.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/house_tornament/house_tornament_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/house_tornament_page/create_house_tornament_page.dart';
import 'package:darts_link_project/views/house_tornament_page/house_tornament_card.dart';
import 'package:flutter/material.dart';

class HouseTournamentPage extends StatefulWidget {
  const HouseTournamentPage({Key? key}) : super(key: key);

  @override
  State<HouseTournamentPage> createState() => _HouseTournamentPageState();
}

class _HouseTournamentPageState extends State<HouseTournamentPage> {
  @override
  Widget build(BuildContext context) {
    final user = AuthRepository.currentUser;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  AreaBox(),
                  DateTimeBox(),
                  RecruitBox(),
                  EventBox(),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              StreamBuilder<List<HouseTournament>>(
                  stream: HouseTournamentRepository.houseTournamentStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.active) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (!snapshot.hasData) {
                      return Container();
                    }

                    final houseTournaments = snapshot.data;
                    if (houseTournaments!.isEmpty) {
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
                                '募集中のハウストーナメント',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Text(
                                '${houseTournaments.length}',
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
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: houseTournaments.length,
                            itemBuilder: (context, index) {
                              final houseTournament = houseTournaments[index];
                              return HouseTournamentCard(
                                houseTournament: houseTournament,
                              );
                            }),
                      ],
                    );
                  }),
            ],
          ),
        ),
        floatingActionButton: user is StoreOwner
            ? FloatingActionButton(
                backgroundColor: OriginalTheme.themeData.primaryColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const CreateHouseTournamentPage()),
                    ),
                  );
                },
                child: const Icon(
                  Icons.add,
                ),
              )
            : Container());
  }
}
