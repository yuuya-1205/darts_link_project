import 'package:darts_link_project/banner_ad_view.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/battle_room_page/battle_room_page.dart';
import 'package:darts_link_project/views/circle_page/circle_page.dart';
import 'package:darts_link_project/views/darts_bar_page/darts_bar_page.dart';
import 'package:darts_link_project/views/house_tornament_page/house_tornament_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, Widget> tabPageMaps = {
    '対戦者募集': const BattleRoomPage(),
    'サークル': const CirclePage(),
    'ハウトー': const HouseTournamentPage(),
    'ダーツバー': const DartsBarPage(),
  };
  final user = AuthRepository.currentUser;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabPageMaps.length,
      child: Column(
        children: [
          const BannerAdView(),
          TabBar(
              indicatorColor: OriginalTheme.themeData.primaryColor,
              labelColor: OriginalTheme.themeData.primaryColor,
              unselectedLabelColor: OriginalTheme.themeData.disabledColor,
              labelStyle: const TextStyle(fontSize: 12),
              tabs: tabPageMaps.keys
                  .map((e) => Tab(
                        text: e,
                      ))
                  .toList()),
          Expanded(
            child: TabBarView(children: tabPageMaps.values.toList()),
          ),
        ],
      ),
    );
  }
}
