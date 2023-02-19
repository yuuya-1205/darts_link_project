import 'package:darts_link_project/components/sort_box/area_box.dart';
import 'package:darts_link_project/components/sort_box/date_time_box.dart';
import 'package:darts_link_project/components/sort_box/event_box.dart';
import 'package:darts_link_project/components/sort_box/recruit_box.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/models/house_tornament/house_tornament.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/house_tornament/house_tornament_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/house_tornament_page/create_house_tornament_page.dart';
import 'package:darts_link_project/views/house_tornament_page/house_tornament_card.dart';
import 'package:flutter/material.dart';

class HouseTornamentPage extends StatefulWidget {
  const HouseTornamentPage({Key? key}) : super(key: key);

  @override
  State<HouseTornamentPage> createState() => _HouseTornamentPageState();
}

class _HouseTornamentPageState extends State<HouseTornamentPage> {
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
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const AreaBox(),
                  const DateTimeBox(),
                  const RecruitBox(),
                  const EventBox(),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              StreamBuilder<List<HouseTornament>>(
                  stream: HouseTornamentRepository.houseTornamentStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.active) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (!snapshot.hasData) {
                      return Container();
                    }

                    final houseTornaments = snapshot.data;
                    if (houseTornaments!.isEmpty) {
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
                                '${houseTornaments.length}',
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
                            itemCount: houseTornaments.length,
                            itemBuilder: (context, index) {
                              final houseTornament = houseTornaments[index];
                              return HouseTornamentCard(
                                houseTornament: houseTornament,
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
                      builder: ((context) => const CreateHouseTornamentPage()),
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
