import 'package:darts_link_project/views/battle_room_page/battle_room_page.dart';
import 'package:darts_link_project/views/circle_page/circle_page.dart';
import 'package:darts_link_project/views/darts_bar_page/darts_bar_page.dart';
import 'package:darts_link_project/views/house_tornament_page/house_tornament_page.dart';
import 'package:flutter/material.dart';

enum HomePageTabType {
  battleRooms('対戦車募集', BattleRoomPage()),
  circles('サークル', CirclePage()),
  houseTournaments('ハウトー', HouseTournamentPage()),
  tenantOwners('ダーツバー', DartsBarPage());

  const HomePageTabType(this.title, this.view);
  final String title;
  final Widget view;
}
