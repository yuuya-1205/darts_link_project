import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/models/house_tornament/house_tournament.dart';
import 'package:darts_link_project/models/sort_type.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/house_tornament/house_tornament_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/components/house_tournament/house_tournament_list_view.dart';
import 'package:darts_link_project/views/house_tornament_page/create_house_tornament_page.dart';
import 'package:flutter/material.dart';

import '../../models/sort_state.dart';
import '../home_page/components/sort_box.dart';
import '../sort_page/sort_house_tournament_select_page.dart';

class HouseTournamentPage extends StatefulWidget {
  const HouseTournamentPage({Key? key}) : super(key: key);

  @override
  State<HouseTournamentPage> createState() => _HouseTournamentPageState();
}

class _HouseTournamentPageState extends State<HouseTournamentPage> {
  SortState? sortState;

  Future<void> navigateSortPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SortHouseTournamentSelectPage()),
    ) as SortState?;
    setState(() {
      sortState = result;
    });
  }

  List<HouseTournament> sortHouseTournament(
      List<HouseTournament> houseTournaments) {
    if (sortState == null) return houseTournaments;
    if (sortState!.pref != null) {
      houseTournaments = houseTournaments.where((element) {
        return element.prefecture == sortState!.pref;
      }).toList();
    }
    if (sortState!.city != null) {
      houseTournaments = houseTournaments.where((element) {
        return element.city == sortState!.city;
      }).toList();
    }
    if (sortState!.date != null) {
      houseTournaments = houseTournaments.where((element) {
        return element.dateTime.toDate() == sortState!.date;
      }).toList();
    }
    if (sortState!.isRecruitment) {
      houseTournaments = houseTournaments.where((element) {
        return element.capacity > element.numberOfParticipants;
      }).toList();
    }
    if (sortState!.dartsModels != null) {
      houseTournaments = houseTournaments.where((houseTournament) {
        var isContains = true;
        for (var element in sortState!.dartsModels!) {
          isContains = houseTournament.dartsModels.contains(element);
          if (!isContains) {
            break;
          }
        }
        return isContains;
      }).toList();
    }

    return houseTournaments;
  }

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SortBox(sortType: SortType.area, onTap: navigateSortPage),
                  const SizedBox(width: 16),
                  SortBox(sortType: SortType.date, onTap: navigateSortPage),
                  const SizedBox(width: 16),
                  SortBox(sortType: SortType.isOpen, onTap: navigateSortPage),
                  const SizedBox(width: 16),
                  SortBox(sortType: SortType.genre, onTap: navigateSortPage),
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
                                '${sortHouseTournament(houseTournaments).length}',
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
                        HouseTournamentListView(
                            houseTournaments:
                                sortHouseTournament(houseTournaments)),
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
